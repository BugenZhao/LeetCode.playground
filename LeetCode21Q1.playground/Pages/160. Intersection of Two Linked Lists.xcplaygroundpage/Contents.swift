let tags: [Tag] = [.list, .twoPtrs, .ON]

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard var headA = headA else { return nil }
        guard var headB = headB else { return nil }
        
        let a = headA.count
        let b = headB.count
        if a > b { (headA, headB) = (headB, headA) }
        
        var p: ListNode? = headA
        var q: ListNode? = headB
        for _ in 0..<abs(b - a) { q = q?.next }
        
        while true {
            if p === q { return p }
            p = p?.next
            q = q?.next
        }
    }
}
