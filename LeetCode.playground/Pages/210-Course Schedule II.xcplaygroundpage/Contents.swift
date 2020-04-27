
class SolutionTopo {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adj = [[Int]](repeating: [], count: numCourses)
        var degree = [Int](repeating: 0, count: numCourses) // in-degree
        prerequisites.forEach { pair in
            adj[pair[1]].append(pair[0])
            degree[pair[0]] += 1
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
        return topo.count == numCourses ? topo : []
    }
}

SolutionTopo().findOrder(2, [[1, 0]])
SolutionTopo().findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]])
SolutionTopo().findOrder(4, [[1, 2], [2, 3], [3, 1]])
