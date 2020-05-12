class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var count = 0

        while num != 0 {
            if num.isMultiple(of: 2) { num /= 2 }
            else { num -= 1 }
            count += 1
        }

        return count
    }
}

Solution().numberOfSteps(123)
Solution().numberOfSteps(0)
