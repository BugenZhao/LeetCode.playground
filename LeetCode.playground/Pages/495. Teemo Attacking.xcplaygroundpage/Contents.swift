let tags: [Tag] = [.ON]

class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        let intervals = timeSeries.map { s in (s, s + duration - 1) }
        var compact = [(Int, Int)]()
        for this in intervals {
            if let last = compact.last, last.1 >= this.0 {
                compact.removeLast()
                compact.append((last.0, this.1))
            } else {
                compact.append(this)
            }
        }
        return compact.map { $1 - $0 + 1 }.reduce(0, +)
    }
}


let f = Solution().findPoisonedDuration

f([1, 4], 2) == 4
f([1, 2], 2) == 3
f([1, 2, 3, 4, 5, 6], 10)
