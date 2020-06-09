let tags: [Tag] = [.tree]

class Solution {
    func isSameTree(_ _p: TreeNode?, _ _q: TreeNode?) -> Bool {
        guard let p = _p, let q = _q else { return _p == nil && _q == nil }
        return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
