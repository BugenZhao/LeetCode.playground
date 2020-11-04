class Solution {
    func maxPower(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        
        var prev = s.first!
        var count = 1
        var ans = count
        for c in s.dropFirst() {
            if c == prev { count += 1 }
            else { prev = c; count = 1 }
            ans = max(ans, count)
        }
        
        return ans
    }
}
