class Solution {
    func isPalindrome(_ _s: String) -> Bool {
        var s = [Character]()
        for c in _s.lowercased() where c.isLetter || c.isNumber { s.append(c) }
        return (0..<s.count / 2).allSatisfy { i in s[i] == s[s.count - 1 - i] }
    }
}

let f = Solution().isPalindrome

f("aba")
!f("abca")
f("A man, a plan, a canal: Panama")
