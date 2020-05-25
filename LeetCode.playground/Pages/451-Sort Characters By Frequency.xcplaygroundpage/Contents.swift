let tags: [Tag] = [.hash, .string]

class Solution {
    func frequencySort(_ s: String) -> String {
        return s
            .reduce(into: [:], { $0[$1, default: 0] += 1 })
            .sorted(by: { $0.value > $1.value })
            .reduce(into: "", { $0 += String(repeating: $1.key, count: $1.value) })
    }
}

Solution().frequencySort("tree")
