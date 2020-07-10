let tags: [Tag] = [.list, .twoPtrs]

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var (slow, fast) = (head, head)
        for _ in 0..<n { fast = fast?.next }
        if fast == nil { return head?.next }

        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return head
    }
}

let f = Solution().removeNthFromEnd
let nodes = [1, 2, 3, 4, 5]

f(ListNode.makeLinkedList(from: nodes), 1)
f(ListNode.makeLinkedList(from: nodes), 2)
f(ListNode.makeLinkedList(from: nodes), 3)
f(ListNode.makeLinkedList(from: nodes), 4)
f(ListNode.makeLinkedList(from: nodes), 5)
