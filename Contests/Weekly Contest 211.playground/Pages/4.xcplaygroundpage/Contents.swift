public struct QuickUnionFind {
    public typealias SetIndex = Int

    public var parentOf: [SetIndex]
    public var sizeOf: [Int]

    public private(set) var count: Int


    public mutating func set(by index: SetIndex) -> SetIndex {
        if index != parentOf[index] {
            parentOf[index] = set(by: parentOf[index])
        }
        return parentOf[index]
    }

    public mutating func union(_ lhs: SetIndex, _ rhs: SetIndex) {
        let lhsIndex = set(by: lhs)
        let rhsIndex = set(by: rhs)
        if lhsIndex != rhsIndex {
            if sizeOf[lhsIndex] < sizeOf[rhsIndex] {
                parentOf[lhsIndex] = rhsIndex
                sizeOf[rhsIndex] += sizeOf[lhsIndex]
            } else {
                parentOf[rhsIndex] = lhsIndex
                sizeOf[lhsIndex] += sizeOf[rhsIndex]
            }
            count -= 1
        }
    }

    @inline(__always)
    public mutating func inSameSet(_ lhs: SetIndex, _ rhs: SetIndex) -> Bool {
        return set(by: lhs) == set(by: rhs)
    }

    public init(_ n: Int) {
        parentOf = (0..<n).map { $0 }
        sizeOf = (0..<n).map { _ in 1 }
        count = n
    }
}


class Solution {
    func areConnected(_ n: Int, _ threshold: Int, _ queries: [[Int]]) -> [Bool] {
        if threshold == n { return queries.map { _ in false } }
        var uf = QuickUnionFind(n + 1)

        var isPrime = (0...n).map { _ in true }

        for i in (threshold + 1)...n where isPrime[i] {
            for j in 1... {
                let ij = i * j
                if ij > n { break }
                uf.union(i, ij)
                isPrime[ij] = false
            }
        }

        return queries.map { uf.inSameSet($0[0], $0[1]) }
    }
}
