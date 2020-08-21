let tags: [Tag] = [.array, .hash]

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var subsets = [[Int]()]
        for num in nums { subsets += subsets.map { $0 + [num] } }
        return Array(Set(subsets))
    }
}

let f = Solution().subsetsWithDup

f([1, 2, 2])
f([1, 1, 1])
f([])
f([0, 1, 2, 3])
f([4, 4, 4, 1, 4]).count == 10
