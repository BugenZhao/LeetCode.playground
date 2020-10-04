import Foundation

class Solution {
    func visiblePoints(_ points: [[Int]], _ angle: Int, _ location: [Int]) -> Int {
        let angle = Double(angle) * Double.pi / 180
        var angles = points.filter { $0 != location }.map { p in
            atan2(Double(p[0] - location[0]), Double(p[1] - location[1]))
        }
        angles.sort()
        angles += angles.map { $0 + 2 * Double.pi }

        var ans = 0
        var j = 0
        for i in angles.indices {
            while j < angles.count, angles[j] <= angles[i] + angle { j += 1 }
            ans = max(ans, j - i)
        }
        ans += points.filter { $0 == location }.count
        return ans
    }
}
