//: Note that `x & (x - 1)` unset the least significant `1`.
let tags: [Tag] = [.math]

class Solution {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var answers = [0]
        answers.reserveCapacity(num + 1)
        (1...num).forEach { x in answers.append(answers[x&(x - 1)] + 1) }
        return answers
    }
}

Solution().countBits(5)


class SolutionBuiltin {
    func countBits(_ num: Int) -> [Int] {
        return (0...num).map { $0.nonzeroBitCount }
    }
}

SolutionBuiltin().countBits(5)
