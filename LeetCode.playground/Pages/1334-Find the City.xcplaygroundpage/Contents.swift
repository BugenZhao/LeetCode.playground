// Floyd Warshall

class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        typealias Node = Int
        typealias Weight = Int
        let inf = Weight.max / 3 // avoid overflow

        var dist = Array(repeating: Array(repeating: inf, count: n), count: n)
        (0..<n).forEach { dist[$0][$0] = 0 }
        edges.forEach { e in dist[e[0]][e[1]] = e[2]; dist[e[1]][e[0]] = e[2] }

        for k in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
                }
            }
        }

        let counts = (0..<n).map { u in dist[u].lazy.filter { $0 <= distanceThreshold }.count - 1 }
        return (0..<n).min(by: { counts[$0] <= counts[$1] })!
    }
}

Solution().findTheCity(4, [[0, 1, 3], [1, 2, 1], [1, 3, 4], [2, 3, 1]], 4)
