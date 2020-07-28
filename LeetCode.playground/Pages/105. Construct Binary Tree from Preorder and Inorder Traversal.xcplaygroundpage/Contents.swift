let tags: [Tag] = [.tree]

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inIndex = [Int: Int]()
        for pair in inorder.enumerated() { inIndex[pair.1] = pair.0 }

        func worker(_ inorder: ArraySlice<Int>, _ preorder: ArraySlice<Int>) -> TreeNode? {
            if inorder.isEmpty { return nil }

            let val = preorder.first!
            let node = TreeNode(val)
            let inMidIndex = inIndex[val]!
            let preMidIndex = inMidIndex - inorder.startIndex + preorder.startIndex + 1

            let leftIn = inorder.startIndex..<inMidIndex
            let leftPre = preorder.startIndex + 1..<preMidIndex
            node.left = worker(inorder[leftIn], preorder[leftPre])

            let rightIn = inMidIndex + 1..<inorder.endIndex
            let rightPre = preMidIndex..<preorder.endIndex
            node.right = worker(inorder[rightIn], preorder[rightPre])

            return node
        }

        return worker(inorder[...], preorder[...])
    }
}

let node = Solution().buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
dump(node)
