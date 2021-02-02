class Solution {
    func countAndSay(_ N: Int) -> String {
        if N == 1 { return "1" }
        
        var (lastC, n) = (Character("0"), 0)
        var ans = ""
        for c in countAndSay(N - 1) {
            if c == lastC {
                n += 1
            } else {
                if n > 0 { ans += "\(n)\(lastC)" }
                lastC = c; n = 1
            }
        }
        if n > 0 { ans += "\(n)\(lastC)" }
        
        return ans
    }
}


let f = Solution().countAndSay

f(1) == "1"
f(4) == "1211"
