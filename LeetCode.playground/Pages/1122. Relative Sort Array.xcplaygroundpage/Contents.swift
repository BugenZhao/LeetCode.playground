let tags: [Tag] = [.hash, .sort]

class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var order = [Int: Int]()
        for (i, num) in arr2.enumerated() { order[num] = i }
        return arr1.sorted(by: { lhs, rhs in
            let lo = order[lhs, default: Int.max]
            let ro = order[rhs, default: Int.max]
            return lo == ro ? lhs < rhs: lo < ro
        })
    }
}


let f = Solution().relativeSortArray

f([2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19], [2, 1, 4, 3, 9, 6])
