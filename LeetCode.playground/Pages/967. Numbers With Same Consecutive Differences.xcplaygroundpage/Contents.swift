let tags: [Tag] = [.dfs]

class Solution {
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        if N == 1 { return (0...9).map { $0 } }
        var ans = [Int]()
        func worker(_ num: Int, _ count: Int) {
            if count == N { ans.append(num); return }
            let t = num % 10
            if t - K >= 0 { worker(num * 10 + t - K, count + 1) }
            if K != 0, t + K <= 9 { worker(num * 10 + t + K, count + 1) }
        }
        (1...9).forEach { worker($0, 1) }
        return ans
    }
}


let f = Solution().numsSameConsecDiff

f(3, 7)
f(1, 0)
f(2, 0)
