let tags: [Tag] = [.string, .dp]

class Solution { //: TODO: memo
    func isMatch(_ s: String, _ p: String) -> Bool {
        func isMatchWorker(_ s: ArraySlice<Character>, _ p: ArraySlice<Character>) -> Bool {
            switch (s.count, p.count) {
            case (0, 0):
                return true
            case (1..., 0):
                return false
            case (0, 1):
                return false
            case (1..., 1):
                return s.count == 1 && (p.first! == "." || s.first! == p.first!)
            case (0, 2...):
                return p[p.startIndex + 1] == "*" && isMatchWorker(s, p.dropFirst(2))
            default:
                if p[p.startIndex + 1] == "*" {
                    var matchIndex = s.startIndex
                    repeat {
                        if isMatchWorker(s[matchIndex..<s.endIndex], p.dropFirst(2)) {
                            return true
                        }
                        matchIndex += 1
                    } while matchIndex <= s.endIndex && (p.first! == "." || s[matchIndex - 1] == p.first!)
                    return false
                } else {
                    return (p.first! == "." || s.first! == p.first!) && isMatchWorker(s.dropFirst(), p.dropFirst())
                }
            }
        }
        return isMatchWorker(ArraySlice(s), ArraySlice(p))
    }
}

let f = Solution().isMatch

!f("aa", "a")
f("aa", "a*")
f("ab", ".*")
f("aa", ".*")
f("aab", "c*a*b")
f("aab", "c*a*.")
f("aab", "c*a.*")
!f("mississippi", "mis*is*p*.")
f("mississippi", "mis*is*ip*.")
!f("ab", ".*c")
f("ab", ".*b")
f("aaa", "a.a")
