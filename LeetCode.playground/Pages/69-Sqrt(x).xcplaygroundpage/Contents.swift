//: Newton's Method: AM-GM inequality
let tags: [Tag] = [.math]

class Solution {
    func mySqrt(_ x: Int) -> Int {
        var r = x
        while r * r > x { r = (r + x / r) / 2 }
        return r
    }
}

let f = Solution().mySqrt

(0...10000).allSatisfy { x in
    f(x) == Int(Double(x).squareRoot())
}
