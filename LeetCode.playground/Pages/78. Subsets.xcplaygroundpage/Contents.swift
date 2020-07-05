let tags: [Tag] = [.bit]

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[]] }
        let N = nums.count
        let masks = (1..<N).reduce(into: [1]) { arr, _ in arr.append(arr.last! << 1) }
        var powerSets = [[Int]]()
        for i in 0..<(1 << N) {
            var set = [Int]()
            for (j, mask) in masks.enumerated() where mask & i != 0 {
                set.append(nums[j])
            }
            powerSets.append(set)
        }
        return powerSets
    }
}

Solution().subsets([])
Solution().subsets([6])
Solution().subsets([1, 2, 3])
