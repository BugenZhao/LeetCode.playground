let tags: [Tag] = [.string, .marked]

class Solution {
    //: `n`: pair of parenthese remained, `open`: # of open '(' that needs to be closed
    func generateParenthesis(_ n: Int, _ open: Int = 0) -> [String] {
        guard open >= 0, n >= 0 else { return [] }
        if n == 0 { return [String(repeating: ")", count: open)] }
        else {
            return generateParenthesis(n, open - 1).map { ")\($0)" } +
                   generateParenthesis(n - 1, open + 1).map { "(\($0)" }
        }
    }
}

let f = Solution().generateParenthesis

f(0, 0)
f(1, 0)
f(2, 0)
f(3, 0)
f(4, 0)
