class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        let nums = "\(n)".map { Int($0.asciiValue! - 48) }
        return nums.reduce(1, *) - nums.reduce(0, +)
    }
}

Solution().subtractProductAndSum(234)
