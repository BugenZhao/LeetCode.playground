/*: Topological Sort
 
 ![Figure](1203.png width="600")
 */
let tags: [Tag] = [.graph, .dfs, .marked]

class Solution {
    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        //: add some pseudo-vertex to represent *group*
        let N = n + m
        var adj = [[Int]](repeating: [], count: N)
        var inDegree = [Int](repeating: 0, count: N)

        for (v, g) in group.enumerated() where g >= 0 {
            adj[n + g].append(v)
            inDegree[v] += 1
        }

        for v in 0..<n {
            for u in beforeItems[v] {
                let gu = group[u] >= 0 ? n + group[u] : u
                let gv = group[v] >= 0 ? n + group[v] : v
                if gu == gv {
                    //: in-group prerequisites => attach on normal vertices
                    adj[u].append(v)
                    inDegree[v] += 1
                } else {
                    //: inter-group prerequisites => attach on group vertices
                    adj[gu].append(gv)
                    inDegree[gv] += 1
                }
            }
        }

        //: **KEY:** we must generate topological sequence by dfs
        var topo = [Int]()
        func dfs(_ u: Int) {
            topo.append(u)
            inDegree[u] = -1 //: visited
            for v in adj[u] {
                inDegree[v] -= 1
                if inDegree[v] == 0 { dfs(v) }
            }
        }

        for u in 0..<N where inDegree[u] == 0 { dfs(u) }
        return topo.count == N ? topo.filter { $0 < n }: []
    }
}

let f = Solution().sortItems

f(8, 2, [-1, -1, 1, 0, 0, 1, 0, -1], [[], [6], [5], [6], [3, 6], [], [], []])
f(5, 5, [2, 0, -1, 3, 0], [[2, 1, 3], [2, 4], [], [], []])
