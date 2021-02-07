let tags: [Tag] = [.greedy, .ON]

class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let g = g.sorted()
        let s = s.sorted()

        var j = 0
        for (i, greed) in g.enumerated() {
            while j < s.endIndex && s[j] < greed { j += 1 }
            if j >= s.endIndex { return i } else { j += 1 }
        }

        return g.count
    }
}


let f = Solution().findContentChildren

f([1, 2, 3], [1, 1])
f([1, 2], [1, 2, 3])
