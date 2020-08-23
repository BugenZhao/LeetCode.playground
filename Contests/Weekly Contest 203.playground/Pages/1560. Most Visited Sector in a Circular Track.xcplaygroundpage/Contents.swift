class Solution {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        var times = [Int](repeating: 0, count: n)
        let rounds = rounds.map { $0 - 1 }
        var curr = rounds.first!
        times[curr] = 1
        for end in rounds.dropFirst() {
            while curr != end % n {
                curr = curr + 1
                if curr == n { curr = 0 }
                times[curr] += 1
            }
        }
        let max = times.max()!
        return (1...n).filter { times[$0 - 1] == max }
    }
}


let f = Solution().mostVisited

f(4, [1, 3, 1, 2])
f(2, [2, 1, 2, 1, 2, 1, 2, 1, 2])
f(7, [1, 3, 5, 7])
