let tags: [Tag] = [.math, .twoPtrs]

class Solution {
    var uglies = [1]
    var (t2, t3, t5) = (0, 0, 0)
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        while n > uglies.count {
            let num = min(uglies[t2] * 2, uglies[t3] * 3, uglies[t5] * 5)
            uglies.append(num)
            if num == uglies[t2] * 2 { t2 += 1 }
            if num == uglies[t3] * 3 { t3 += 1 } //: no `else`!
            if num == uglies[t5] * 5 { t5 += 1 }
        }
        return uglies[n - 1]
    }
}

let f = Solution().nthUglyNumber
(1...10).map{
    f($0)
}
