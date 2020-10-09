let tags: [Tag] = [.tree, .stack, .string]

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        return "[\(root.val)][\(serialize(root.left))][\(serialize(root.right))]"
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        func worker(_ data: ArraySlice<Character>) -> TreeNode? {
            if data.isEmpty { return nil }
            let counts = data.reduce(into: [Int]()) { arr, char in
                let last = arr.last ?? 0
                if char == "[" { arr.append(last + 1) }
                else if char == "]" { arr.append(last - 1) }
                else { arr.append(last) }
            }
            let poss = counts.indices.filter { i in counts[i] == 0 }.map { data.startIndex + $0 }
            let val = Int(String(data[(data.startIndex + 1)..<poss[0]]))!
            let left = data[(poss[0] + 2)..<poss[1]]
            let right = data[(poss[1] + 2)..<poss[2]]

            return TreeNode(val, worker(left), worker(right))
        }

        return worker(Array(data)[...])
    }
}
