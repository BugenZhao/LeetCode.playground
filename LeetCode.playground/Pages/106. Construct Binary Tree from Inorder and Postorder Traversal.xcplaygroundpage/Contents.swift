let tags: [Tag] = [.tree]

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var inIndex = [Int: Int]()
        for pair in inorder.enumerated() { inIndex[pair.1] = pair.0 }

        func worker(_ inorder: ArraySlice<Int>, _ poorder: ArraySlice<Int>) -> TreeNode? {
            if inorder.isEmpty { return nil }

            let val = poorder.last!
            let node = TreeNode(val)
            let inMidIndex = inIndex[poorder.last!]!
            let poMidIndex = inMidIndex - inorder.startIndex + poorder.startIndex

            let leftIn = inorder.startIndex..<inMidIndex
            let leftPo = poorder.startIndex..<poMidIndex
            node.left = worker(inorder[leftIn], poorder[leftPo])

            let rightIn = inMidIndex + 1..<inorder.endIndex
            let rightPo = poMidIndex..<poorder.endIndex - 1
            node.right = worker(inorder[rightIn], poorder[rightPo])

            return node
        }

        return worker(inorder[...], postorder[...])
    }
}

let node = Solution().buildTree([9, 3, 15, 20, 7], [9, 15, 7, 20, 3])
dump(node)
