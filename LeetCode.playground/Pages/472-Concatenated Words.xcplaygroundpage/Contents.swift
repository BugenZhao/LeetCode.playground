let tags: [Tag] = [.string, .tree, .dfs]

class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        let root = Trie()
        words.forEach { root.insert($0) }
        let wordSlices = words.map { ArraySlice($0) }

        func test(_ word: ArraySlice<Character>, count: Int = 0) -> Bool {
            if word.isEmpty { return count >= 2 }
            var node = root
            for (offset, letter) in word.enumerated() {
                guard let next = node.children[letter.alphaOrder] else { return false }
                if next.isEnd, test(word[(word.startIndex + offset + 1)...], count: count + 1) { return true }
                node = next
            }
            return false
        }

        return words.enumerated().filter { test(wordSlices[$0.0]) }.map { $0.1 }
    }
}


Solution().findAllConcatenatedWordsInADict(["cat", "cats", "catsdogcats", "dog", "dogcatsdog", "hippopotamuses", "rat", "ratcatdogcat"])
