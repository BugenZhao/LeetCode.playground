public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        var level = 0
        var q = [root]
        if root!.val.isMultiple(of: 2) { return false }
        while !q.isEmpty {
            var head = 0
            var newq = [TreeNode]()
            while head != q.endIndex {
                let node = q[head]; head += 1
                if let left = node?.left {
                    if left.val.isMultiple(of: 2) != level.isMultiple(of: 2) { return false }
                    if !newq.isEmpty {
                        if level.isMultiple(of: 2), left.val >= newq.last!.val { return false }
                        if !level.isMultiple(of: 2), left.val <= newq.last!.val { return false }
                    }
                    newq.append(left)
                }
                if let right = node?.right {
                    if right.val.isMultiple(of: 2) != level.isMultiple(of: 2) { return false }
                    if !newq.isEmpty {
                        if level.isMultiple(of: 2), right.val >= newq.last!.val { return false }
                        if !level.isMultiple(of: 2), right.val <= newq.last!.val { return false }
                    }
                    newq.append(right)
                }
            }
            q = newq
            level += 1
        }
        return true
    }
}
