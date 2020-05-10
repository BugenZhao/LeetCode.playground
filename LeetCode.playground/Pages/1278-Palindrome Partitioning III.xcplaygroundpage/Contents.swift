/*: DP with memoization
 
  Future work:
   - Memoize `cost`
   - Pair as key -> avoid initialization overhead of `memo`
 */

let tags: [Tag] = [.dp]

class SolutionPreCost {
    func palindromePartition(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty else { return 0 }
        let chars = Array(s)
        let N = chars.count

        //: Compute the cost to make `s[from...to]` be a palindrome
        var cost = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        for center in 0..<N {
            var currentCost = 0
            //: Odd: Is `(c-r)...(c+r)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius
                guard left >= 0 && right < N else { break }
                if chars[left] == chars[right] { cost[left][right] = currentCost }
                else { currentCost += 1; cost[left][right] = currentCost }
            }

            currentCost = 0
            //: Even: Is `(c-r)...(c+r+1)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius + 1
                guard left >= 0 && right < N else { break }
                if chars[left] == chars[right] { cost[left][right] = currentCost }
                else { currentCost += 1; cost[left][right] = currentCost }
            }
        }

        
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: k + 1), count: N + 1)
        //: The minimum cost to cut first `first` chars into `rc` palindromes
        func worker(first: Int, remainingCount rc: Int) -> Int {
            guard first != 0 else { return 0 }
            guard rc > 0 else { fatalError("Bugen cannot make bricks without straw") }
            guard memo[first][rc] == nil else { return memo[first][rc]! }

            var answer = 0
            defer { memo[first][rc] = answer }

            if rc == 1 { answer = cost[0][first - 1] } //: Only one part left
            else if rc == first { answer = 0 } //: Can split into chars
            else { //: General conditions
                answer = (0..<first).lazy.map { newFirst in
                    worker(first: newFirst, remainingCount: rc - 1) + cost[newFirst][first - 1]
                }.min()!
            }
            return answer
        }

        return worker(first: N, remainingCount: k)
    }
}

typealias Solution = SolutionPreCost

let f = Solution().palindromePartition
f("abc", 2)
f("leetcode", 8)
f("abcdc", 1)
f("abcdc", 2)
