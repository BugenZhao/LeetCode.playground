//: Dynamic Programming in `O(n^2)` time, like Problem 132

let tags: [Tag] = [.marked, .dp]

class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        let chars = Array(s)
        let N = chars.count

        var (lo, hi) = (0, 0)


        for center in 0..<N {
            if max(center * 2 + 1, (N - 1 - center) * 2 + 1) <= hi - lo + 1 { continue }

            //: Odd: Is `(c-r)...(c+r)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius
                guard left >= 0 && right < N else { break }
                guard chars[left] == chars[right] else { break }

                if 2 * radius + 1 > hi - lo + 1 { (lo, hi) = (left, right) }
            }

            //: Even: Is `(c-r)...(c+r+1)` a palindrome?
            for radius in 0... {
                let left = center - radius
                let right = center + radius + 1
                guard left >= 0 && right < N else { break }
                guard chars[left] == chars[right] else { break }

                if 2 * radius + 2 > hi - lo + 1 { (lo, hi) = (left, right) }
            }
        }

        return String(chars[lo...hi])
    }
}

let f = Solution().longestPalindrome

f("babad")
f("dddbugenegublll")
f("abacab")


class SolutionManacher {
    // TODO: Manacher algorithm
}
