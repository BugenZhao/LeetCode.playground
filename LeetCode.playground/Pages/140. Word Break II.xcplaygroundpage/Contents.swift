let tags: [Tag] = [.dp, .dfs, .string]

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let s = Array(s)
        if s.isEmpty { return [] }

        let wordArrDict = wordDict.map { Array($0) }
        var memo = [Int: [[Int]]]()

        func worker(_ n: Int) -> [[Int]] {
            if n == 0 { return [[]] }
            if let result = memo[n] { return result }

            var result = [[Int]]()
            for (i, word) in wordArrDict.enumerated() where n >= word.count {
                let sub = s[n - word.count..<n]
                if sub == word[...] {
                    result.append(contentsOf: worker(n - word.count).map { $0 + [i] })
                }
            }

            memo[n] = result
            return result
        }

        return worker(s.count).map { $0.map { wordDict[$0] }.joined(separator: " ") }
    }
}

let f = Solution().wordBreak

f("catsanddog", ["cat", "cats", "and", "sand", "dog"])
f("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"])
f("fvck", ["fuck"])
