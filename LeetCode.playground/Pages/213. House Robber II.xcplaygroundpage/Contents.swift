let tags: [Tag] = [.dp, .ON]

class Solution {
    func worker(_ nums: ArraySlice<Int>) -> Int {
        var (include, exclude) = (0, 0)
        for num in nums { (include, exclude) = (exclude + num, max(include, exclude)) }
        return max(include, exclude)
    }
    
    func rob(_ nums: [Int]) -> Int {
        return max(worker(nums.dropFirst()), worker(nums.dropLast()), nums.first ?? 0)
    }
}


let f = Solution().rob
f([2, 3, 2])
f([1, 2, 3, 1])
f([1])
