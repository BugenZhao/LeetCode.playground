let tags: [Tag] = [.tree, .dfs]

class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var curr = 0; var sum = 0
        func visit(_ node: TreeNode?) -> Int {
            guard let node = node else { return sum }
            curr = (curr << 1) + node.val
            if let left = node.left, let right = node.right {
                visit(left)
                visit(right)
            } else if let left = node.left {
                visit(left)
            } else if let right = node.right {
                visit(right)
            } else {
                sum += curr
            }
            curr = curr >> 1
            return sum
        }
        return visit(root)
    }
}
