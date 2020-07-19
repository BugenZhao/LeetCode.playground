let tags: [Tag] = [.twoPtrs, .hash, .ON]

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = Array(s)

        var need = [Character: Int]()
        for c in t { need[c, default: 0] += 1 }
        var insufficient = need.count

        var (i, j) = (0, 0)
        var ans = 0..<Int.max
        while j != s.endIndex {
            while j < s.endIndex, insufficient > 0 {
                if need[s[j]] != nil {
                    need[s[j]]! -= 1
                    if need[s[j]]! == 0 { insufficient -= 1 }
                }
                j += 1
            }
            while i <= j, insufficient <= 0 {
                if need[s[i]] != nil {
                    need[s[i]]! += 1
                    if need[s[i]]! == 1 { insufficient += 1 }
                }
                i += 1
            }

            if i > 0 {
                let newAns = i - 1..<j
                if newAns.count < ans.count { ans = newAns }
            }
        }

        return ans.endIndex == Int.max ? "" : String(s[ans])
    }
}

let f = Solution().minWindow

f("ADOBECODEBANC", "ABC")
f("AAA", "b")
f("abcd", "dcba")
f("abecd", "dcba")
f("abcde", "dcba")
f("eabcd", "dcba")
