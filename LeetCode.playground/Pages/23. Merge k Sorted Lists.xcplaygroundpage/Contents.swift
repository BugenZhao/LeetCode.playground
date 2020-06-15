let tags: [Tag] = [.sort, .list]

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var pq = PriorityQueue<ListNode>(by: { lhs, rhs in lhs.val < rhs.val })
        lists.compactMap { $0 }.forEach { pq.enqueue($0) }

        let head = ListNode(0)
        var p = head
        while !pq.isEmpty {
            let node = pq.dequeue()!
            p.next = node
            p = p.next!
            if let next = node.next { pq.enqueue(next) }
        }
        return head.next
    }
}

Solution().mergeKLists([
    ListNode.makeLinkedList(from: [1, 4, 5]),
    ListNode.makeLinkedList(from: [1, 3, 4]),
    ListNode.makeLinkedList(from: [2, 6])])

Solution().mergeKLists([
    ListNode.makeLinkedList(from: []),
    ListNode.makeLinkedList(from: [1, 2])])
