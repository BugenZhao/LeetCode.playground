let tags: [Tag] = [.list]

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        let k = k % head!.count
        if k == 0 { return head }
        
        var slow = head; var fast = head
        for i in 0... {
            fast = fast?.next
            if i >= k { slow = slow?.next }
            if fast?.next == nil { break }
        }
        let new = slow?.next
        fast?.next = head
        slow?.next = nil
        return new
    }
}


let f = Solution().rotateRight

f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 1)
f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 2)
f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 3)
f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 4)
f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 5)
f(ListNode.makeLinkedList(from: [1,2,3,4,5]), 6)
