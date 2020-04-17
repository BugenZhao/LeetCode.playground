import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// Bugen's extension to linked list
public extension ListNode {
    static func makeLinkedList <T:Collection> (from collection: T) -> ListNode?
    where T.Element == Int
    {
        var head: ListNode? = nil
        var p: ListNode? = nil
        for element in collection {
            if head == nil {
                head = ListNode(element)
                p = head
            } else {
                p!.next = ListNode(element)
                p = p!.next
            }
        }

        return head
    }

    func toArray() -> [Int] {
        var array = [Int]()
        var node: ListNode? = self
        while node != nil {
            array.append(node!.val)
            node = node!.next
        }
        return array
    }
}
