let tags: [Tag] = [.graph]

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    func cloneGraph(_ root: Node?) -> Node? {
        var cloneds = [Int: Node]()

        func worker(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            if let cloned = cloneds[node.val] { return cloned }

            let new = Node(node.val)
            cloneds[node.val] = new
            new.neighbors = node.neighbors.map { worker($0) }
            return new
        }

        return worker(root)
    }
}

let ns = (0..<4).map { Node($0) }
ns[0].neighbors = [ns[1], ns[2]]
ns[1].neighbors = [ns[2]]
ns[2].neighbors = [ns[3]]
ns[3].neighbors = [ns[1]]
Solution().cloneGraph(ns.first!)!
