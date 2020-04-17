//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

extension ListNode {
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

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.toArray() == rhs.toArray()
    }
}

let list = ListNode.makeLinkedList(from: [1, 2, 3, 4, 2, 1])
list?.toArray()
list?.next?.toArray()

list?.next?.next == ListNode.makeLinkedList(from: [3, 4, 2, 1])

extension ListNode: CustomStringConvertible {
    public var description: String {
        return String(describing: self.toArray())
    }
}

list

//: [Next](@next)
