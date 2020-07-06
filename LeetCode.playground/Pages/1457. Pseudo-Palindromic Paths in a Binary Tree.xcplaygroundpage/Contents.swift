let tags: [Tag] = [.bit, .tree]

class Solution {
    static let masks = (0...9).map { 1 << $0 }

    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var count = 0
        func dfs(_ node: TreeNode, _ val: Int) {
            let newVal = val ^ Solution.masks[node.val]
            if node.left == nil, node.right == nil { count += newVal.nonzeroBitCount <= 1 ? 1 : 0 }
            else {
                if let left = node.left { dfs(left, newVal) }
                if let right = node.right { dfs(right, newVal) }
            }
        }
        dfs(root, 0)
        return count
    }
}
