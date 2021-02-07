let tags: [Tag] = [.ON]

class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let s = Array(s)

        func worker(_ idx: Int, _ offset: Int, _ memo: inout [Int: Int]) -> Int {
            if let m = memo[idx] { return m }
            if !s.indices.contains(idx) { return Int.max / 3 }
            if s[idx] == c { return 0 }

            let ans = worker(idx + offset, offset, &memo) + 1
            memo[idx] = ans
            return ans
        }

        var memoLr = [Int: Int]()
        let lr = s.indices.map { worker($0, 1, &memoLr) }
        var memoRl = [Int: Int]()
        let rl = s.indices.map { worker($0, -1, &memoRl) }

        return zip(lr, rl).map { min($0, $1) }
    }
}

Solution().shortestToChar("loveleetcode", "e") == [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
