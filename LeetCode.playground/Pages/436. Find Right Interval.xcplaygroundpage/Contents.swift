let tags: [Tag] = [.hash, .binSearch]

class Solution {
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        var indexOf = [Int: Int]()
        for (i, interval) in intervals.enumerated() {
            indexOf[interval[0]] = i
        }
        let starts = intervals.map { $0[0] }.sorted()
        return intervals.map { $0[1] }.map { end -> Int in
            let right = starts.binarySearch { $0 < end }
            if right == starts.endIndex { return -1 }
            else { return indexOf[starts[right]]! }
        }

    }
}


let f = Solution().findRightInterval

f([[1, 2]])
f([[3, 4], [2, 3], [1, 2]])
f([[1, 4], [2, 3], [3, 4]])
