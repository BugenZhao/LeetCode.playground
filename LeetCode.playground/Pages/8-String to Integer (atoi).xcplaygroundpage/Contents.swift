import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        var str = str.trimmingCharacters(in: .whitespaces)
        guard !str.isEmpty else { return 0 }
        var num: Int64 = 0
        var neg = false

        if str.first! == "-" { neg = true; str = String(str.dropFirst()) }
        else if str.first! == "+" { neg = false; str = String(str.dropFirst()) }

        for char in str {
            if char.isNumber {
                num = num * 10 + Int64(char.wholeNumberValue!)
                if num > Int32.max {
                    num = Int64(Int32.max)
                    if neg { num += 1 }
                    break
                }
            } else { break }
        }

        return neg ? -Int(num) : Int(num)
    }
}

let f = Solution().myAtoi

f("42")
f("")
f("4193 with words")
f("   -42")
f("-91283472332")
f("words and 987")
f("2147483648")
