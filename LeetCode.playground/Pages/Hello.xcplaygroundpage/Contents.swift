import Cocoa

var array = ["Swift", "playground", "LeetCode", "Bugen! 😄"]
array.forEach { print("Hello, \($0)") }


/// Test for linked list
var node = ListNode.makeLinkedList(from: [1, 0, 1, 8])
while node != nil {
    print(node!.val, terminator: "")
    node = node!.next
}
print()

