let tags: [Tag] = [.array]

class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max()!
        return candies.map { $0 + extraCandies >= max }
    }
}
