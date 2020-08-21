let tags: [Tag] = [.list, .marked]

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var curr = head
        var prev: ListNode? = nil
        //  prev   curr
        // (nil ->) 1 -> 2 -> 3 -> 4 -> nil
        //         prev curr
        // (nil <-) 1 -> 2 -> 3 -> 4 -> nil
        //              prev curr
        // (nil <-) 1 <- 2 -> 3 -> 4 -> nil
        //                   prev curr
        // (nil <-) 1 <- 2 <- 3 -> 4 -> nil
        //                        prev curr
        // (nil <-) 1 <- 2 <- 3 <- 4 -> nil
        while curr != nil {
            (curr!.next, prev, curr) = (prev, curr, curr!.next)
        }
        return prev
    }
}

let f = Solution().reverseList

f(ListNode.makeLinkedList(from: [1, 2, 3, 4]))
f(ListNode.makeLinkedList(from: [1]))
f(nil)
