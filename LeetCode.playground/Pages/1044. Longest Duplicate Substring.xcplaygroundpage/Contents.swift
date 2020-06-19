let tags: [Tag] = [.hash, .sliding, .string, .binSearch, .annoying]

class Solution {
    func longestDupSubstring(_ S: String) -> String {
        let mod = 0x1_000_000_007
        let S = Array(S)
        var powers = [1]
        for _ in S { powers.append(26 * powers.last! % mod) }

        func worker(_ len: Int) -> Int? {
            if len >= S.count { return nil }

            var dict = [Int: [Int]]()
            //: Rabin Karp hashing
            var hash = S[0..<len].reduce(0) { h, c in (h * 26 + c.alphaOrder) % mod }
            dict[hash] = [0]

            for i in 1..<S.count - len + 1 {
                //: Rabin Karp with sliding windows
                hash = (hash * 26 - S[i - 1].alphaOrder * powers[len] + S[i + len - 1].alphaOrder + mod) % mod
                if hash < 0 { hash += mod }
                if let matches = dict[hash],
                    matches.first(where: { S[$0..<$0 + len] == S[i..<i + len] }) != nil {
                    return i
                }
                dict[hash, default: []].append(i)
            }
            return nil
        }

        var (lo, hi) = (S.startIndex, S.endIndex)
        var (maxLength, maxPos) = (0, 0)
        while lo != hi {
            //: binary search
            let mid = lo + (hi - lo) / 2
            if let pos = worker(mid) {
                maxLength = mid; maxPos = pos
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        if let pos = worker(lo) { maxLength = lo; maxPos = pos } //: KEY!
        return String(S[maxPos..<maxPos + maxLength])
    }
}

let f = Solution().longestDupSubstring

f("banana")
f("leetcodecookies")
f("abcd")
f("aaaaaaa")
