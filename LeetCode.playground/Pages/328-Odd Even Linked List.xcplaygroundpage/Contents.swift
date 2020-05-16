let tags: [Tag] = [.list]

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else { return head }
        var node = head
        let second = head?.next

        while node != nil {
            let next = node!.next
            node!.next = next?.next
            node = next
        }

        node = head
        while true {
            if node!.next == nil {
                node!.next = second
                break
            }
            node = node!.next
        }

        return head
    }
}


let f = Solution().oddEvenList
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]))
f(ListNode.makeLinkedList(from: [1, 2, 3, 4]))
f(ListNode.makeLinkedList(from: [1, 2, 3]))
f(ListNode.makeLinkedList(from: [1, 2]))
f(ListNode.makeLinkedList(from: [1]))
f(ListNode.makeLinkedList(from: []))
