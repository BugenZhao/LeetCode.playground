class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.isEmpty { return [] }
        return arr.reversed().reduce(into: []) { acc, n in acc.append(max(acc.last ?? Int.min, n)) }.dropLast().reversed() + [-1]
    }
}

Solution().replaceElements([17, 18, 5, 4, 6, 1])
