let tags: [Tag] = [.string]

class Solution {
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        let (A, B) = (Array(A), Array(B))

        for startA in A.indices {
            var j = B.startIndex
            while j < B.endIndex, B[j] == A[(startA + j) % A.count] { j += 1 }
            if j == B.endIndex {
                var k = (startA + j) / A.count
                if (startA + j) % A.count != 0 { k += 1 }
                return k
            } else if j >= A.count {
                return -1
            }
        }
        return -1
    }
}

let f = Solution().repeatedStringMatch

f("abcd", "cdabcdab")
f("abcd", "abcdabcd")
f("abcdabcd", "abcd")
f("abcd", "x")
