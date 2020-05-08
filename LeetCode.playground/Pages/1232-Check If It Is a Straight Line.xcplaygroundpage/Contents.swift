class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        guard coordinates.count >= 3 else { return true }
        let getK = { (i: Int) -> Double in
            return Double(coordinates[i][1] - coordinates[0][1]) / Double(coordinates[i][0] - coordinates[0][0])
        }
        let k = getK(1)
        return (1..<coordinates.count).allSatisfy { getK($0) == k }
    }
}

Solution().checkStraightLine([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]])
Solution().checkStraightLine([[1, 1], [2, 2], [3, 4], [4, 5], [5, 6], [7, 7]])
Solution().checkStraightLine([[0, 0], [1, 888]])
