class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        var countA = [Int: Int]()
        var countB = [Int: Int]()
        for (a, b) in zip(A, B) {
            countA[a, default: 0] += 1
            countB[b, default: 0] += 1
        }

        let candidates = (1...6)
            .filter { (countA[$0] ?? 0) + (countB[$0] ?? 0) >= A.count }
            .filter { cand in zip(A, B).allSatisfy({ a, b in a == cand || b == cand }) }

        return candidates.isEmpty ? -1 : A.count - candidates.map { max(countA[$0]!, countB[$0]!) }.max()!
    }
}
