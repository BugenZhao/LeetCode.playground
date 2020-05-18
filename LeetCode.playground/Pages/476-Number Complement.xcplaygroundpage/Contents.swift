let tags: [Tag] = [.math]

class Solution {
    func findComplement(_ num: Int) -> Int {
        let N = UInt(bitPattern: num)
        var mask: UInt = 1
        while (N > mask) { mask = (mask << 1) + 1 }
        return Int(bitPattern: N ^ mask)
    }
}
