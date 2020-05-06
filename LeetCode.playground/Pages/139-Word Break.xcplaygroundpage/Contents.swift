//: Dynamic programming with memoization
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        let wordDict = wordDict.map { Array($0) }

        var memo = [Int: Bool]() //: memoization
        func worker(_ count: Int) -> Bool {
            if count == 0 { return true }
            if memo.keys.contains(count) { return memo[count]! }

            let result = wordDict.contains { word in //: Can we find a word, such that...
                guard word.count <= count else { return false }
                return Array(chars[(count - word.count)..<count]) == word //: suffix is the word, and...
                    && worker(count - word.count) //: remaining ones are good?
            }
            memo[count] = result
            return result
        }

        return worker(chars.count)
    }
}


let f = Solution().wordBreak

f("leetcode", ["leet", "code"])
f("applepenapple", ["apple", "pen"])
