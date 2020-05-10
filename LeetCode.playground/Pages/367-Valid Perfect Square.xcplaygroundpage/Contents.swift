import Foundation

let tags: [Tag] = [.math, .binSearch]

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num >= 0 else { return false }
        if num <= 9 { return [0, 1, 4, 9].contains(num) }

        var x = num
        while x * x > num {
            x = (x + num / x) / 2
        }
        return x * x == num
    }
}


class SolutionB {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num >= 0 else { return false }
        if num <= 9 { return [0, 1, 4, 9].contains(num) }

        var lo = 3; var hi = num
        while lo < hi {
            let mid = (hi + lo) / 2
            switch mid * mid {
            case num:
                return true
            case ...(num - 1):
                lo = mid + 1
            case (num + 1)...:
                hi = mid - 1
            default:
                fatalError()
            }
        }

        return lo * lo == num
    }
}


let f = SolutionB().isPerfectSquare


(1...10000).allSatisfy {
    let root = Double($0).squareRoot()
    return f($0) == (root == floor(root))
}
