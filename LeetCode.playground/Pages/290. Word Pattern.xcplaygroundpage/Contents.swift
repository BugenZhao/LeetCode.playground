let tags: [Tag] = [.hash]

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let tokens = str.split(separator: " ")
        guard pattern.count == tokens.count else { return false }
        
        var map = [Character: Substring]()
        var antiMap = [Substring: Character]()
        for (char, token) in zip(pattern, tokens) {
            if let s = map[char], s != token { return false }
            if let c = antiMap[token], c != char { return false }
            map[char] = token
            antiMap[token] = char
        }
        return true
    }
}
