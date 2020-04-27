// Find a cycle in a directed graph


class SolutionDFS {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = [[Int]](repeating: [], count: numCourses)
        prerequisites.forEach { pair in adj[pair[0]].append(pair[1]) }
        var visited = [Bool](repeating: false, count: numCourses)

        func dfs(_ u: Int) -> Bool {
            guard !visited[u] else { return false }
            visited[u] = true
            for v in adj[u] {
                guard dfs(v) else { return false }
            }
            visited[u] = false // clear the flags
            return true
        }

        for u in 0..<numCourses {
            guard dfs(u) else { return false }
        }
        return true
    }
}

SolutionDFS().canFinish(2, [[1, 0]])
SolutionDFS().canFinish(2, [[1, 0], [0, 1]])


class SolutionTopo {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = [[Int]](repeating: [], count: numCourses)
        var degree = [Int](repeating: 0, count: numCourses) // in-degree
        prerequisites.forEach { pair in
            adj[pair[0]].append(pair[1])
            degree[pair[1]] += 1
        }
        var topo = (0..<numCourses).filter { degree[$0] == 0 }

        var i = topo.startIndex
        while i != topo.endIndex { // do not append to array in a "for in" loop
            let u = topo[i]
            for v in adj[u] {
                degree[v] -= 1
                if degree[v] == 0 { topo.append(v) }
            }
            i = topo.index(after: i)
        }

        // If we cannot topological sort the graph,
        //  i.e., no zero-in-degree vertex at some time,
        //  there must be a cycle.
        return topo.count == numCourses
    }
}

SolutionTopo().canFinish(2, [[1, 0]])
SolutionTopo().canFinish(2, [[1, 0], [0, 1]])
SolutionTopo().canFinish(3, [[1, 0], [2, 1]])
