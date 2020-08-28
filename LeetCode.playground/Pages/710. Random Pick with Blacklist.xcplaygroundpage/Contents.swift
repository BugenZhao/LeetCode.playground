let tags: [Tag] = [.math]

class Solution {
    let n: Int
    var map = [Int: Int]()

    init(_ N: Int, _ blacklist: [Int]) {
        let blacklist = Set(blacklist)
        n = N - blacklist.count //: available count
        //: we will pick from `0..<n`
        //: for those black nums less than `n`, map them to a white num in `n..<N`
        //: for others, do nothing since we won't pick them
        var num = N
        for b in blacklist where b < n {
            repeat { num -= 1 } while blacklist.contains(num)
            map[b] = num
        }
    }

    func pick() -> Int {
        let a = (0..<n).randomElement()!
        if let mapped = map[a] { return mapped }
        else { return a }
    }
}


let f = Solution(4, [0, 3]).pick
let arr = (0..<2000).map { _ in
    f()
}
(0..<8).map { i in
    arr.filter { $0 == i }.count
}
