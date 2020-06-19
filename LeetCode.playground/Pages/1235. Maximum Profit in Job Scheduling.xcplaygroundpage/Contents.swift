let tags: [Tag] = [.dp, .binSearch]

class Solution {
    struct Job {
        let startTime: Int
        let endTime: Int
        let profit: Int
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let indices = startTime.indices
        //: sort jobs by their `endTime`s
        let jobs = indices
            .map { i in Job(startTime: startTime[i], endTime: endTime[i], profit: profit[i]) }
            .sorted { $0.endTime < $1.endTime }
        //: for each job, find the last job that does not overlap it
        let previous = indices
            .map { i in indices.binarySearch(predicate: { j in jobs[j].endTime <= jobs[i].startTime }) }
        
        var dp = [Int](repeating: 0, count: indices.count + 1)
        for i in 1..<startTime.count + 1 {
            dp[i] = max(dp[i - 1], jobs[i - 1].profit + dp[previous[i - 1]]) //: take or not take
        }
        return dp.last!
    }
}

let f = Solution().jobScheduling

f([1, 2, 3, 3], [3, 4, 5, 6], [50, 10, 40, 70])
f([1, 2, 3, 4, 6], [3, 5, 10, 6, 9], [20, 20, 100, 70, 60])
f([1, 1, 1], [2, 3, 4], [5, 6, 4])
f([], [], [])
