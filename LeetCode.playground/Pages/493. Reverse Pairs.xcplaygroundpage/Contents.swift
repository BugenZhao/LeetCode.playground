/*:
 Count **important** reverse pairs (`i < j, nums[i] > 2 * nums[j]`) by two pointers.
 - Use merge sort to ensure the correctness of 2 ptrs
 - Note that we use `<`, instead of `lhs <= 2 * rhs`, which is impossible
 - Divide & Conquer actually
 */
let tags: [Tag] = [.sort, .twoPtrs, .dq]

class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        var nums = nums
        var tmp = nums
        var count = 0

        func worker(_ lo: Int, _ hi: Int) {
            switch hi - lo + 1 {
            case 0, 1:
                return
            default:
                let mid = lo + (hi - lo) / 2
                worker(lo, mid)
                worker(mid + 1, hi)

                //: count before merge, using **two pointers**
                var j = mid + 1
                for i in lo...mid {
                    while j <= hi, nums[i] > 2 * nums[j] { j += 1 }
                    count += j - mid - 1
                }

                //: then merge
                let _ = {
                    var (i, j) = (lo, mid + 1)
                    var cur = lo

                    while i <= mid, j <= hi {
                        if nums[i] <= nums[j] { tmp[cur] = nums[i]; i += 1 }
                        else { tmp[cur] = nums[j]; j += 1 }
                        cur += 1
                    }

                    while i <= mid { tmp[cur] = nums[i]; i += 1; cur += 1 }
                    while j <= hi { tmp[cur] = nums[j]; j += 1; cur += 1 }

                    nums[lo...hi] = tmp[lo...hi]
                }()
            }
        }

        worker(0, nums.count - 1)
        return count
    }
}

let f = Solution().reversePairs

f([1, 3, 2, 3, 1])
f([2, 4, 3, 5, 1])
