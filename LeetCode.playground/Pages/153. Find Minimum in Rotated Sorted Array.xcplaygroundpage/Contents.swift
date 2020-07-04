let tags: [Tag] = [.binSearch]

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var lo = nums.startIndex
        var hi = nums.endIndex - 1
        while lo != hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] > nums[hi] {
                lo = mid + 1
            } else {
                hi = mid
            }
        }
        return nums[lo]
    }
}

let f = Solution().findMin

f([3, 4, 5, 1, 2])
let arr = [1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7]
(0..<7).allSatisfy { i in
    let slice = [Int](arr[i..<i + 7])
    return f(slice) == 1
}
