//: -  Callout(TODO): 0-1 BFS
let tags: [Tag] = [.graph, .sp]

class SolutionBF {
    func minCost(_ grid: [[Int]]) -> Int {
        typealias Weight = Int
        let m = grid.count
        let n = grid[0].count
        let N = m * n
        var adj = Array(repeating: [(node: Int, weight: Weight)](), count: N)

        // set the weight of signed direction to 0, otherwise 1
        for i in grid.indices {
            for j in grid[i].indices {
                for (offset, coord) in [(0, 1), (0, -1), (1, 0), (-1, 0)].map({ (i + $0, j + $1) }).enumerated() {
                    if 0..<m ~= coord.0 && 0..<n ~= coord.1 {
                        adj[i * n + j].append((node: coord.0 * n + coord.1, weight: offset != grid[i][j] - 1 ? 1 : 0))
                    }
                }
            }
        }

        // apply Bellman-Ford to get the shortest path
        var dist = [Int](repeating: Weight.max / 3, count: N)
        dist[0] = 0
        var updated = [Bool](repeating: true, count: N)

        for _ in 1..<N {
            var newUpdated = [Bool](repeating: false, count: N)
            var ok = true

            for u in 0..<N where updated[u] {
                adj[u].forEach { v, weight in
                    if dist[v] > dist[u] + weight {
                        dist[v] = dist[u] + weight
                        newUpdated[v] = true
                        ok = false
                    }
                }
            }
            if ok { break }
            else { updated = newUpdated }
        }

        return dist.last!
    }
}

let grid = [[1, 1, 1, 1], [2, 2, 2, 2], [1, 1, 1, 1], [2, 2, 2, 2]]
SolutionBF().minCost(grid)
