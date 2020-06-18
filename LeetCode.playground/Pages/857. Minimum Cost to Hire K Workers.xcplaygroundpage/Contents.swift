let tags: [Tag] = [.marked, .heap, .greedy]

class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ K: Int) -> Double {
        let N = quality.count
        let ratio = (0..<N).map { Double(wage[$0]) / Double(quality[$0]) } //: lower is better
        let rank = (0..<N).sorted(by: { ratio[$0] < ratio[$1] }) //: sort the workers by their ratios
        var pq = PriorityQueue<Int>(by: { quality[$0] > quality[$1] }) //: pq by quality
        //: note that a worker with low ratio but high quality is not always the best, since the ratio is up to the worker with the lowest one, not him
        //: so we may evict the top if needed.

        var minCost = Double.infinity
        var curQ = 0
        for i in rank { //: low ratio first
            curQ += quality[i]
            pq.enqueue(i)
            if pq.count == K + 1 { curQ -= quality[pq.dequeue()!] } //: evict the most expensive one
            if pq.count == K { minCost = min(minCost, Double(curQ) * ratio[i]) } //: update the cost
        }

        return minCost
    }
}

let f = Solution().mincostToHireWorkers

f([10, 20, 5], [70, 50, 30], 2)
