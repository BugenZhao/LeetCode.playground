/*: 3-state machine
 - 00 + 1 = 01
 - 01 + 1 = 10
 - 10 + 1 = 00
 */
let tags: [Tag] = [.math]

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var (h, l) = (0, 0)
        for num in nums {
            l = (l ^ num) & ~h
            h = (h ^ num) & ~l
        }
        return l
    }
}

Solution().singleNumber([0, 1, 0, 1, 0, 1, 99])
