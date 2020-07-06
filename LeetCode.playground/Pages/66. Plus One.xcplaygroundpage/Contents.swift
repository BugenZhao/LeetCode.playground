class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in digits.indices.reversed() {
            if digits[i] != 9 { digits[i] += 1; return digits }
            else { digits[i] = 0 }
        }
        digits.insert(1, at: 0)
        return digits
    }
}

let f = Solution().plusOne

f([1, 2, 3])
f([1, 2, 9])
f([1, 9, 9])
f([9, 9, 9])
