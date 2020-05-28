let tags: [Tag] = [.graph, .dfs]

class Solution {
    //: There are no odd circles in the bipartite graph
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var adj = [[Int]](repeating: [], count: N + 1)
        dislikes.forEach { adj[$0[0]].append($0[1]); adj[$0[1]].append($0[0]) }
        enum Color { case red, blue, none }
        var colors = [Color](repeating: .none, count: N + 1)

        func dfs(_ node: Int, _ color: Color) -> Bool {
            if colors[node] == .none {
                colors[node] = color
                let newColor = color == .red ? Color.blue : .red
                for dislike in adj[node] {
                    guard dfs(dislike, newColor) else { return false }
                }
                return true
            } else if colors[node] == color {
                return true
            } else {
                return false
            }
        }

        for node in 1...N {
            guard colors[node] == .none else { continue }
            guard dfs(node, .red) else { return false } //: `red` even distance, `blue` odd distance
        }

        return true
    }
}


let f = Solution().possibleBipartition

f(4, [[1, 2], [1, 3], [2, 4]])
f(3, [[1, 2], [1, 3], [2, 3]])
f(5, [[1, 2], [2, 3], [3, 4], [4, 5], [1, 5]])
