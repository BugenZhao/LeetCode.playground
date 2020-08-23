let tags: [Tag] = [.tree, .string]

final class StreamChecker {
    let root = Trie()
    var history = ""

    init(_ words: [String]) {
        for word in words { root.insert(word.reversed()) }
    }

    func query(_ letter: Character) -> Bool {
        history.append(letter)
        var p = root
        for letter in history.reversed() {
            guard let next = p.children[letter] else { break }
            if next.isEnd { return true }
            p = next
        }
        return false
    }
}


let streamChecker = StreamChecker(["cd", "f", "kl"]) // init the dictionary.
streamChecker.query("a") // return false
streamChecker.query("b") // return false
streamChecker.query("c") // return false
streamChecker.query("d") // return true, because "cd" is in the wordlist
streamChecker.query("e") // return false
streamChecker.query("f") // return true, because "f" is in the wordlist
streamChecker.query("g") // return false
streamChecker.query("h") // return false
streamChecker.query("i") // return false
streamChecker.query("j") // return false
streamChecker.query("k") // return false
streamChecker.query("l") // return true, because "kl" is in the wordlist




final class StreamCheckerMultiplePointers {
    let root = Trie()
    var finders = [Trie]()

    init(_ words: [String]) {
        for word in words { root.insert(word) }
        finders.append(root)
    }

    func query(_ letter: Character) -> Bool {
        var newFinders = [root]
        var found = false
        for finder in finders {
            if let next = finder.children[letter] {
                if next.isEnd { found = true }
                newFinders.append(next)
            }
        }
        finders = newFinders
        return found
    }
}
