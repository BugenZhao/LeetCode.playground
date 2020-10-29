let tags: [Tag] = [.ON]

class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        let onePoses = seats.indices.filter { seats[$0] == 1 }
        return max(zip(onePoses, onePoses.dropFirst()).map { ($1 - $0) / 2 }.max() ?? 0,
                   onePoses.first! - 0,
                   seats.count - onePoses.last! - 1)
    }
}
