let tags: [Tag] = [.list]

class Solution {
    func deleteNode(_ node: ListNode?) {
        node!.val = node!.next!.val
        node!.next = node!.next!.next
    }
}

let list = ListNode.makeLinkedList(from: [4, 5, 1, 3])!
list
Solution().deleteNode(list.next)
list
