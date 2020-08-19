class Solution {
    func toGoatLatin(_ S: String) -> String {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        return S.split(separator: " ").enumerated().map { i, word in
            var new = String(word)
            if !vowels.contains(word.first!) { new = new.dropFirst() + String(word.first!) }
            new.append("m\(String(repeating: "a", count: i + 2))")
            return new
        }.joined(separator: " ")
    }
}

Solution().toGoatLatin("The quick brown fox jumped over the lazy dog")
    == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
