let tags: [Tag] = [.bit, .math]

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        func worker(_ a: Int, _ b: Int) -> Int {
            if a < b { return 0 }
            let or = (0...).first { a < b << $0 }! - 1
            return (1 << or) + worker(a - (b << or), b)
        }
        var quotient = worker(abs(dividend), abs(divisor))
        if dividend.signum() != divisor.signum() { quotient.negate() }
        return quotient > Int32.max || quotient < Int32.min ? Int(Int32.max) : quotient
    }
}


let div = Solution().divide

div(-2147483648, -1)
div(2147483648, -1)


(-30...30).flatMap { a in
    (-30...30).map { b in (a, b) }
}.allSatisfy {
    $1 == 0 ? true : div($0, $1) == $0 / $1
}

