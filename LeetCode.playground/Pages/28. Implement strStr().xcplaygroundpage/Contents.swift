//: KMP Algorithm
//: https://www.zhihu.com/question/21923021

let tags: [Tag] = [.string, .marked]

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let txt = Array(haystack)
        let pat = Array(needle)
        
        var pmt = [Int](repeating: 0, count: pat.count) //: build Partial Match Table
        var len = 0
        for i in 1..<pat.count {
            while len > 0, pat[len] != pat[i] {
                len = pmt[len - 1]
            }
            if pat[i] == pat[len] { len += 1 }
            pmt[i] = len
        }
        
        var j = 0
        for i in 0..<txt.count {
            while j > 0, pat[j] != txt[i] {
                j = pmt[j - 1]
            }
            if txt[i] == pat[j] { j += 1 }
            if j == pat.count { return i - pat.count + 1 }
        }
        
        return -1
    }
}

let f = Solution().strStr
f("abcd", "ab")
f("abcdabcabce", "abca")
