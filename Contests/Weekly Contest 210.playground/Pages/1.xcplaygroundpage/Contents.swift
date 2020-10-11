class Solution {
    func maxDepth(_ s: String) -> Int {
        var depth = 0
        var ans = 0
        for c in s {
            if c == "(" { depth += 1 }
            else if c == ")" { depth -= 1 }
            ans = max(ans, depth)
        }
        return ans
    }
}
