let tags: [Tag] = [.array, .sort]

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let N = citations.count
        var bucket = [Int](repeating: 0, count: N + 1)
        citations.forEach { bucket[min(N, $0)] += 1 }

        var cum = 0
        for i in bucket.indices.reversed() {
            cum += bucket[i]
            if cum >= i { return i }
        }
        return 0
    }
}

let f = Solution().hIndex

f([3, 0, 6, 1, 5])
f([0, 0, 0])
f([10, 10])
