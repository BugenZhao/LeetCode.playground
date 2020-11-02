let tags: [Tag] = [.list]

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        if head.next == nil { return head }

        let dummy = ListNode(233)
        dummy.next = head

        var minVal = head.val
        var minPrevNode = dummy
        var p = dummy

        while let next = p.next {
            if next.val < minVal {
                minVal = next.val
                minPrevNode = p
            }
            p = next
        }

        if minPrevNode !== dummy {
            let node = minPrevNode.next!

            dummy.next = node
            minPrevNode.next = node.next
            node.next = head
        }

        if let newHead = dummy.next {
            newHead.next = insertionSortList(newHead.next)
        }

        return dummy.next
    }
}


Solution().insertionSortList(ListNode.makeLinkedList(from: [4, 2, 1, 3]))
