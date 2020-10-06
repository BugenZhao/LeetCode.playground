let tags: [Tag] = [.tree]

class Solution {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return TreeNode(val) }
        var node = root
        while true {
            if val > node.val {
                if let right = node.right { node = right }
                else { node.right = TreeNode(val); break }
            } else if val < node.val {
                if let left = node.left { node = left }
                else { node.left = TreeNode(val); break }
            } else {
                break
            }
        }
        return root
    }
}
