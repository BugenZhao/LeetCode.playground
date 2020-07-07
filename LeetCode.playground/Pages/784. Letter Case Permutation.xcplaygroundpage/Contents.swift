class Solution {
    func letterCasePermutation(_ S: String) -> [String] {
        let S = Array(S)
        var results = [S]
        for (i, c) in S.enumerated() where c.isLetter {
            results += results.map { s in var s = s
                if c.isUppercase { s[i] = Character(UnicodeScalar(c.asciiValue! + 0x20)) }
                else { s[i] = Character(UnicodeScalar(c.asciiValue! - 0x20)) }
                return s
            }
        }
        return results.map { String($0) }
    }
}

Solution().letterCasePermutation("u1s1")
Solution().letterCasePermutation("1234")
