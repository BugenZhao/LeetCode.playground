let tags: [Tag] = [.sort]

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        let intervals = intervals.sorted{ $0[0] < $1[0] }
        for this in intervals {
            if let last = ans.last, last[1] >= this[0] {
                ans.removeLast()
                ans.append([last[0], max(last[1], this[1])])
            } else {
                ans.append(this)
            }
        }
        return ans
    }
}


let f = Solution().merge

f([[1,3],[2,6],[8,10],[15,18]])
f([[1,4],[4,5]])
