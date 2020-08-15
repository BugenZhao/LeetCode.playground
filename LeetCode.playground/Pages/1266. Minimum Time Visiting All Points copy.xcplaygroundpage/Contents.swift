class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var ans = 0
        for (a, b) in zip(points, points.dropFirst()) {
            ans += max(abs(b[0] - a[0]), abs(b[1] - a[1]))
        }
        return ans
    }
}

Solution().minTimeToVisitAllPoints([[1, 1], [3, 4], [-1, 0]])
