let tags: [Tag] = [.stack]

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var bala = 0
        var ans = 0
        
        for c in S {
            if c == "(" { bala += 1 }
            else {
                if bala == 0 { ans += 1 }
                else { bala -= 1 }
            }
        }
        
        ans += bala
        return ans
    }
}

let f = Solution().minAddToMakeValid

f("()))((") == 4
f("()))(()))(") == 4
