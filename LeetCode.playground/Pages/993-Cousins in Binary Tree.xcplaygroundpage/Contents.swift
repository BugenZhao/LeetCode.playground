//: DFS

let tags: [Tag] = [.tree]

class Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }

        var done = 0
        var xParent: TreeNode? = nil
        var yParent: TreeNode? = nil
        var xLevel: Int? = nil
        var yLevel: Int? = nil

        func dfs(_ node: TreeNode?, _ level: Int, _ parent: TreeNode?) {
            guard let node = node else { return }
            guard done != 2 else { return }
            if node.val == x {
                xLevel = level
                xParent = parent
                done += 1
            } else if node.val == y {
                yLevel = level
                yParent = parent
                done += 1
            } else {
                guard done != 2 else { return }
                dfs(node.left, level + 1, node)
                guard done != 2 else { return }
                dfs(node.right, level + 1, node)
            }
        }

        dfs(root, 0, nil)
        return xLevel == yLevel && xParent !== yParent
    }
}
