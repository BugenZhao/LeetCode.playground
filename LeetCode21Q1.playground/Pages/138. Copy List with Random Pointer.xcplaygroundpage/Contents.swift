let tags: [Tag] = [.list]

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(self).hash(into: &hasher)
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var memo = [Node: Node]()

        func copy(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            if let m = memo[node] { return m }

            let copied = Node(node.val)
            memo[node] = copied
            copied.next = copy(node.next)
            copied.random = copy(node.random)
            return copied
        }

        return copy(head)
    }
}


class SolutionSpace {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }

        //: A => B => C
        {
            var p: Node? = head
            while let node = p {
                let copied = Node(node.val)
                copied.next = node.next
                node.next = copied
                p = copied.next
            }
        }();
        //: A => A' => B => B' => C => C'
        {
            var p: Node? = head
            while let node = p {
                let copied = node.next!
                copied.random = node.random?.next
                p = copied.next
            }
        }();
        //: (random fields filled)
        let ans = head.next;
        {
            var p: Node? = head
            while let node = p {
                let copied = node.next!
                node.next = copied.next
                copied.next = copied.next?.next
                p = node.next
            }
        }();
        //: A => B => C;    A' => B' => C'

        return ans;
    }
}
