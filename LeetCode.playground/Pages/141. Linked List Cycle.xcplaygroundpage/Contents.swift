let tags: [Tag] = [.list, .twoPtrs]

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head

        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast { return true }
        }
        return false
    }
}
