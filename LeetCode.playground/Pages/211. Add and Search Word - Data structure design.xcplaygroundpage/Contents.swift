final class WordDictionary {
    final class Node {
        var isEnd = false
        var children = [Character: Node]()
    }

    let root = Node()

    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil { node.children[char] = Node() }
            node = node.children[char]!
        }
        node.isEnd = true
    }

    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        func worker(_ sub: Substring, _ node: Node) -> Bool {
            guard let char = sub.first else { return node.isEnd }
            let nextSub = sub.dropFirst()

            switch char {
            case ".":
                return !node.children.values.allSatisfy { worker(nextSub, $0) == false }
            default:
                guard let next = node.children[char] else { return false }
                return worker(nextSub, next)
            }
        }
        return worker(word[...], root)
    }
}

let dict = WordDictionary()
dict.addWord("bad")
dict.addWord("dad")
dict.addWord("mad")

!dict.search("pad")
dict.search("bad")
dict.search(".ad")
dict.search("b..")
dict.search(".a.")
!dict.search("ba")
!dict.search("")
