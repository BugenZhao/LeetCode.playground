let tags: [Tag] = [.graph, .dfs]

class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        typealias Color = Bool
        var colors = [Color?](repeating: nil, count: graph.count)
        func dfs(_ node: Int, _ toColor: Color) -> Bool {
            if let color = colors[node] {
                if color == toColor { return true }
                else { return false }
            }
            colors[node] = toColor
            return graph[node].allSatisfy { dfs($0, !toColor) }
        }

        for node in graph.indices where colors[node] == nil {
            if !dfs(node, true) { return false }
        }
        return true
    }
}

let f = Solution().isBipartite

f([[1, 3], [0, 2], [1, 3], [0, 2]])
f([[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]])
