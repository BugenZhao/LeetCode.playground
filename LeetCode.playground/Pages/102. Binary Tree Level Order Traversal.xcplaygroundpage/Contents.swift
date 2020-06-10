let tags: [Tag] = [.tree, .bfs]

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var thisLevel = [root]
        var head = thisLevel.startIndex
        var nextLevel = [root]
        var result = [[Int]]()

        while !nextLevel.isEmpty {
            result.append(nextLevel.map { $0.val })
            thisLevel = nextLevel; head = thisLevel.startIndex
            nextLevel.removeAll()
            
            while head < thisLevel.endIndex {
                let node = thisLevel[head]; head += 1
                if let left = node.left { nextLevel.append(left) }
                if let right = node.right { nextLevel.append(right) }
            }
        }
        
        return result
    }
}

let f = Solution().levelOrder

let root = TreeNode(3)
f(root)

