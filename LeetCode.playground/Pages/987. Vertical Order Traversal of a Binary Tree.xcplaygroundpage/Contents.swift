let tags: [Tag] = [.tree, .dfs, .annoying]

class Solution {
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var ans = [Int: [(value: Int, y: Int)]]()
        func worker(_ node: TreeNode?, _ x: Int, _ y: Int) {
            guard let node = node else { return }
            ans[x, default: []].append((node.val, y))
            worker(node.left, x - 1, y - 1)
            worker(node.right, x + 1, y - 1)
        }
        worker(root, 0, 0)
        return ans
            .sorted(by: { lhs, rhs in lhs.key < rhs.key })
            .map { $0.value.sorted(by: { lhs, rhs in lhs.y == rhs.y ? lhs.value < rhs.value: lhs.y > rhs.y }).map { $0.value } }
    }
}
