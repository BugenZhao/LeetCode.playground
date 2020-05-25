let tags: [Tag] = [.tree]

class Solution {
    func worker(_ preorder: ArraySlice<Int>) -> TreeNode? {
        switch preorder.count {
        case 0:
            return nil
        case 1:
            return TreeNode(preorder.first!)
        default:
            let root = TreeNode(preorder.first!)
            if let rightIndex = preorder.firstIndex(where: { $0 > preorder.first! }) {
                root.left = worker(preorder[preorder.startIndex + 1..<rightIndex])
                root.right = worker(preorder[rightIndex..<preorder.endIndex])
            } else {
                root.left = worker(preorder.dropFirst())
                root.right = nil
            }
            return root
        }
    }

    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        return worker(preorder[0...])
    }
}


dump(Solution().bstFromPreorder([8, 5, 1, 7, 10, 12]))
dump(Solution().bstFromPreorder([7, 20, 19, 12]))


class Solution2 {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        func addNode(with val: Int, to parent: TreeNode?) -> TreeNode? {
            guard let parent = parent else { return TreeNode(val) }
            if val < parent.val {
                parent.left = addNode(with: val, to: parent.left)
            } else {
                parent.right = addNode(with: val, to: parent.right)
            }
            return parent
        }
        return preorder.reduce(into: nil) { $0 = addNode(with: $1, to: $0) }
    }
}


dump(Solution2().bstFromPreorder([8, 5, 1, 7, 10, 12]))
dump(Solution2().bstFromPreorder([7, 20, 19, 12]))
