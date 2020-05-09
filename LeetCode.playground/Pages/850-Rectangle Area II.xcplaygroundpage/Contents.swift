//: Coordinate Compression

import Foundation

class Solution {
    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        var xSet = Set<Int>()
        var ySet = Set<Int>()

        rectangles.forEach {
            xSet.insert($0[0]) ; xSet.insert($0[2])
            ySet.insert($0[1]) ; ySet.insert($0[3])
        }

        let xArr = Array(xSet).sorted()
        let yArr = Array(ySet).sorted()
        var covered = [[Bool]](repeating: [Bool](repeating: false, count: yArr.count - 1), count: xArr.count - 1)

        rectangles.forEach { rec in
            let xRange = xArr.binarySearch { $0 < rec[0] }..<xArr.binarySearch { $0 < rec[2] }
            let yRange = yArr.binarySearch { $0 < rec[1] }..<yArr.binarySearch { $0 < rec[3] }
            for i in xRange {
                for j in yRange {
                    covered[i][j] = true
                }
            }
        }

        var area = 0

        for i in 0..<xArr.count - 1 {
            for j in 0..<yArr.count - 1 {
                if covered[i][j] {
                    area += (xArr[i + 1] - xArr[i]) * (yArr[j + 1] - yArr[j])
                }
            }
        }

        return area % 1_000_000_007
    }
}


let f = Solution().rectangleArea
f([[0, 0, 2, 2], [1, 0, 2, 3], [1, 0, 3, 1]])
f([[0, 0, 1000000000, 1000000000]])
