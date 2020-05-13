/*:
 Monotonic stack
 
 ![Figure](402.png width="400")
 */
let tags: [Tag] = [.math, .stack, .greedy]

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k == num.count { return "0" }
        var result = ""
        var remaining = k
        num.forEach { char in
            while !result.isEmpty, result.last! > char, remaining > 0 {
                //: always remove the *peak* of stack
                result.popLast()
                remaining -= 1
            }
            result.append(char)
        }

        //: `remaining != 0` => last elements are monotonically increasing
        for _ in 0..<remaining { result.popLast() }

        //: trim the leading 0's
        if let index = result.firstIndex(where: { $0 != "0" }) {
            return String(result[index...])
        } else {
            return "0"
        }
    }
}


let f = Solution().removeKdigits

f("1432219", 3)
f("123", 3)
f("987654321", 5)
f("123", 1)
f("2000", 2)
f("10300", 1)
f("1234212345", 5)
