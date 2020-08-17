let tags: [Tag] = [.greedy]

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        let S = Array(S)
        var occ = [Character: Int]()
        for (i, c) in S.enumerated().reversed() where occ[c] == nil { occ[c] = i }

        var ans = [Int]()
        var start = 0
        while start != S.endIndex {
            var i = start
            var end = Int.min
            while i != end + 1 {
                end = max(end, occ[S[i]]!)
                if end == S.endIndex - 1 { break }
                i += 1
            }
            ans.append(end - start + 1)
            start = end + 1
        }

        return ans
    }
}

let f = Solution().partitionLabels

f("ababcbacadefegdehijhklij")
f("abcdefg")
f("abcdefga")
