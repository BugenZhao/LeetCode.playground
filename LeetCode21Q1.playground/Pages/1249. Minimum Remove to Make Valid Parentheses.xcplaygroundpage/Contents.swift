let tags: [Tag] = [.ON, .stack, .string]

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        func worker<I>(_ s: I, _ open: Character, _ close: Character) -> String where I: Sequence, I.Element == Character {
            var count = 0
            var ans = ""
            for c in s {
                if c == open {
                    count += 1
                    ans.append(c)
                } else if c == close {
                    if count > 0 {
                        count -= 1
                        ans.append(c)
                    } else {
                        continue
                    }
                } else {
                    ans.append(c)
                }
            }
            return ans
        }

        let s1 = worker(s, "(", ")")
        let s2 = worker(s1.reversed(), ")", "(").reversed()
        return String(s2)
    }
}


Solution().minRemoveToMakeValid("(a(b(c)d)(") == "a(b(c)d)"
