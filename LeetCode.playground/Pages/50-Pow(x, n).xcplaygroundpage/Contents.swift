//: Fast Power
let tags: [Tag] = [.math]

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        switch n {
        case ..<0:
            return 1.0 / myPow(x, -n)
        case 0:
            return 1.0
        case 1:
            return x
        default:
            let p = myPow(x, n / 2)
            if n.isMultiple(of: 2) { return p * p }
            else { return p * p * x }
        }
    }
}

let f = Solution().myPow

f(2.0, 10)
f(2.1, 3)
f(2.0, -2)
