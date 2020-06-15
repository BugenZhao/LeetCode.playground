let tags: [Tag] = [.graph, .sp, .marked, .working]

//: Bellman Ford
class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var adj = [[(Int, Int)]](repeating: [], count: n)
        flights.forEach { adj[$0[0]].append(($0[1], $0[2])) }

        var dist = [[Int]](repeating: .init(repeating: Int.max / 3, count: n), count: K + 2)
        for k in dist.indices {
            dist[k][src] = 0
        }
        //: `dist[k][v]`: minimal distance to `v` within`k` steps (`k - 1` stops)

        for k in 1...(K + 1) { //: KEY POINT!
            for u in 0..<n {
                adj[u].forEach { v, weight in
                    dist[k][v] = min(dist[k][v], dist[k - 1][u] + weight, Int.max / 3)
                }
            }
        }

        return dist[K + 1][dst] == Int.max / 3 ? -1 : dist[K + 1][dst]
    }
}

var f = Solution().findCheapestPrice

f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0)
f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1)
f(3, [[0, 1, 2], [1, 2, 1], [2, 0, 10]], 1, 2, 1)

//: BF with spatial optimization
class Solution2 {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var adj = [[(Int, Int)]](repeating: [], count: n)
        flights.forEach { adj[$0[0]].append(($0[1], $0[2])) }

        var dist = [Int](repeating: Int.max / 3, count: n)
        dist[src] = 0

        for _ in 1...(K + 1) {
            var newDist = dist
            for u in 0..<n {
                adj[u].forEach { v, weight in
                    newDist[v] = min(newDist[v], dist[u] + weight, Int.max / 3)
                }
            }
            dist = newDist
        }

        return dist[dst] == Int.max / 3 ? -1 : dist[dst]
    }
}

f = Solution2().findCheapestPrice

f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0)
f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1)
f(3, [[0, 1, 2], [1, 2, 1], [2, 0, 10]], 1, 2, 1)
