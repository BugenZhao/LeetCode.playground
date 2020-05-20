let tags: [Tag] = [.tree, .dfs]

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count = 0
        var stack = [root]
        var node = root

        while !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node!.left
            }
            node = stack.popLast()!
            count += 1
            if count == k { return node!.val }
            node = node!.right
        }
        
        return 0
    }
}
