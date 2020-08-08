let tags: [Tag] = [.tree, .dfs]

class Solution {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }

        var ans = [[Int]]()
        func worker(_ node: TreeNode, _ rem: Int, _ path: inout [Int]) {
            path.append(node.val)
            if node.left == nil, node.right == nil, rem == node.val { ans.append(path) }
            if let left = node.left { worker(left, rem - node.val, &path) }
            if let right = node.right { worker(right, rem - node.val, &path) }
            path.removeLast()
        }
        var path = [Int]()
        worker(root, sum, &path)
        
        return ans
    }
}
