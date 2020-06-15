let tags: [Tag] = [.graph, .sp, .marked, .working]

//: Dynamic Programming like Basic Bellman Ford
class SolutionDP {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var adj = [[(Int, Int)]](repeating: [], count: n)
        flights.forEach { adj[$0[0]].append(($0[1], $0[2])) }

        var dist = [[Int]](repeating: .init(repeating: Int.max / 3, count: n), count: K + 2)
        for k in dist.indices {
            dist[k][src] = 0
        }
        //: `dist[k][v]`: minimal distance to `v` within`k` steps (`k - 1` stops)

        for k in 1...(K + 1) { //: KEY POINT, to control the # of stops!
            for u in 0..<n {
                adj[u].forEach { v, weight in
                    dist[k][v] = min(dist[k][v], dist[k - 1][u] + weight, Int.max / 3)
                }
            }
        }

        return dist[K + 1][dst] == Int.max / 3 ? -1 : dist[K + 1][dst]
    }
}

var f = SolutionDP().findCheapestPrice

f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0)
f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1)
f(3, [[0, 1, 2], [1, 2, 1], [2, 0, 10]], 1, 2, 1)

/*: BF with spatial optimization
 - Note: We still need two `dist` array, that is, update the distances atomically!!! Consider that `u` and `v` are to update, and there exists an edge `(u,v)`, if we happen to update first `u` then `v`, `v` actually gets one more stop, which is not expected since we are using the # of **the outer loop** to control the # of stops!
 */
class Solution {
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

f = Solution().findCheapestPrice

f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 0)
f(3, [[0, 1, 100], [1, 2, 100], [0, 2, 500]], 0, 2, 1)
f(3, [[0, 1, 2], [1, 2, 1], [2, 0, 10]], 1, 2, 1)
