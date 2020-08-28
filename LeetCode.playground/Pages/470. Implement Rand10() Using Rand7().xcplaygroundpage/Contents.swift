let tags: [Tag] = [.math, .marked]

/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */

class SolBase {
    func rand7() -> Int {
        return (1...7).randomElement()!
    }
}

class Solution: SolBase {
    func rand10() -> Int {
        let point = (rand7(), rand7()) //: generate a point on `7*7` surface uniformly
        let rand49 = (point.0 - 1) * 7 + point.1 //: map the point to `1...49`
        return rand49 <= 40 ? (rand49 - 1) / 4 + 1: rand10() //: rejection
    }
}


let ans = (0..<2000).map { _ in Solution().rand10() }
(1...10).map { i in
    ans.filter { $0 == i }.count
}


class Solution2: SolBase {
    func rand10() -> Int {
        let rand49 = (rand7() - 1) * 7 + rand7() //: `1...49`
        if rand49 <= 40 { return (rand49 - 1) / 4 + 1 }
        let rand9 = rand49 - 40 //: `1...9`
        let rand63 = (rand7() - 1) * 9 + rand9 //: `1...63`
        if rand63 <= 60 { return (rand63 - 1) / 6 + 1 }
        let rand3 = rand63 - 60 //: `1...3`
        let rand21 = (rand7() - 1) * 3 + rand3 //: `1...21`
        if rand21 <= 20 { return (rand21 - 1) / 2 + 1 }
        return rand10()
    }
}
