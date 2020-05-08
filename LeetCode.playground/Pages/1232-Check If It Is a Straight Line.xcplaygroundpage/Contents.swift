class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count >= 3 else { return true }

        let x0 = coordinates[0][0]
        let y0 = coordinates[0][1]
        let x1 = coordinates[1][0]
        let y1 = coordinates[1][1]
        let vec = SIMD3<Int>( //: `Ax+By+C = 0`
            y1 - y0,
            x0 - x1,
            x1 * y0 - x0 * y1
        )

        return coordinates.allSatisfy {
            let point = SIMD3<Int>($0[0], $0[1], 1)
            let product = vec &* point
            return product.x + product.y + product.z == 0 //: No efficient `sum` of `SIMD<Int>`
        }
    }
}

Solution().checkStraightLine([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]])
Solution().checkStraightLine([[1, 1], [2, 2], [3, 4], [4, 5], [5, 6], [7, 7]])
Solution().checkStraightLine([[0, 0], [1, 888]])

