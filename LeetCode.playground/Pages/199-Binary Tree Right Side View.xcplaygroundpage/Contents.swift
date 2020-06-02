let tags: [Tag] = [.tree, .bfs]

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var answers = [Int]()

        func worker(_ node: TreeNode?, at level: Int) {
            guard let node = node else { return }
            if level == answers.count { answers.append(node.val) }
            worker(node.right, at: level + 1) //: first right
            worker(node.left, at: level + 1)  //: then left
        }

        worker(root, at: 0)
        return answers
    }
}
