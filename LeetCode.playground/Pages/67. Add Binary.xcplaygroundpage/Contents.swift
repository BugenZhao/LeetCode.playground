class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a.reversed()).map { $0 == "1" }
        let b = Array(b.reversed()).map { $0 == "1" }

        var (i, j) = (0, 0)
        var carry = false
        var ans = [Bool]()
        while i < a.count || j < b.count {
            let x = i >= a.count ? false : a[i]
            let y = j >= b.count ? false : b[j]
            ans.append((x != y) != carry)
            carry = (x && y) || (y && carry) || (carry && x)
            i += 1; j += 1
        }
        if carry { ans.append(carry) }

        return ans.map { $0 ? "1" : "0" }.reversed().joined()
    }
}

let f = Solution().addBinary

f("11", "1")
f("1", "11")
f("1010", "1011")
f("11111111", "1")
