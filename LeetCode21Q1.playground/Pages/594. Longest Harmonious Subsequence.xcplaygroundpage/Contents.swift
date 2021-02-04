let tags: [Tag] = [.hash]

class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var counter = [Int: Int]()
        for num in nums { counter[num, default: 0] += 1 }
        return counter.map { (k, v) in
            if let nextV = counter[k + 1] { return v + nextV }
            else { return 0 } }.max()!
    }
}


Solution().findLHS([1, 1, 1, 1]) == 0
Solution().findLHS([1, 3, 2, 2, 5, 2, 3, 7]) == 5
