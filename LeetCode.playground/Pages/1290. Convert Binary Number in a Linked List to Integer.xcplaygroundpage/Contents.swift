let tags: [Tag] = [.bit]

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard var current = head else { return 0 }
        var num = current.val
        while let next = current.next {
            num = (num << 1) ^ next.val
            current = next
        }
        return num
    }
}

Solution().getDecimalValue(ListNode.makeLinkedList(from: [1, 0, 1]))
