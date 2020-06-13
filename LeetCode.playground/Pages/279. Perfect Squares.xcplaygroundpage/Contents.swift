/*:
 - Lagrange's four-square theorem
 - Legendre: `n != 4^k*(8m+7) <=> n = 3-sum`
 */
let tags: [Tag] = [.math]

class Solution {
    func numSquares(_ n: Int) -> Int {
        var n = n

        while n.isMultiple(of: 4) { n /= 4 }
        if n % 8 == 7 { return 4 }

        let sqrt = Int(Double(n).squareRoot())
        if n == sqrt * sqrt { return 1 }

        var a = 1, b = sqrt
        while a <= b {
            switch a * a + b * b {
            case ..<n:
                a += 1
            case (n + 1)...:
                b -= 1
            default:
                return 2
            }
        }

        return 3
    }
}

let f = Solution().numSquares
f(12)
f(13)
f(14)
f(7)
