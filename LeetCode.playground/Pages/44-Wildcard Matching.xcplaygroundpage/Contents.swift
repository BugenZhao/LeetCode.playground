/*:
 ***Strategy of Matching `*`***  Always prefer matching no characters, try 1,2,... if not successful.

 */
let tags: [Tag] = [.marked, .dfs, .greedy]

class Solution {
    struct Pair: Equatable, Hashable {
        let sFrom: Int
        let pFrom: Int
    }

    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s); let p = Array(p)

        var memo = [Pair: Bool]()
        func isMatch(sFrom: Int, pFrom: Int) -> Bool {
            if let m = memo[Pair(sFrom: sFrom, pFrom: pFrom)] { return m }

            var ret: Bool
            defer { memo[Pair(sFrom: sFrom, pFrom: pFrom)] = ret }

            if pFrom > p.count { //: no more char in pattern
                ret = false
            } else if pFrom == p.count { //: reach the end of pattern
                ret = sFrom == s.count
            } else if sFrom == s.count { //: reach the end of string
                ret = p[pFrom...].allSatisfy { $0 == "*" } //: trailing `*` is acceptable
            } else if p[pFrom] == "?" || s[sFrom] == p[pFrom] { //: match one char
                ret = isMatch(sFrom: sFrom + 1, pFrom: pFrom + 1)
            } else if p[pFrom] == "*" { //: match `*`
                ret = false
                for sNext in sFrom...s.count { //: match `s` from 0 chars
                    ret = isMatch(sFrom: sNext, pFrom: pFrom + 1)
                    if ret { break }
                }
            } else { //: cannot match
                ret = false
            }

            return ret
        }

        return isMatch(sFrom: 0, pFrom: 0)
    }
}

let f = Solution().isMatch

f("aa", "a")
f("aa", "*")
f("cb", "?a")
f("acdcb", "a*c?b")
f("sabcabc", "s*abc")
f("sabcabc", "s*bc*****")


//: Much faster!  Why?
class SolutionIteration {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s); let p = Array(p)
        var sp = 0; var pp = 0
        var lastStar = -1; var lastStarMatch = 0 //: the position of last star, and the last char it matched

        while sp < s.count {
            if pp < p.count, s[sp] == p[pp] || p[pp] == "?" { //: match one char
                sp += 1; pp += 1
            } else if pp < p.count, p[pp] == "*" { //: match `*`
                lastStar = pp
                lastStarMatch = sp //: prefer matching no chars
                pp += 1
            } else if lastStar >= 0 { //: oops, maybe we should re-match the last `*`
                lastStarMatch += 1 //: match one more char
                sp = lastStarMatch //: backtrack
                pp = lastStar //: backtrack
                pp += 1
            } else {
                return false //: nope
            }
        }

        return pp == p.count || p[pp...].allSatisfy { $0 == "*" }
    }
}

let g = Solution().isMatch

g("aa", "a")
g("aa", "*")
g("cb", "?a")
g("acdcb", "a*c?b")
g("sabcabc", "s*abc")
g("sabcabc", "s*bc*****")
