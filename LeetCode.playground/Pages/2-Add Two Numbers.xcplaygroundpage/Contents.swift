import Foundation

let tags: [Tag] = [.list]

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carried: Bool = false) -> ListNode? {
        guard let l1 = l1 else {
            if carried {
                return addTwoNumbers(ListNode(1), l2)
            } else {
                return l2
            }
        }
        guard let l2 = l2 else {
            if carried {
                return addTwoNumbers(l1, ListNode(1))
            } else {
                return l1
            }
        }
        let sum = l1.val + l2.val + (carried ? 1 : 0)
        let toCarry = sum > 9
        let result = ListNode(sum % 10)
        result.next = addTwoNumbers(l1.next, l2.next, toCarry)

        return result
    }
}


let list1 = ListNode.makeLinkedList(from: [2, 4, 3])
let list2 = ListNode.makeLinkedList(from: [5, 6, 4])
testEqual(Solution().addTwoNumbers(list1, list2),
    ListNode.makeLinkedList(from: [7, 0, 8]))
