let tags: [Tag] = [.dfs, .graph]

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        let target = graph.count - 1
        var visited = graph.map { _ in false }
        var paths = [[Int]]()

        func dfs(_ u: Int, _ path: inout [Int]) {
            path.append(u)
            visited[u] = true
            if u == target {
                paths.append(path)
            } else {
                for v in graph[u] where !visited[v] { dfs(v, &path) }
            }
            visited[u] = false
            path.removeLast()
        }

        var path = [Int]()
        dfs(0, &path)
        return paths
    }
}

Solution().allPathsSourceTarget([[1, 2], [3], [3], []])
