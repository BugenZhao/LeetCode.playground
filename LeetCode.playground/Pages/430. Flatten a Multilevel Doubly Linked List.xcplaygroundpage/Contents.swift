let tags: [Tag] = [.tree]

public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child = nil
    }
}

class Solution {
    func flatten(_ head: Node?) -> Node? {
        if head == nil { return nil }
        var p = head
        while p != nil {
            if p?.child == nil {
                p = p?.next
            } else {
                var q = p?.child
                while q?.next != nil { q = q?.next }
                q?.next = p?.next
                p?.next?.prev = q
                p?.next = p?.child
                p?.next?.prev = p
                p?.child = nil //: cleanup
                p = p?.next
            }
        }
        return head
    }
}
