let tags: [Tag] = [.string, .marked]

class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let ss = (s + s).dropFirst().dropLast()
        return ss.contains(s)
    }
}


let f = Solution().repeatedSubstringPattern

f("abab")
f("aba")
f("abcabcabc")
