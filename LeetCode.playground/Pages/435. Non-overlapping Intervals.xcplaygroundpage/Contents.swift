let tags: [Tag] = [.greedy, .marked]

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        //: interval scheduling problem => find a set of non-overlapping intervals of maximum size
        let intervals = intervals.sorted(by: { $0[1] < $1[1] }) //: sort by finish time
        var end = Int.min
        var count = 0
        for int in intervals where int[0] >= end {
            count += 1
            end = int[1]
        }
        return intervals.count - count
    }
}

let f = Solution().eraseOverlapIntervals

f([[1, 2], [2, 3], [3, 4], [1, 3]])
f([[1, 2], [1, 2], [1, 2]])
f([[1, 2], [2, 3]])
