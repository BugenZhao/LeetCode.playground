let tags: [Tag] = [.list, .dq, .sort, .twoPtrs]

class Solution {
    func mergeList(_ l: ListNode?, _ r: ListNode?) -> ListNode? {
        let dummy = ListNode(233);
        var p = dummy
        var (i, j) = (l, r)
        
        while i != nil, j != nil {
            if i!.val < j!.val {
                p.next = i
                i = i?.next
            } else {
                p.next = j
                j = j?.next
            }
            p = p.next!
        }
        
        if i != nil { p.next = i }
        if j != nil { p.next = j }
        
        return dummy.next
    }

    func sortList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }

        var prev: ListNode? = nil
        var (slow, fast) = (head, head)
        while fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }

        prev?.next = nil //: cut

        return mergeList(sortList(head), sortList(slow))
    }
}
