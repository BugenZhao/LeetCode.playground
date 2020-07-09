let tags: [Tag] = [.tree]

class Solution {
    let mod = 1_000_000_007
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var ends = [(left: Int, right: Int)]()
        func dfs(_ node: TreeNode, _ id: Int, at level: Int) {
            if level >= ends.count { ends.append((id, id)) }
            else { ends[level].right = id }
            //: to avoid overflow: 1. use modulo; 2. reset the id of the leftmost one of each level to 0
            if let left = node.left { dfs(left, (2 * id + 1) % mod, at: level + 1) }
            if let right = node.right { dfs(right, (2 * id + 2) % mod, at: level + 1) }
        }
        dfs(root, 0, at: 0)
        return ends.map { $0.right - $0.left + 1 }.max()!
    }
}
