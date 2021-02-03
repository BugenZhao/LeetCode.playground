let tags: [Tag] = [.graph, .union]

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var uf = QuickUnionFind(edges.count + 1)
        for e in edges {
            if !uf.union(e[0], e[1]) { return e } // cycle prevention
        }
        return [0xdead, 0xbeef]
    }
}

Solution().findRedundantConnection([[1, 2], [2, 3], [3, 4], [1, 4], [1, 5]])
