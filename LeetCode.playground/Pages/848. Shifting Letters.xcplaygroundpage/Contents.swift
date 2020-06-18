class Solution {
    func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
        let cum: [Int] = shifts.reversed().reduce(into: []) { $0.append(($0.last ?? 0) + $1) }.reversed()
        return String(S.enumerated().map { i, c in Character(UnicodeScalar((Int(c.asciiValue! - 0x61) + cum[i]) % 26 + 0x61)!) })
    }
}

Solution().shiftingLetters("abc", [3, 5, 9])
