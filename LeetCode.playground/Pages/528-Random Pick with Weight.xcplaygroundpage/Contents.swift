let tags: [Tag] = [.binSearch]

class Solution {
    let acc: [Int]

    init(_ w: [Int]) {
        acc = w.reduce(into: []) { $0.append(($0.last ?? 0) + $1) }
    }

    func pickIndex() -> Int {
        let rand = (0..<acc.last!).randomElement()!
        return acc.binarySearch(predicate: { $0 <= rand })
    }
}

let s = Solution([1, 3])
let results = (1...1000).map { _ in s.pickIndex() }
results
let count = results.filter { $0 == 1 }.count
count //: around 750
