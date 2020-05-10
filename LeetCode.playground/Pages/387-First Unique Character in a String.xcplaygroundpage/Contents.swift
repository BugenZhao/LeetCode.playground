import Foundation

let tags: [Tag] = [.string]

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var counts = [Int](repeating: 0, count: 26)
        s.forEach { counts[Int($0.asciiValue!) - 0x61] += 1 }
        return s.enumerated().first(where: { counts[Int($1.asciiValue!) - 0x61] == 1 })?.offset ?? -1
    }
}


let f = Solution().firstUniqChar

f("leetcode")
f("loveleetcode")
f("aaa")
