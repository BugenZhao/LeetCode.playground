let tags: [Tag] = [.math]

class Solution {
    func reverse(_ x: Int) -> Int {
        let neg = x < 0
        var x = abs(x)
        var ans = 0;

        while x > 0 {
            ans = ans * 10 + x % 10
            x /= 10
        }

        if ans > Int(Int32.max) || ans < Int(Int32.min) { ans = 0 }
        return neg ? -ans : ans
    }
}


let f = Solution().reverse

f(123)
f(-321)
f(-120)
f(0)
f(Int(Int32.min))
