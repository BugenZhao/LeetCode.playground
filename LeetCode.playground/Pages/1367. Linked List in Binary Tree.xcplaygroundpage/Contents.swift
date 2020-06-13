let tags: [Tag] = [.tree, .dfs]

class Solution {
    func match(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        if head == nil { return true }
        if root == nil { return false }
        if head!.val != root!.val { return false }
        return match(head!.next, root!.left) || match(head!.next, root!.right)
    }

    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        //: find the start
        if head == nil { return true }
        if root == nil { return false }
        return match(head, root) || isSubPath(head, root?.left) || isSubPath(head, root?.right)
    }
}
