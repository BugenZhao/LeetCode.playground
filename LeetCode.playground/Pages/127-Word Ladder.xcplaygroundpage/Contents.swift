let tags: [Tag] = [.graph, .bfs, .sp]

class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // preprocess
        typealias General = [Character]
        var generalToWord = [General: [String]]() // find all possible words with general as key
        var wordToGeneral = [String: [General]]() // find all corresponed generals with word as key

        let preprocess = { (word: String) -> () in
            (0..<word.count).forEach { idx in
                var general = General(word)
                general[idx] = "*"
                generalToWord[general, default: []].append(word)
                wordToGeneral[word, default: []].append(general)
            }
        }
        preprocess(beginWord)
        wordList.forEach(preprocess)

        // BFS
        var queue = [(word: String, level: Int)]()
        var visited = Set<String>()

        queue.append((beginWord, 1))
        visited.insert(beginWord)

        var front = queue.startIndex
        while front != queue.endIndex {
            let (word, level) = queue[front]
            guard word != endWord else { return level }

            wordToGeneral[word]?.forEach { general in
                generalToWord[general]?.forEach { adjWord in
                    if !visited.contains(adjWord) {
                        queue.append((adjWord, level + 1))
                        visited.insert(adjWord)
                    }
                }
            }

            front = queue.index(after: front)
        }

        return 0
    }
}

Solution().ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
Solution().ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
