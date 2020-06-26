let tags: [Tag] = [.list, .twoPtrs, .marked]

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head

        while fast?.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                //: slow = a+b, fast = a+(b+c)+b = 2(a+b) => a = c
                var finder = head
                //: finder = 0
                while finder !== slow {
                    finder = finder?.next
                    slow = slow?.next
                }
                //: finder = a+k, slow = a+b+a+k = a+(b+c)+k, first meet: k = 0 => finder = a
                return finder
            }
        }
        return nil
    }
}
