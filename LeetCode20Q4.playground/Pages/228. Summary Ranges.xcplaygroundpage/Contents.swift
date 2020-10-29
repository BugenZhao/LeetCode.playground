class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        typealias MyRange = (start: Int, end: Int)
        var groups = [MyRange]()
        var g = MyRange(0, 0)
        var first = true
        for num in nums {
            if first {
                g.start = num
                g.end = num
                first = false
            } else if num == g.end + 1 {
                g.end = num
            } else {
                groups.append(g)
                g.start = num
                g.end = num
            }
        }
        if !first { groups.append(g) }

        return groups.map { g in
            if g.start == g.end { return "\(g.start)" }
            else { return "\(g.start)->\(g.end)" }
        }
    }
}
