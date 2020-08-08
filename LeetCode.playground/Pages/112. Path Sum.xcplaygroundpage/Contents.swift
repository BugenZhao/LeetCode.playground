let tags: [Tag] = [.tree, .dfs]

class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        func worker(_ node: TreeNode, _ rem: Int) -> Bool {
            if node.left == nil, node.right == nil { return rem == node.val }
            if let left = node.left, worker(left, rem - node.val) { return true }
            if let right = node.right, worker(right, rem - node.val) { return true }
            return false
        }
        return root != nil && worker(root!, sum)
    }
}
