//: Moreover, use bit set
let tags: [Tag] = [.greedy]

class Solution {
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        var dict = [Int: [Bool]]()
        reservedSeats.forEach { dict[$0[0], default: .init(repeating: true, count: 10)][$0[1] - 1] = false }

        var number = 0
        for row in dict.values {
            var count = 0
            if row[1], row[2], row[3], row[4] { count += 1 }
            if row[5], row[6], row[7], row[8] { count += 1 }
            if count == 0, row[3], row[4], row[5], row[6] { count += 1 }
            number += count
        }
        number += (n - dict.count) * 2
        return number
    }
}

let f = Solution().maxNumberOfFamilies
f(3, [[1, 2], [1, 3], [1, 8], [2, 6], [3, 1], [3, 10]])
f(2, [[2, 1], [1, 8], [2, 6]])
f(4, [[4, 3], [1, 4], [4, 6], [1, 7]])
