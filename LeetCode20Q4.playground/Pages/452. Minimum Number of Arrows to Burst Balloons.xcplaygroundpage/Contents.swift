let tags: [Tag] = [.greedy, .sort]

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted(by: { lhs, rhs in
            lhs[1] == rhs[1] ? lhs[0] > rhs[0]: lhs[1] < rhs[1] }) //: sort by `end`, then `start` descendingly
        
        var count = 0
        var arrow = Int.min
        for point in points {
            if !(point[0]...point[1] ~= arrow) {
                arrow = point[1] //: use `end` of the balloon
                count += 1
            }
        }
        return count
    }
}
