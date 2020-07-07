let tags: [Tag] = [.bit]

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        return num > 0 && num & (num - 1) == 0 && num & 0x55555555_55555555 != 0
    }
}

let f = Solution().isPowerOfFour
f(1 << 0)
f(1 << 1)
f(1 << 4)
f(1 << 62)
