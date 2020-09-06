let tags: [Tag] = [.tree]

class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var record = [Int]()
        func visit(_ node: TreeNode?) {
            guard let node = node else { return }
            visit(node.left)
            record.append(node.val)
            visit(node.right)
        }
        [root1, root2].forEach(visit)
        return record.sorted()
    }
}
