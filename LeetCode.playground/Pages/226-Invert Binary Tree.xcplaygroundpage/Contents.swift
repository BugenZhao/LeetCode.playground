let tags: [Tag] = [.tree]

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if let root = root {
            (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
        }
        return root
    }
}


class SolutionIterative {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var stack = [root]
        while !stack.isEmpty {
            if let node = stack.popLast()! {
                stack.append(node.left)
                stack.append(node.right)
                swap(&node.left, &node.right)
            }
        }
        return root
    }
}
