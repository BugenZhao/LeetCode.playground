class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        func dfs(_ n: Int) -> Int {
            if n < 2 { return n }
            let m = dfs(n / 2)
            return m * 2 + (m % 2 + n % 2) % 2
        }
        return dfs(n)
    }
}
