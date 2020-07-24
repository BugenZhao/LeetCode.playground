let tags: [Tag] = [.greedy, .ON]

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        if ratings.isEmpty { return 0 }
        var candies = ratings.map { _ in 1 }
        //: fulfill the requirement on the left neighbors
        for i in 1..<ratings.count where ratings[i - 1] < ratings[i] {
            candies[i] = candies[i - 1] + 1
        }
        //: fulfill the requirement on the right neighbors
        for i in (0..<ratings.count - 1).reversed() where ratings[i + 1] < ratings[i] {
            candies[i] = max(candies[i], candies[i + 1] + 1)
        }
        //: the answer is the best since we've reached all "="s
        return candies.reduce(0, +)
    }
}

let f = Solution().candy

f([1, 0, 2])
f([1, 2, 2])
f([1, 2, 3, 2, 1]) // [1, 2, 3, 2, 1]
f([1])
