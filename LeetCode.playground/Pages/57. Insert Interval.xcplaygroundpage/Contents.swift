let tags: [Tag] = [.sort]

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var left = [[Int]](); var right = left
        var (start, end) = (newInterval[0], newInterval[1])
        for int in intervals {
            if int[1] < start { left.append(int) }
            else if int[0] > end { right.append(int) }
            else {
                start = min(start, int[0])
                end = max(end, int[1])
            }
        }
        return left + [[start, end]] + right
    }
}


let f = Solution().insert

f([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
