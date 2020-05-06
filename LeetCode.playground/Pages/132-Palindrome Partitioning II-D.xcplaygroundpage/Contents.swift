//: **DIFFICULT!**    Cut string into palindromes in `O(n^2)` time and `O(n)` time
class SolutionN2 {
    func minCut(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let chars = Array(s)
        let N = chars.count

        //: `result[i]` <-> the count of palindromes using first `i` chars
        var result = (0...N).map { $0 }

        for center in 0..<N {
            //: Odd: Is `(c-r)...(c+r)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius
                guard left >= 0 && right < N else { break }
                guard chars[left] == chars[right] else { break }

                //: `0..<left -- left...right -- (right + 1)..<N`
                result[right + 1] = min(result[right + 1], result[left] + 1)
            }

            //: Even: Is `(c-r)...(c+r+1)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius + 1
                guard left >= 0 && right < N else { break }
                guard chars[left] == chars[right] else { break }
                
                result[right + 1] = min(result[right + 1], result[left] + 1)
            }
        }

        return result.last! - 1
    }
}



let f = SolutionN2().minCut
f("aab")
f("aaabaa") //: A counterexample of greedy algorithm
