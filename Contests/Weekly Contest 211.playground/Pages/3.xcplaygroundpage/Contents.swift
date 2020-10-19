class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let zipped = zip(scores, ages).sorted(by: { lhs, rhs in lhs.1 == rhs.1 ? lhs.0 < rhs.0: lhs.1 < rhs.1 })
        let scores = zipped.map { $0.0 }
        
        var dp = [Int](repeating: 0, count: scores.count)
        for i in scores.indices {
            dp[i] = scores[i]
            for j in 0..<i where scores[j] <= scores[i]{
                dp[i] = max(dp[i], dp[j] + scores[i])
            }
        }
        
        return dp.max() ?? 0
    }
}


Solution().bestTeamScore([988, 511, 618, 880, 214, 589, 576, 744, 865, 830, 478],
    [89, 57, 20, 93, 20, 100, 8, 18, 62, 47, 45])


class SolutionFuckingTLE {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let zipped = zip(scores, ages).sorted(by: { lhs, rhs in lhs.1 == rhs.1 ? lhs.0 < rhs.0: lhs.1 < rhs.1 })
        let scores = zipped.map { $0.0 }
        let ages = zipped.map { $0.1 }

        print(scores, ages)

        var memo = [[Int: Int]](repeating: .init(), count: scores.count)

        func worker(_ begin: Int, _ thresh: Int) -> Int {
            if begin == scores.endIndex { return 0 }
            if let m = memo[begin][thresh] { return m }

            let sc = scores[begin]
            let age = ages[begin]
            var last = begin + 1
            
            while last < scores.endIndex && scores[last] == sc && ages[last] == age {
                last += 1
            }
            let sameLast = last
            while last < scores.endIndex && scores[last] < max(thresh, sc) {
                last += 1
            }

            let a = (sc >= thresh ? sc * (sameLast - begin) : 0) + worker(last, max(thresh, sc))
            let b = worker(sameLast, thresh)
            let ans = max(a, b)

            memo[begin][thresh] = ans
            return ans
        }
        let ans = worker(0, 0)
        return ans
    }
}
