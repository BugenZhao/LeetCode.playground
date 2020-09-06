let tags: [Tag] = [.hash]

class Solution {
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        var onesA = [(Int, Int)](); var onesB = onesA
        for i in A.indices {
            for j in A[i].indices {
                if A[i][j] == 1 { onesA.append((i, j)) }
                if B[i][j] == 1 { onesB.append((i, j)) }
            }
        }

        var overlap = [Int: Int]()
        for src in onesA {
            for dst in onesB {
                let dx = dst.0 - src.0 + 35
                let dy = dst.1 - src.1 + 35
                let sliding = dx * 70 + dy
                overlap[sliding, default: 0] += 1
            }
        }

        return overlap.values.max() ?? 0
    }
}


let A = [
    [1, 1, 0],
    [0, 1, 0],
    [0, 1, 0]
]
let B = [
    [0, 0, 0],
    [0, 1, 1],
    [0, 0, 1]
]
Solution().largestOverlap(A, B)
