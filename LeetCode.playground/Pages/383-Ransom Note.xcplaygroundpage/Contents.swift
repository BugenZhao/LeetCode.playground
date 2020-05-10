let tags: [Tag] = [.hash]

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var noteDict = [Character: Int]()
        var magazineDict = [Character: Int]()
        magazine.forEach { magazineDict[$0, default: 0] += 1 }
        ransomNote.forEach { noteDict[$0, default: 0] += 1 }
    
        return noteDict.keys.allSatisfy { noteDict[$0]! <= (magazineDict[$0] ?? 0) }
    }
}

let canConstruct = Solution().canConstruct

canConstruct("a", "b")
canConstruct("aa", "ab")
canConstruct("aa", "aab")
