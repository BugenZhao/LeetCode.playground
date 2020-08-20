let tags: [Tag] = [.list, .marked]

class SolutionR {
    func reorderListAndGetTail(_ head: ListNode?, _ count: Int) -> ListNode? {
        switch count {
        case 0, 1: return head
        case 2: return head?.next
        default:
            //: after reordering internal nodes: `... [head (b .. c) d] e ...`
            //: assuming that we ensure `c.next == d` in previous recursion
            //: expected result: `... [head d (b .. c)] e ...`
            //: we should also ensure that `c.next == e`
            let b = head?.next
            let c = reorderListAndGetTail(b, count - 2)
            let d = c?.next
            let e = d?.next
            head?.next = d
            d?.next = b
            c?.next = e
            return c
        }
    }

    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }
        _ = reorderListAndGetTail(head, head.count)
    }
}


let g = SolutionR().reorderList

let list4 = ListNode.makeLinkedList(from: [1, 2, 3, 4, 5])
g(list4)
list4

let list5 = ListNode.makeLinkedList(from: [1, 2, 3, 4])
g(list5)
list5

let list6 = ListNode.makeLinkedList(from: [1])
g(list6)
list6




class Solution {
    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }

        var revHead = ListNode(head.val)
        var p = head
        var count = 1
        while let next = p.next {
            let node = ListNode(next.val)
            node.next = revHead
            revHead = node
            p = next
            count += 1
        }

        let half = (count + 1) / 2
        var (p1, p2) = (head, revHead)
        for _ in 0..<half - 1 {
            let (n1, n2) = (p1.next!, p2.next!)
            p1.next = p2
            p2.next = n1
            p1 = n1
            p2 = n2
        }

        if count.isMultiple(of: 2) {
            p1.next = p2
            p2.next = nil
        } else {
            p1.next = nil
        }
    }
}


let f = Solution().reorderList

let list = ListNode.makeLinkedList(from: [1, 2, 3, 4, 5])
f(list)
list

let list2 = ListNode.makeLinkedList(from: [1, 2, 3, 4])
f(list2)
list2

let list3 = ListNode.makeLinkedList(from: [1])
f(list3)
list3
