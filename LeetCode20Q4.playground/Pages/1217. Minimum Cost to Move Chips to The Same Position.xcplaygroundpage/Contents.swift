class Solution {
    func minCostToMoveChips(_ position: [Int]) -> Int {
        let even = position.filter { $0.isMultiple(of: 2) }.count
        return min(even, position.count - even)
    }
}
