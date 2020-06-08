import Foundation
let tags: [Tag] = [.math]

class Solution {
    let base = 1337

    func pow(_ x: Int, _ n: Int) -> Int {
        switch n {
        case 0:
            return 1
        case 1:
            return x % base
        default:
            let p = pow(x, n / 2) % base
            if n.isMultiple(of: 2) { return p * p % base }
            else { return p * p * x % base }
        }
    }

    func superPow(_ a: Int, _ b: [Int]) -> Int {
        let a = a % base

        switch a {
        case 0:
            return 0
        case 1:
            return 1
        default:
            return b.reduce(1) { result, num in
                pow(result, 10) * pow(a, num) % base
            }
        }
    }
}

Solution().superPow(2, [2, 0]) == (1 << 20) % 1337
