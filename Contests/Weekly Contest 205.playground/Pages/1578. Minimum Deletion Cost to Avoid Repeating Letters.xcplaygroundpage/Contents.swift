class Solution {
    func minCost(_ s: String, _ cost: [Int]) -> Int {
        var last: Character = "0"
        var lastCost = 0; var sumCost = 0
        var ans = 0
        for (i, c) in s.enumerated() {
            if c == last {
                lastCost = max(lastCost, cost[i])
                sumCost += cost[i]
            } else {
                ans += sumCost - lastCost
                lastCost = cost[i]; sumCost = cost[i]
                last = c
            }
        }
        ans += sumCost - lastCost
        return ans
    }
}
