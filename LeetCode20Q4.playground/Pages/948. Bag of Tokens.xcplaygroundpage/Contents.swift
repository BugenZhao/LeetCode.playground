let tags: [Tag] = [.twoPtrs, .ON, .greedy]

class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
        let tokens = tokens.sorted()

        var score = 0
        var maxScore = 0
        var P = P
        var (lo, hi) = (0, tokens.count - 1)
        
        while lo <= hi {
            while lo <= hi, P >= tokens[lo] {
                score += 1
                P -= tokens[lo]
                lo += 1
            }
            maxScore = max(score, maxScore)
            
            if lo > hi || score == 0 { break }
            score -= 1
            P += tokens[hi]
            hi -= 1
        }

        return maxScore
    }
}
