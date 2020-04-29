// Dynamic Programming
//: ![Figure](32.png)

extension Array {
    subscript (_ index: Index, default default: Element) -> Element {
        return indices.contains(index) ? self[index]: `default`
    }
}

class SolutionDP {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count >= 2 else { return 0 }
        let s = Array(s)
        // dp[i] represents the maximal length of valid parentheses ending up with the i-th char
        var dp = [Int](repeating: 0, count: s.count)

        for i in 1..<s.count {
            if s[i] == ")" { // ....)
                if s[i - 1] == "(" { // ....()
                    dp[i] = dp[i - 2, default: 0] + 2
                } else if s[i - dp[i - 1] - 1, default: "."] == "(" { // s[i - 1] == ")", ...((....))
                    dp[i] = dp[i - dp[i - 1] - 2, default: 0] + dp[i - 1] + 2
                }
            }
        }
        return dp.max()!
    }
}

SolutionDP().longestValidParentheses("(()") == 2
SolutionDP().longestValidParentheses("(())") == 4
SolutionDP().longestValidParentheses("((()()") == 4
SolutionDP().longestValidParentheses("(()") == 2
