let tags: [Tag] = [.working]

infix operator ~~: ComparisonPrecedence
@inline(__always) func ~~ (lhs: [Character], rhs: [Character]) -> Bool {
    return [0, 2].contains(zip(lhs, rhs).filter { $0 != $1 }.count)
}

class Solution {
    func numSimilarGroups(_ A: [String]) -> Int {
        let A = A.map { Array($0) }
        var uf = QuickUnionFind(A.count)
        let dict = A.enumerated().reduce(into: [[Character]: Int]()) { $0[$1.element] = $1.offset }

        let shorterArray = {
            for i in 0..<A.count {
                for j in (i + 1)..<A.count {
                    if !uf.inSameSet(i, j) && A[i] ~~ A[j] { uf.union(i, j) }
                }
            }
        }

        let shorterWord = {
            for (lhs, word) in A.enumerated() {
                for i in 0..<word.count {
                    for j in (i + 1)..<word.count {
                        var swapped = word
                        swapped.swapAt(i, j)
                        if let rhs = dict[swapped] { uf.union(lhs, rhs) }
                    }
                }
            }
        }

        if A.count < A[0].count { shorterArray() }
        else { shorterWord() }

        return uf.count
    }
}


Solution().numSimilarGroups(["tars", "rats", "arts", "star"])

