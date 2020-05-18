//: Same as 438

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard !s2.isEmpty, s2.count >= s1.count else { return false }

        let s2 = s2.map { $0.alphaOrder }
        let s1 = s1.map { $0.alphaOrder }
        var rem = [Int](repeating: 0, count: 26)
        s1.forEach { rem[$0] += 1 }
        var remCount = s1.count

        var left = 0
        for (right, char) in s2.enumerated() {
            rem[char] -= 1
            if rem[char] >= 0 { remCount -= 1 }
            if right - left == s1.count {
                rem[s2[left]] += 1
                if rem[s2[left]] >= 1 { remCount += 1 }
                left += 1
            }
            if remCount == 0 { return true }
        }

        return false
    }
}
