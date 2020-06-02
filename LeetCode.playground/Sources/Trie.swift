// import Character

public class Trie {
    public private(set) var isEnd: Bool = false
    public private(set) var children = [Trie?](repeating: nil, count: 26)

    /** Initialize your data structure here. */
    public init() { }

    /** Inserts a word into the trie. */
    public func insert(_ word: String) {
        let word = Array(word)
        var root = self
        for letter in word {
            if root.children[letter.alphaOrder] == nil {
                root.children[letter.alphaOrder] = Trie()
            }
            root = root.children[letter.alphaOrder]!
        }
        root.isEnd = true
    }

    /** Returns if the word is in the trie. */
    public func search(_ word: String) -> Bool {
        let word = Array(word)
        var root = self
        for letter in word {
            guard let next = root.children[letter.alphaOrder] else { return false }
            root = next
        }
        return root.isEnd
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    public func startsWith(_ prefix: String) -> Bool {
        let word = Array(prefix)
        var root = self
        for letter in word {
            guard let next = root.children[letter.alphaOrder] else { return false }
            root = next
        }
        return true
    }
}
