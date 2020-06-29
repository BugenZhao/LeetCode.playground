let tags: [Tag] = [.dfs]

class Solution {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var adj = [String: [String]]()
        tickets.forEach { edge in adj[edge[0], default: []].append(edge[1]) }
        adj.forEach { k, _ in adj[k]!.sort(by: >) }

        var route = [String]()
        func dfs(_ u: String) {
            if adj[u] != nil {
                while let next = adj[u]!.last {
                    adj[u]!.removeLast()
                    dfs(next)
                }
            }
            route.append(u)
        }
        
        dfs("JFK")
        return route.reversed()
    }
}

let f = Solution().findItinerary

f([["JFK", "SFO"], ["JFK", "ATL"], ["SFO", "ATL"], ["ATL", "JFK"], ["ATL", "SFO"]])
