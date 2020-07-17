class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        var pq = PriorityQueue<Int> { lhs, rhs in count[lhs]! < count[rhs]! }
        nums.forEach { num in count[num, default: 0] += 1 }
        count.keys.forEach { num in
            pq.enqueue(num)
            if pq.count > k { pq.dequeue() }
        }
        return (0..<k).map { _ in pq.dequeue()! }
    }
}

Solution().topKFrequent([1, 1, 1, 2, 2, 3], 2)
