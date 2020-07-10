let tags: [Tag] = [.list]

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode(0)
        var p = head
        var (l1, l2) = (l1, l2)

        while l1 != nil, l2 != nil {
            if l1!.val < l2!.val { p.next = ListNode(l1!.val); l1 = l1!.next }
            else { p.next = ListNode(l2!.val); l2 = l2!.next }
            p = p.next!
        }

        while l1 != nil {
            p.next = ListNode(l1!.val)
            l1 = l1!.next
            p = p.next!
        }
        while l2 != nil {
            p.next = ListNode(l2!.val)
            l2 = l2!.next
            p = p.next!
        }
        return head.next
    }
}

let f = Solution().mergeTwoLists

f(ListNode.makeLinkedList(from: [1, 2, 4]), ListNode.makeLinkedList(from: [1, 3, 4]))
f(ListNode.makeLinkedList(from: [1, 2]), ListNode.makeLinkedList(from: [3, 4, 5]))
f(ListNode.makeLinkedList(from: []), ListNode.makeLinkedList(from: [3, 4, 5]))
