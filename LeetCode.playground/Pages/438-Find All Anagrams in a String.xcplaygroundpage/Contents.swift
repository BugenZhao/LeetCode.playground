let tags: [Tag] = [.array]

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard !s.isEmpty, s.count >= p.count else { return [] }

        let s = s.map { $0.alphaOrder }
        let p = p.map { $0.alphaOrder }
        var rem = [Int](repeating: 0, count: 26)
        p.forEach { rem[$0] += 1 }
        var remCount = p.count
        var results = [Int]()

        var left = 0
        for (right, char) in s.enumerated() {
            rem[char] -= 1
            if rem[char] >= 0 { remCount -= 1 }
            if right - left == p.count {
                rem[s[left]] += 1
                if rem[s[left]] >= 1 { remCount += 1 }
                left += 1
            }
            if remCount == 0 { results.append(left) }
        }

        return results
    }
}

Solution().findAnagrams("cbaebabacd", "abc")
Solution().findAnagrams("abab", "ab")
