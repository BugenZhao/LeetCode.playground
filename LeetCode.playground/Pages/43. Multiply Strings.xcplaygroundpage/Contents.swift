let tags: [Tag] = [.math, .marked]

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        var prod = [Int](repeating: 0, count: num1.count + num2.count)
        for (i, a) in num1.reversed().enumerated() {
            for (j, b) in num2.reversed().enumerated() {
                let p = a.hexDigitValue! * b.hexDigitValue!
                prod[i + j] += p % 10     //: tricks!
                prod[i + j + 1] += p / 10
            }
        }
        for i in prod.indices.dropLast() {
            prod[i + 1] += prod[i] / 10
            prod[i] %= 10
        }
        return prod.reversed().drop(while: {$0 == 0}).map(String.init).joined()
    }
}


let m = Solution().multiply

m("123", "456")
m("999", "999")
m("114514", "0")
