let tags: [Tag] = [.tree, .dfs]

class Solution {
    enum Dir { case left, root, right}
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var ans = 0
        func worker(_ node: TreeNode?, _ dir: Dir) {
            guard let node = node else { return }
            if node.left == nil, node.right == nil {
                ans += dir == .left ? node.val : 0
            } else {
                worker(node.left, .left)
                worker(node.right, .right)
            }
        }
        worker(root, .root)
        return ans
    }
}


Solution().sumOfLeftLeaves(TreeNode(1))
