let tags: [Tag] = [.binSearch]

class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        let poses = mat
            .map { row in row.binarySearch(predicate: { $0 == 1 }) }
        let sorted = poses.enumerated()
            .sorted { l, r in l.1 == r.1 ? l.0 < r.0: l.1 < r.1 }
            .map(\.offset)
        return Array(sorted.prefix(k))
    }
}


Solution().kWeakestRows([[1, 0], [1, 0], [1, 0], [1, 1]], 4)
