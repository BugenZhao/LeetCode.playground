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

let list = ListNode.makeLinkedList(from: [1, 2, 3, 4, 2, 1])
list?.toArray()
list?.next?.toArray()

//: [Next](@next)
