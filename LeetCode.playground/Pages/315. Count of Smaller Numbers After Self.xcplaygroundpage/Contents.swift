//: Count inverse pairs by merge sort
let tags: [Tag] = [.sort, .marked]

class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var nums = Array(nums.map { -$0 }.reversed().enumerated()) //: use rev-neg, **keeping the index**
        var counts = nums.map { _ in 0 } //: `counts[i]`: # of larger numbers on the left of `nums[index]`

        //: count inverse pairs by merge sort `<`
        //: we may also sort by `>` to avoid redundant reversing and negating
        var tmp = nums
        func worker(_ lo: Int, _ hi: Int) {
            switch hi - lo + 1 {
            case 0, 1:
                return
            case 2:
                if nums[lo].1 > nums[hi].1 {
                    counts[nums[hi].0] += 1 //: use original index
                    nums.swapAt(lo, hi)
                }
            default:
                let mid = lo + (hi - lo) / 2
                worker(lo, mid)
                worker(mid + 1, hi)

                var (i, j) = (lo, mid + 1)
                var cur = lo

                while i <= mid, j <= hi {
                    if nums[i].1 <= nums[j].1 { tmp[cur] = nums[i]; i += 1 }
                    else { //: `nums[i].1 > nums[j].1`: all nums in `nums[i...mid]` are larger than `nums[j]`
                        tmp[cur] = nums[j]
                        counts[tmp[cur].0] += mid - i + 1
                        j += 1
                    }
                    cur += 1
                }

                while i <= mid { tmp[cur] = nums[i]; i += 1; cur += 1 }
                while j <= hi {
                    tmp[cur] = nums[j]
                    counts[tmp[cur].0] += mid - i + 1
                    j += 1
                    cur += 1
                }

                nums[lo...hi] = tmp[lo...hi]
            }
        }
        worker(0, nums.count - 1)

        return counts.reversed()
    }
}

let f = Solution().countSmaller
f([5, 2, 6, 1])
f([1, 1, 1, 1])
f([4, 3, 2, 1])
