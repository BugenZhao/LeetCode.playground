let tags: [Tag] = [.ON, .dfs, .tree]

//: find the inorder violation

class Solution {
    func recoverTree(_ root: TreeNode?) {
        var inorder = [TreeNode]()
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            dfs(node.left)
            inorder.append(node)
            dfs(node.right)
        }
        dfs(root)

        if inorder.count <= 1 { return }

        let pairs = zip(inorder, inorder.dropFirst())
        let bad = pairs.filter { a, b in a.val > b.val }
        
        let l = bad.first!.0
        let r = bad.last!.1
        
        swap(&l.val, &r.val)
    }
}
