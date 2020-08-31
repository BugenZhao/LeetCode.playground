let tags: [Tag] = [.tree]

class Solution {
    func findMax(_ node: TreeNode) -> TreeNode {
        var node = node
        while let next = node.right { node = next }
        return node
    }
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if key < root.val { root.left = deleteNode(root.left, key); return root }
        else if key > root.val { root.right = deleteNode(root.right, key); return root }
        else if root.left == nil { return root.right }
        else if root.right == nil { return root.left }
        else {
            let new = findMax(root.left!)
            new.left = deleteNode(root.left, new.val)
            new.right = root.right
            return new
        }
    }
}
