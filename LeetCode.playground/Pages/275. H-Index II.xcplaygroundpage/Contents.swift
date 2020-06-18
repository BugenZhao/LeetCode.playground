let tags: [Tag] = [.binSearch, .array]

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var lo = citations.startIndex
        var hi = citations.endIndex
        while lo != hi {
            let mid = lo + (hi - lo) / 2
            if citations[mid] >= citations.endIndex - mid {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return citations.endIndex - lo
    }
}

let f = Solution().hIndex

f([0, 1, 4, 5, 6])
