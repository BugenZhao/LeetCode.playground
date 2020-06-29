let tags: [Tag] = [.list]

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var p = head
        while let next = p?.next {
            if next.val == val { p?.next = next.next }
            else { p = p?.next }
        }
        return head?.val == val ? head?.next : head
    }
}

let f = Solution().removeElements

f(ListNode.makeLinkedList(from: [6, 6, 6, 1, 2, 6, 6, 6, 7, 6]), 6)
f(ListNode.makeLinkedList(from: [1, 2, 3]), 4)
f(ListNode.makeLinkedList(from: [5]), 5)
