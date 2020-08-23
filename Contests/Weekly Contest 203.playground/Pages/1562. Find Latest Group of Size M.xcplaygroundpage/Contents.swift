class Solution {
    func findLatestStep(_ arr: [Int], _ m: Int) -> Int {
        var uf = QuickUnionFind(arr.count)
        var str = arr.map { _ in false }
        var latest = -1
        var groups = Set<Int>()
        for (step, i) in arr.map({ $0 - 1 }).enumerated() {
            str[i] = true
            if str.indices ~= i - 1, str[i - 1] {
                groups.remove(uf.set(by: i - 1))
                uf.union(i - 1, i)
            }
            if str.indices ~= i + 1, str[i + 1] {
                groups.remove(uf.set(by: i + 1))
                uf.union(i + 1, i)
            }
            let set = uf.set(by: i)
            if uf.sizeOf[set] == m {
                groups.insert(set)
            }
            if !groups.isEmpty { latest = step + 1 }
        }
        return latest
    }
}


let f = Solution().findLatestStep

f([3, 5, 1, 2, 4], 1)
f([3, 1, 5, 4, 2], 2)
f([1], 1)
f([2, 1], 2)
