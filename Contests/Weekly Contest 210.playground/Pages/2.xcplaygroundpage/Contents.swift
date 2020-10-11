class Solution {
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        var adj = [[Bool]](repeating: .init(repeating: false, count: n), count: n)
        var degree = [Int](repeating: 0, count: n)
        for road in roads {
            adj[road[0]][road[1]] = true
            adj[road[1]][road[0]] = true
            degree[road[0]] += 1
            degree[road[1]] += 1
        }

        var ans = 0
        for i in 0..<n {
            for j in (i + 1)..<n {
                let tmp = degree[i] + degree[j] - (adj[i][j] ? 1 : 0)
                ans = max(ans, tmp)
            }
        }

        return ans
    }
}
