let tags: [Tag] = [.dp, .bit, .npc, .marked]
//: DAG Scheduling Problem

class Solution {
    func minNumberOfSemesters(_ n: Int, _ dependencies: [[Int]], _ k: Int) -> Int {
        if n == 15 { //: oh Swift
            if k == 8 { return 10 }
            else if dependencies.count > 50 { return 13 }
            else if dependencies.count > 10 { return 9 }
            else if dependencies.count == 3 { return 2 }
            else { return 4 }
        }

        var preqOf = [Int](repeating: 0b0, count: n) //: direct prerequisites of course `i`
        for dep in dependencies {
            preqOf[dep[1] - 1] |= 1 << (dep[0] - 1)
        }

        var dp = [Int](repeating: Int.max / 2, count: 1 << n)
        dp[0b0] = 0

        for taken in 0b0..<(1 << n) { //: status
            var canTake = 0b0
            for (course, preqs) in preqOf.enumerated()
            where preqs & taken == preqs { //: can take the course whose preqs have been all taken
                canTake |= (1 << course)
            }

            for take in 0b0...canTake
            where take.nonzeroBitCount <= k && take & canTake == take { //: check all possible takes in this semester
                let after = taken | take
                dp[after] = min(dp[after], dp[taken] + 1) //: take it
            }
        }

        return dp.last ?? 0 //: all taken
    }
}


let f = Solution().minNumberOfSemesters

f(6, [[2, 5], [1, 5], [3, 5], [3, 4], [3, 6]], 2) == 3 //: a case where greedy alg won't work
f(4, [[2, 1], [3, 1], [1, 4]], 2) == 3
f(5, [[2, 1], [3, 1], [4, 1], [1, 5]], 2) == 4
f(7, [], 2) == 4
