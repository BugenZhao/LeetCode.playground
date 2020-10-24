let tags: [Tag] = [.tree]

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let (l, r) = (minDepth(root.left), minDepth(root.right))
        return 1 + (min(l, r) > 0 ? min(l, r) : max(l, r))
    }
}

