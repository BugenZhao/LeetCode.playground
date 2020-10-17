import Foundation

class Solution {
    func bestCoordinate(_ towers: [[Int]], _ radius: Int) -> [Int] {
        var (oi, oj) = (0, 0)
        var maxSum = Int.min
        
        for i in 0...50 {
            for j in 0...50 {
                var sum = 0
                for tower in towers {
                    let dist2 = (tower[0] - i) * (tower[0] - i) + (tower[1] - j) * (tower[1] - j)
                    if dist2 > radius * radius { continue }
                    let q = Int(Double(tower[2]) / (1.0 + sqrt(Double(dist2))))
                    sum += q
                }
                if sum > maxSum {
                    maxSum = sum
                    (oi, oj) = (i, j)
                }
            }
        }
        
        return [oi, oj]
    }
}
