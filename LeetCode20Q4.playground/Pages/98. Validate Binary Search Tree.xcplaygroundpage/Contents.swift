class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var inorder = [Int]()
        func dfs(_ node: TreeNode) {
            if let left = node.left { dfs(left) }
            inorder.append(node.val)
            if let right = node.right { dfs(right) }
        }
        if let root = root { dfs(root) }
        return zip(inorder, inorder.dropFirst()).allSatisfy { a, b in a < b }
    }
}
