let tags: [Tag] = [.tree, .bfs]

class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        typealias Level = Int
        var answers = [Level: Int]()
        var queue = [(node: TreeNode?, level: Level)]()
        var head = 0

        queue.append((root, 0))
        while head < queue.count {
            if let node = queue[head].node {
                let level = queue[head].level
                answers[level, default: Int.min] = max(answers[level, default: Int.min], node.val)
                queue.append((node.left, level + 1))
                queue.append((node.right, level + 1))
            }
            head += 1
        }

        return answers.sorted(by: { $0.key < $1.key }).map { $0.value }
    }
}
