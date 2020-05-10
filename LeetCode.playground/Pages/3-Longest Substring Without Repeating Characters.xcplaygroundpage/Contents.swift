import Foundation

let tags: [Tag] = [.array]

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {  // Scrolling windows
        guard !s.isEmpty else { return 0 }
        var leftIdx = 0
        var indexDict = [Character: Int]()
        var maxLength = 0

        for (rightIdx, char) in s.enumerated() {
            if let index = indexDict[char] {  // char appeared!
                if index >= leftIdx {
                    maxLength = max(maxLength, rightIdx - leftIdx)
                    leftIdx = index + 1
                }
            }
            indexDict[char] = rightIdx  // Set new index for char
        }

        return max(maxLength, s.count - leftIdx)
    }
}


testEqual(Solution().lengthOfLongestSubstring("abcabcbb"), 3)
testEqual(Solution().lengthOfLongestSubstring("bbbbb"), 1)
testEqual(Solution().lengthOfLongestSubstring("pwwkew"), 3)

//: [Next](@next)
