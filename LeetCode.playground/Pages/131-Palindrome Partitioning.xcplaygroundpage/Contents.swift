//: Bottom-up dynamic programming
class Solution {
    func partition(_ s: String) -> [[String]] {
        guard !s.isEmpty else { return [] }
        let chars = Array(s)
        let N = chars.count
        let isPalindrome = { (lo: Int, hi: Int) -> Bool in
            var lo = lo; var hi = hi
            while lo < hi {
                guard chars[lo] == chars[hi] else { return false }
                lo += 1; hi -= 1
            }
            return true
        }

        //: `result[i]` <-> the results using `i` chars
        var result = [[[String]]](repeating: [], count: N + 1)
        result[0] = [[]]

        for end in 0..<N {
            for mid in 0...end {
                if isPalindrome(mid, end) { // 0...(mid-1) + mid...end
                    let substring = String(chars[mid...end])
                    result[end + 1].append(contentsOf: result[mid].map { $0 + [substring] })
                }
            }
        }

        // result.enumerated().forEach { print($0, $1) }
        return result.last!
    }
}

Solution().partition("")
Solution().partition("aab")
Solution().partition("aaaaa")
