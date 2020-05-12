let tags: [Tag] = [.math]

//: TODO: Solution in `O(nlogn)`

class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        let N = rating.count
        guard N >= 3 else { return 0 }

        var count = 0
        for v in 1...N - 2 {
            var left: (l: Int, g: Int) = (0, 0)
            var right: (l: Int, g: Int) = (0, 0)

            for u in 0...v - 1 {
                if rating[u] < rating[v] { left.l += 1 }
                else { left.g += 1 }
            }
            for w in v + 1...N - 1 {
                if rating[w] < rating[v] { right.l += 1 }
                else { right.g += 1 }
            }
            count += left.l * right.g + left.g * right.l
        }

        return count
    }
}

let f = Solution().numTeams

f([2, 5, 3, 4, 1])
f([2, 1, 3])
f([1, 2, 3, 4])
