let tags: [Tag] = [.tree, .bfs]

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0

        func dfs(_ node: TreeNode, _ num: Int) {
            if node.left == nil, node.right == nil { sum += num }
            if let left = node.left { dfs(left, num * 10 + left.val) }
            if let right = node.right { dfs(right, num * 10 + right.val) }
        }

        if let root = root { dfs(root, root.val) }
        return sum
    }
}
