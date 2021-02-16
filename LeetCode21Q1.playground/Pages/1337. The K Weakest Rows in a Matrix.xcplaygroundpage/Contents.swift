let tags: [Tag] = [.hash]

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let (m, n) = (mat.count, mat[0].count)
        var ans = [Int]()
        var alive = Set<Int>(0..<m)

        for c in 0..<n {
            for r in 0..<m where alive.contains(r) {
                if mat[r][c] == 0 {
                    ans.append(r)
                    alive.remove(r)
                    if ans.count == k { return ans }
                }
            }
        }

        let rem = alive.sorted()
        return ans + rem[..<(k - ans.count)]
    }
}


Solution().kWeakestRows([[1, 0], [1, 0], [1, 0], [1, 1]] , 4)
