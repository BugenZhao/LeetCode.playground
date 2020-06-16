let tags: [Tag] = [.array]

class Solution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var changes = [Int](repeating: 0, count: 1001)
        var last = 0

        for trip in trips {
            changes[trip[1]] += trip[0]
            changes[trip[2]] -= trip[0]
            last = max(last, trip[2])
        }

        var cum = 0
        for i in 0...last {
            cum += changes[i]
            if cum > capacity { return false }
        }
        return true
    }
}
