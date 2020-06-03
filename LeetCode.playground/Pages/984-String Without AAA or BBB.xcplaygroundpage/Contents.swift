//: See also: 1405

let tags: [Tag] = [.greedy]

class Solution {
    func strWithout3a3b(_ A: Int, _ B: Int) -> String {
        typealias Pair = (count: Int, char: Character)
        var (A, B) = (Pair(A, "a"), Pair(B, "b"))
        var result = ""
        let put = { (pair: inout Pair) -> Void in result.append(pair.char); pair.count -= 1 }

        //: always put the one with larger count
        while A.count + B.count > 0 {
            if A.count < B.count { swap(&A, &B) }
            put(&A) //: put `a`
            if A.count >= B.count && A.count > 0 { put(&A) } //: put another `a` optionally, avoid `..aab,bb..`
            if B.count > 0 { put(&B) } //: put `b`
        }

        return result
    }
}


let f = Solution().strWithout3a3b

f(1, 3)
f(1, 2)
f(4, 1)
f(4, 4)
f(10, 10)
