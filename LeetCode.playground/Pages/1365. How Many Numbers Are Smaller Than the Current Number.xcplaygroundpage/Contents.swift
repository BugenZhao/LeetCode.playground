class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        let sorted = nums.sorted()
        var count = [Int: Int]()
        var i = sorted.startIndex
        while i < sorted.endIndex {
            count[sorted[i]] = i
            repeat { i += 1 } while i < sorted.endIndex && sorted[i] == sorted[i - 1]
        }
        return nums.map { count[$0]! }
    }
}

let f = Solution().smallerNumbersThanCurrent

f([8, 1, 2, 2, 3])
f([1])
f([3, 3, 3, 3, 3])
f([])
