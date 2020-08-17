class Solution {
    func distributeCandies(_ candies: Int, _ numPeople: Int) -> [Int] {
        var ans = (0..<numPeople).map { _ in 0 }
        var rem = candies
        for i in 0... {
            guard rem > 0 else { break }
            ans[i % numPeople] += min(i + 1, rem)
            rem -= i + 1
        }
        return ans
    }
}
