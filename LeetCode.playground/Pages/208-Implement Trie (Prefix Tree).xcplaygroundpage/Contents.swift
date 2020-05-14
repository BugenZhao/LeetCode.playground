/*:
 ### Trie 前缀树
 
 ![Figure](208.png width="500")
 */

let tags: [Tag] = [.tree]

extension Character {
    var alphaOrder: Int {
        return Int(self.asciiValue! - Character("a").asciiValue!)
    }
}

class Trie {
    var isEnd: Bool = false
    var children = [Trie?](repeating: nil, count: 26)

    /** Initialize your data structure here. */
    init() { }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
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
    func search(_ word: String) -> Bool {
        let word = Array(word)
        var root = self
        for letter in word {
            guard let next = root.children[letter.alphaOrder] else { return false }
            root = next
        }
        return root.isEnd
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        let word = Array(prefix)
        var root = self
        for letter in word {
            guard let next = root.children[letter.alphaOrder] else { return false }
            root = next
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

let trie = Trie()
trie.insert("bugen")
trie.insert("bus")
trie.insert("zhao")
trie.search("zhao")   // true
trie.search("zh")     // false -> not a end
trie.search("hi")     // false
trie.startsWith("zh") // true
trie.insert("zh")
trie.search("zh")     // true
