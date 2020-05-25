let tags: [Tag] = [.twoPtrs, .greedy]

class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var i = 0; var j = 0;
        var intersections = [[Int]]()

        while i < A.count, j < B.count {
            let end = min(A[i][1], B[j][1])
            let start = max(A[i][0], B[j][0])
            if start <= end { intersections.append([start, end]) }

            //: remove the one with smaller end point
            if end == A[i][1] { i += 1 }
            else { j += 1 }
        }

        return intersections
    }
}

Solution().intervalIntersection(
    [[0, 2], [5, 10], [13, 23], [24, 25]],
    [[1, 5], [8, 12], [15, 24], [25, 26]]
)
