//: Ambiguity: True as long as there is ***one such 0***.
let tags: [Tag] = [.bfs]

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var queue = [start]
        var head = queue.startIndex
        var visited = arr.map { _ in false }

        while head != queue.endIndex {
            let pos = queue[head]; head += 1
            visited[pos] = true
            if arr[pos] == 0 { return true }
            if pos - arr[pos] >= 0, !visited[pos - arr[pos]] { queue.append(pos - arr[pos]) }
            if pos + arr[pos] < arr.count, !visited[pos + arr[pos]] { queue.append(pos + arr[pos]) }
        }
        return false
    }
}

let f = Solution().canReach

f([4, 2, 3, 0, 3, 1, 2], 5)
f([3, 0, 2, 1, 2], 2)
f([0, 3, 0, 6, 3, 3, 4], 6)
