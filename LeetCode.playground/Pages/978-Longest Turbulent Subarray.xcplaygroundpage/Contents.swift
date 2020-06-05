let tags: [Tag] = [.dp, .sliding]

infix operator ~~: ComparisonPrecedence
@inline(__always) func ~~<T>(_ lhs: T, _ rhs: T) -> Bool where T: SignedInteger {
    return (lhs < 0 && rhs > 0) || (lhs > 0 && rhs < 0)
}

class Solution {
    func maxTurbulenceSize(_ A: [Int]) -> Int {
        guard A.count >= 2 else { return 1 }
        var maxLength = 1
        var length = 1
        var start = A.startIndex

        for end in 1..<A.count {
            if end - 1 == start {
                if A[end] != A[start] { length += 1 }
                else { start = end; length = 1 }
            } else if (A[end] - A[end - 1]) ~~ (A[end - 1] - A[end - 2]) {
                length += 1
            } else {
                start = end - 1; length = 2
            }
            maxLength = max(length, maxLength)
        }

        return maxLength
    }
}


let f = Solution().maxTurbulenceSize

f([9, 4, 2, 10, 7, 8, 8, 1, 9])
f([4, 8, 12, 16])
f([3, 1, 3, 1, 3, 3, 1, 3])
