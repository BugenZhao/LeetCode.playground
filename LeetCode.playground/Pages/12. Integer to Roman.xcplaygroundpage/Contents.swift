let tags: [Tag] = [.math]

class Solution {
    func intToRoman(_ num: Int) -> String {
        let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]

        var num = num
        var ans = ""
        for (s, v) in zip(symbols, values) {
            while num >= v {
                ans += String(repeating: s, count: num / v)
                num %= v
            }
        }
        return ans
    }
}

let f = Solution().intToRoman

f(14)
f(99)
f(1000000)
