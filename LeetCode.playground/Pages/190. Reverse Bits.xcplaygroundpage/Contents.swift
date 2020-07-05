let tags: [Tag] = [.bit, .marked]

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = UInt32(n)
        n = (n >> 16) | (n << 16)
        n = ((n & 0xff00ff00) >> 8) | ((n & 0x00ff00ff) << 8)
        n = ((n & 0xf0f0f0f0) >> 4) | ((n & 0x0f0f0f0f) << 4)
        n = ((n & 0b1100_1100_1100_1100_1100_1100_1100_1100) >> 2) | ((n & 0x33333333) << 2)
        n = ((n & 0b1010_1010_1010_1010_1010_1010_1010_1010) >> 1) | ((n & 0x55555555) << 1)
        return Int(n)
    }
}

String(Solution().reverseBits(0b00000010100101000001111010011100), radix: 2)
