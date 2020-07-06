let tags: [Tag] = [.bit]

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        return m == n ? m : (rangeBitwiseAnd(m >> 1, n >> 1) << 1)
    }
}

class SolutionNaive {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        return (m...n).reduce(Int.min, &)
    }
}

let f = Solution().rangeBitwiseAnd
let g = SolutionNaive().rangeBitwiseAnd
