let tags: [Tag] = [.graph, .union]

class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        guard connections.count >= n - 1 else { return -1 }
        var uf = UnionFind<Int>()
        (0..<n).forEach { uf.addSet(with: $0) }
        connections.forEach { uf.union($0[0], $0[1]) }
        //: # of CC
        return Set((0..<n).map { uf.set(of: $0)! }).count - 1
    }
}


Solution().makeConnected(6, [[0, 1], [0, 2], [0, 3], [1, 2], [1, 3]])
