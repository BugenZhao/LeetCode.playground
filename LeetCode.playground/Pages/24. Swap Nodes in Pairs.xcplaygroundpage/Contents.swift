let tags: [Tag] = [.list]

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        //: `[head b] c` => `[b head] c`
        guard let b = head?.next else { return head }
        let c = b.next
        b.next = head
        head?.next = swapPairs(c)
        return b
    }
}
