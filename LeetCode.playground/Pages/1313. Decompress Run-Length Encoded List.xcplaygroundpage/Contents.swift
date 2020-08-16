class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        let pairs = stride(from: 0, to: nums.count, by: 2).map { i in (nums[i], nums[i + 1]) }
        return pairs.reduce(into: []) { $0 += [Int](repeating: $1.1, count: $1.0) }
    }
}

Solution().decompressRLElist([1, 2, 3, 4])
