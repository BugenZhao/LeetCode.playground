let tags: [Tag] = [.ON, .bit]

class Solution {
    func worker(_ str: inout ArraySlice<Character>) -> Int {
        if str.last == "0" {
            return 1 + worker(&str[0..<str.endIndex - 1])
        } else if let zero = str.lastIndex(of: "0") {
            str[zero] = "1"
            return 1 + str.endIndex - zero - 1 + worker(&str[0...zero])
        } else {
            return str.count == 1 ? 0 : 1 + str.count
        }
    }
    func numSteps(_ s: String) -> Int {
        var str = Array(s)
        return worker(&str[...])
    }
}

let f = Solution().numSteps

f("1101")
f("11011")
f("10")
f("1")


class SolutionIter {
    func numSteps(_ s: String) -> Int {
        var s = Array(s)
        var curr = s.endIndex - 1
        var ans = 0
        while curr > s.startIndex {
            if s[curr] == "0" { ans += 1; curr -= 1 }
            else {
                while curr >= s.startIndex, s[curr] == "1" { ans += 1; curr -= 1 }
                ans += 1
                if curr >= s.startIndex { s[curr] = "1" }
            }
        }
        return ans
    }
}

let g = SolutionIter().numSteps

g("1101")
g("11011")
g("10")
g("1")
