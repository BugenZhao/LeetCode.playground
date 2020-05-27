let tags: [Tag] = [.array]

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var count = [Int: [Int]]()
        count[0] = [-1]
        var accu = 0
        for (index, num) in nums.enumerated() {
            accu += num == 1 ? 1 : -1
            count[accu, default: []].append(index)
        }
        return count.values.map { $0.last! - $0.first! }.max() ?? 0
    }
}
