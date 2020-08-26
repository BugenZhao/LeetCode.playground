class Solution {
    func isMonotonic(_ A: [Int]) -> Bool {
        let diff = zip(A, A.dropFirst()).map { $1 - $0 }
        return diff.allSatisfy { $0 >= 0 } || diff.allSatisfy { $0 <= 0 }
    }
}
