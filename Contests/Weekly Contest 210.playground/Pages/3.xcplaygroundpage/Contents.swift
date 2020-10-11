class Solution {
    func worker(_ a: [Character], _ b: [Character]) -> Bool {
        var bad = (0..<b.count / 2).filter { i in b[i] != b[b.count - 1 - i] }.count

        for i in 0..<b.count / 2 {
            if b[i] != b[b.count - 1 - i] {
                if a[i] == b[b.count - 1 - i] { bad -= 1 }
                return false
            } else if a[i] != b[i] {
                return false
            }
            if bad == 0 { return true }
        }

        return bad == 0
    }

    func checkPalindromeFormation(_ a: String, _ b: String) -> Bool {
        let a = Array(a)
        let b = Array(b)
        return worker(a, b) || worker(b, a) ||
               worker(a.reversed(), b.reversed()) || worker(b.reversed(), a.reversed())
    }
}


let f = Solution().checkPalindromeFormation

//f("cdeoo", "oooab")
//f("ulacfd", "jizalu")
f("aejbaalflrmkswrydwdkdwdyrwskmrlfqizjezd", "uvebspqckawkhbrtlqwblfwzfptanhiglaabjea")
