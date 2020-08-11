let tags: [Tag] = [.binSearch]

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        func bad(_ max: Int) -> Bool {
            var sum = 0
            var count = 0
            for num in nums {
                guard num <= max else { return true }
                if sum + num <= max { sum += num }
                else { sum = num; count += 1 }
            }
            return count + sum.signum() > m
        }

        let sum = nums.reduce(0, +)
        let range = sum / m...sum
        return range[range.binarySearch(predicate: bad)]
    }
}

let f = Solution().splitArray

f([7, 2, 5, 10, 8], 2)
f([1, 10000, 1, 10000], 2)
f([2, 3, 1, 1, 1, 1, 1], 5)
