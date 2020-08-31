let tags: [Tag] = [.graph, .dfs]

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = rooms.map{ _ in false }
        func dfs(_ room: Int) {
            visited[room] = true
            for next in rooms[room] where !visited[next] { dfs(next) }
        }
        dfs(0)
        return visited.allSatisfy{ $0 }
    }
}
