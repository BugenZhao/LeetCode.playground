let tags: [Tag] = [.list]

class Solution {
    func take(_ node: ListNode?, _ c: Int) -> ListNode? {
        if c == 0 { return nil }
        var node = node
        for _ in 1..<c { node = node!.next }
        let next = node!.next
        node!.next = nil
        return next
    }

    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        let count = root?.count ?? 0
        let per = count / k

        var curr = root
        var ans = [ListNode?]()
        for i in 0..<k {
            ans.append(curr)
            curr = take(curr, i < count % k ? per + 1 : per)
        }

        return ans
    }
}


let f = Solution().splitListToParts

f(ListNode.makeLinkedList(from: [1, 2, 3]), 5)
f(ListNode.makeLinkedList(from: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]), 3)
f(ListNode.makeLinkedList(from: []), 3)
