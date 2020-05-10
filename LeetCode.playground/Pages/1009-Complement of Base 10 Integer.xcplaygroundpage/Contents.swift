import Foundation

let tags: [Tag] = [.math]

class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        let N = UInt(bitPattern: N)
        var mask: UInt = 1
        while (N > mask) { mask = (mask << 1) + 1 }
        return Int(bitPattern: N ^ mask)
    }
}

let f = Solution().bitwiseComplement

f(0)
f(0b101)
f(0b111)
f(0b1010)
f(0xffffffff)
