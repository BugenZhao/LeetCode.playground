let tags: [Tag] = [.stack]

class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        var cur = 0
        var ans = ""
        for c in S {
            if c == "(" {
                if cur != 0 { ans.append(c) }
                cur += 1
            } else {
                cur -= 1
                if cur != 0 { ans.append(c) }
            }
        }
        return ans
    }
}


let f = Solution().removeOuterParentheses

f("(()())(())") == "()()()"
