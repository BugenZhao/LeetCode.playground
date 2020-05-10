//: Dynamic programming

let tags: [Tag] = [.dp]

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let s1 = Array(s1) ; let s2 = Array(s2) ; let s3 = Array(s3)
        let c1 = s1.count ; let c2 = s2.count ; let c3 = s3.count
        guard c1 + c2 == c3 else { return false }
        
        var memo = [[Bool?]](repeating: [Bool?](repeating: nil, count: c2 + 1), count: c1 + 1)

        //: Can we use the first `i` chars of `s1` and first `j` chars of `s2` to interleave the first `i+j` chars of `s3`?
        func worker(_ i: Int, _ j: Int) -> Bool {
            guard memo[i][j] == nil else { return memo[i][j]! }
            if i == 0 && j == 0 { return true }

            var result: Bool = false
            //: `s1` contributes the last char
            if i >= 1 && s3[i + j - 1] == s1[i - 1] { result = result || worker(i - 1, j) }
            //: `s2` contributes the last char
            if j >= 1 && s3[i + j - 1] == s2[j - 1] { result = result || worker(i, j - 1) }

            memo[i][j] = result
            return result
        }

        return worker(c1, c2)
    }
}

let f = Solution().isInterleave
f("aabcc", "dbbca", "aadbbcbcac")
f("aabcc", "dbbca", "aadbbbaccc")
f("", "", "a")
f("a", "", "c")
f("a", "b", "a")
f("a", "b", "ab")
