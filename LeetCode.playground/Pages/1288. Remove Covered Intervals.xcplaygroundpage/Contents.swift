let tags: [Tag] = [.greedy, .sort]

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let all = intervals.sorted(by: { lhs, rhs in lhs[0] == rhs[0] ? lhs[1] > rhs[1]: lhs[0] < rhs[0] })
        var rem = [[Int]]()
        for int in all {
            if rem.isEmpty { rem.append(int) }
            else if rem.last![0] <= int[0] && rem.last![1] >= int[1] { continue }
            else { rem.append(int) }
        }
        return rem.count
    }
}


Solution().removeCoveredIntervals([[1, 2], [1, 4], [3, 4]]) == 1
