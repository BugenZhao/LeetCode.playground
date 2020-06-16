let tags: [Tag] = [.tree]

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        switch root.val {
        case ..<val:
            return searchBST(root.right, val)
        case val:
            return root
        default:
            return searchBST(root.left, val)
        }
    }
}
