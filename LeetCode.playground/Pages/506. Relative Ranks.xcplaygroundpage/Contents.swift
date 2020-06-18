class Solution {
    func findRelativeRanks(_ nums: [Int]) -> [String] {
        let order = nums.indices.sorted(by: { nums[$0] > nums[$1] })
        var rank = [Int](repeating: 0, count: nums.count)
        order.enumerated().forEach { i, o in rank[o] = i + 1 }
        return nums.indices.map {
            switch rank[$0] {
            case 1:
                return "Gold Medal"
            case 2:
                return "Silver Medal"
            case 3:
                return "Bronze Medal"
            default:
                return "\(rank[$0])"
            }
        }
    }
}

Solution().findRelativeRanks([5, 4, 3, 2, 6])
