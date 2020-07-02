let tags: [Tag] = [.bfs]

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var traversal = [[root]]
        while true {
            var level = [TreeNode]()
            for node in traversal.last! {
                if node.left != nil { level.append(node.left!) }
                if node.right != nil { level.append(node.right!) }
            }
            if level.isEmpty { break }
            traversal.append(level)
        }
        return traversal.reversed().map { $0.map { $0.val } }
    }
}
