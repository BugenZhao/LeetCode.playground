let tags: [Tag] = [.bfs, .tree]

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        var queue = [root].compactMap { $0 }
        var head = queue.startIndex
        var depth = 0

        while head != queue.endIndex {
            let count = queue.endIndex - head
            for _ in 0..<count {
                let node = queue[head]; head += 1
                queue.append(contentsOf: node.children)
            }
            depth += 1
        }

        return depth
    }
}
