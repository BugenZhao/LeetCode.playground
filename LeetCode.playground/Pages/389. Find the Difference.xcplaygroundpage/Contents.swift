let tags: [Tag] = [.bit]

class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let xorS = s.reduce(0) { $0 ^ $1.asciiValue! }
        let xorT = t.reduce(0) { $0 ^ $1.asciiValue! }
        return Character(UnicodeScalar(xorS ^ xorT))
    }
}

Solution().findTheDifference("abcd", "dceab")
