let tags: [Tag] = [.binSearch]

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return nums.binarySearch(predicate: { $0 < target })
    }
}

let f = Solution().searchInsert

f([1, 3, 5, 6], 5)
f([1, 3, 5, 6], 2)
f([1, 3, 5, 6], 0)
f([1, 3, 5, 6], 8)
