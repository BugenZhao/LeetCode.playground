let tags: [Tag] = [.greedy]

class Solution {
    func largestValsFromLabels(_ values: [Int], _ labels: [Int], _ numWanted: Int, _ useLimit: Int) -> Int {
        var labelCount = [Int: Int]()
        labels.forEach { labelCount[$0] = 0 }
        let indices = values.indices.sorted(by: { values[$0] > values[$1] })

        var count = 0
        var total = 0
        for index in indices {
            if count == numWanted { break }
            if labelCount[labels[index]]! < useLimit {
                total += values[index]
                count += 1
                labelCount[labels[index]]! += 1
            }
        }
        return total
    }
}

Solution().largestValsFromLabels([5, 4, 3, 2, 1], [1, 3, 3, 3, 2], 3, 2)
