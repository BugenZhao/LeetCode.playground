let tags: [Tag] = [.bit]

class Solution {
    static let masks = (1..<32).reduce(into: [1]) { arr, _ in arr.append(arr.last! << 1) }

    func totalHammingDistance(_ nums: [Int]) -> Int {
        var answer = 0
        for mask in Self.masks {
            let zeroCount = nums.filter { $0 & mask == 0 }.count
            answer += zeroCount * (nums.count - zeroCount)
        }
        return answer
    }
}

Solution().totalHammingDistance([4, 14, 2])
