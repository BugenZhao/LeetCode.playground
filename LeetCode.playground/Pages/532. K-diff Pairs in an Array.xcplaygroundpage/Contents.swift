let tags: [Tag] = [.hash]

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var counter = [Int: Int]()
        for num in nums { counter[num, default: 0] += 1 }
        return (k == 0 ? counter.values.map { $0 >= 2 ? 1 : 0 }: counter.keys.map { counter[$0 + k] != nil ? 1 : 0 }).reduce(0, +)
    }
}
