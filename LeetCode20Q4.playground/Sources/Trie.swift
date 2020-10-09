public final class Trie {
    public private(set) var isEnd: Bool = false
    public private(set) var children = [Character: Trie]()

    /** Initialize your data structure here. */
    public init() { }

    /** Inserts a word into the trie. */
    public func insert<T>(_ word: T) where T: Sequence, T.Element == Character {
        var root = self
        for letter in word {
            if root.children[letter] == nil {
                root.children[letter] = Trie()
            }
            root = root.children[letter]!
        }
        root.isEnd = true
    }

    /** Returns if the word is in the trie. */
    public func search<T>(_ word: T) -> Bool where T: Sequence, T.Element == Character {
        var root = self
        for letter in word {
            guard let next = root.children[letter] else { return false }
            root = next
        }
        return root.isEnd
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    public func startsWith<T>(_ prefix: T) -> Bool where T: Sequence, T.Element == Character {
        var root = self
        for letter in prefix {
            guard let next = root.children[letter] else { return false }
            root = next
        }
        return true
    }
}


extension Trie: Hashable {
    public static func == (lhs: Trie, rhs: Trie) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(self).hash(into: &hasher)
    }
}
