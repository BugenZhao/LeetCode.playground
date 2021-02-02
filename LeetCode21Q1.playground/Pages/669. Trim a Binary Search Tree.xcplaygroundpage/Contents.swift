let tags: [Tag] = [.tree]

class Solution {
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val < low { return trimBST(root.right, low, high) }
        if root.val > high { return trimBST(root.left, low, high) }
        
        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)
        return root
    }
}
