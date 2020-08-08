let tags: [Tag] = [.hash, .tree, .dfs]

class Solution {
    typealias Sum = Int
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else { return 0 }
        var ans = 0
        var cumu: [Sum: Int] = [0: 1] //: INITIAL VALUE counts
        func worker(_ node: TreeNode, _ current: Sum) {
            ans += cumu[current - sum] ?? 0 //: like Two Sum Problem, ending up with `node`
            cumu[current, default: 0] += 1
            if let left = node.left { worker(left, current + left.val) }
            if let right = node.right { worker(right, current + right.val) }
            cumu[current]! -= 1
        }
        worker(root, root.val)
        return ans
    }
}
