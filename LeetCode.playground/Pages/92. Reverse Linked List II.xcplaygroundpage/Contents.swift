//: See 206 first

let tags: [Tag] = [.list]

class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let dummy = ListNode(888); dummy.next = head
        var curr = head
        var prev: ListNode? = dummy

        for _ in 1..<m { (curr, prev) = (curr?.next, curr) }
        let (sCurr, sPrev) = (curr, prev)
        for _ in 0..<(n - m + 1) { (curr!.next, prev, curr) = (prev, curr, curr!.next) }
        //    sPrev sCurr     prev curr
        // 1 -> 2 <- 3 <- 4 <- 5    6 -> 7
        sPrev!.next = prev
        sCurr!.next = curr

        return dummy.next
    }
}

let f = Solution().reverseBetween

f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5]), 2, 4)!
