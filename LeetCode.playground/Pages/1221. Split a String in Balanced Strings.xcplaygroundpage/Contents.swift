class Solution {
    func balancedStringSplit(_ s: String) -> Int {
        let nums = s.map { $0 == "R" ? 1 : -1 }
        let acc = nums.reduce(into: []) { acc, i in acc.append(i + (acc.last ?? 0)) }
        return acc.filter { $0 == 0 }.count
    }
}

Solution().balancedStringSplit("RLLLLRRRLR")
