let tags: [Tag] = [.string]

class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        if A.count != B.count { return false }
        
        let diff = zip(A, B).filter { $0 != $1 }
        if diff.count == 0 {
            var counter = [Character: Int]()
            for c in A {
                counter[c, default: 0] += 1
            }
            return counter.contains(where: { $0.value >= 2 })
        } else if diff.count == 2 {
            return diff[0].0 == diff[1].1 && diff[0].1 == diff[1].0
        }
        
        return false
    }
}


let f = Solution().buddyStrings

f("abcd", "acbd")
f("abcd", "dbca")
!f("abcd", "dcba")
f("aab", "baa")
!f("aab", "bba")
f("aab", "aab")
!f("abc", "abc")
