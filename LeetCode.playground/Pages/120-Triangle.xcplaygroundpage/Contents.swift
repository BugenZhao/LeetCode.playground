/** Dynamic Programming **/

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard !triangle.isEmpty else { return 0 }

        let N = triangle.count
        var distances = [Int](repeating: 0, count: N)
        distances[0] = triangle[0][0]

        for level in 1..<N {
            for i in (0...level).reversed() {  //: `reversed()` to achieve `O(n)` space
                if i == level { distances[i] = triangle[level][i] + distances[i - 1] }
                else if i == 0 { distances[i] = triangle[level][i] + distances[i] }
                else { distances[i] = triangle[level][i] + min(distances[i], distances[i - 1]) }
            }
        }

        return distances.min()!
    }
}

let f = Solution().minimumTotal

f([
    [2],
    [3, 4],
    [6, 5, 7],
    [4, 1, 8, 3]
    ])
