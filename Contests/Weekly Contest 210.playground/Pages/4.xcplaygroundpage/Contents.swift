class Solution {
    func countSubgraphsForEachDiameter(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var adj = [Set<Int>](repeating: .init(), count: n + 1)
        for e in edges {
            adj[e[0]].insert(e[1])
            adj[e[1]].insert(e[0])
        }

        func isConn(_ av: Set<Int>) -> Bool {
            if av.isEmpty { return false }

            var visited = [Bool](repeating: false, count: n + 1)
            func dfs(_ u: Int) {
                visited[u] = true
                for v in adj[u] where av.contains(v) && !visited[v] {
                    dfs(v)
                }
            }

            dfs(av.first!)
            return av.allSatisfy { visited[$0] }
        }

        var dist = [[Int]](repeating: .init(repeating: Int.max / 3, count: n + 1), count: n + 1)
        for i in 1...n { dist[i][i] = 0 }
        for e in edges {
            dist[e[0]][e[1]] = 1
            dist[e[1]][e[0]] = 1
        }


        for k in 1...n {
            for i in 1...n {
                for j in 1...n {
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
                }
            }
        }


        var ans = [Int](repeating: 0, count: n - 1)
        
        for state in 0..<(1 << n) {
            var av = Set<Int>()
            for i in 0..<n {
                if state & (1 << i) != 0 { av.insert(i + 1) }
            }
            guard av.count >= 2 && isConn(av) else { continue }

            var maxDist = 0
            for i in 1...n where av.contains(i) {
                for j in 1...n where av.contains(j) {
                    maxDist = max(maxDist, dist[i][j])
                }
            }
            
            ans[maxDist - 1] += 1
        }

        return ans
    }
}
