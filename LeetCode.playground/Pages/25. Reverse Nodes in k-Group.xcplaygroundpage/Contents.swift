//: See 92 first

let tags: [Tag] = [.list]

class Solution {
    func reverseFirstK(_ head: ListNode?, _ k: Int) -> (ListNode?, ListNode?) {
        var curr = head
        var prev: ListNode? = nil
        for _ in 0..<k { (curr!.next, prev, curr) = (prev, curr, curr!.next) }
        // head                prev curr
        //  1 <- 2 <- 3 <- 4 <- 5    6 -> 7
        head!.next = curr
        return (prev, head) //: head and tail
    }

    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        let count = head.count
        let dummy = ListNode(888); dummy.next = head
        
        var curr: ListNode? = dummy
        for _ in 0..<count / k { (curr!.next, curr) = reverseFirstK(curr!.next, k) }
        
        return dummy.next
    }
}

let f = Solution().reverseKGroup

f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 1)
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 2)
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 3)
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 4)
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 5)

f(ListNode.makeLinkedList(from: [1]), 1)
f(ListNode.makeLinkedList(from: []), 0)
