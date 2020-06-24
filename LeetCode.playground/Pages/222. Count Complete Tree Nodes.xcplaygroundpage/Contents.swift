let tags: [Tag] = [.tree]

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return countNodes(root.left) + countNodes(root.right) + 1
    }
}
