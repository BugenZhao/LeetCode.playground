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
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var uf1 = QuickUnionFind(n + 1)
        var uf2 = QuickUnionFind(n + 1)
        
        var ans = 0
        for edge in edges where edge[0] == 3 {
            let (u, v) = (edge[1], edge[2])
            if uf1.set(by: u) != uf1.set(by: v) {
                uf1.union(u, v)
                uf2.union(u, v)
            } else {
                ans += 1
            }
        }
        for edge in edges where edge[0] == 1 {
            let (u, v) = (edge[1], edge[2])
            if uf1.set(by: u) != uf1.set(by: v) {
                uf1.union(u, v)
            } else {
                ans += 1
            }
        }
        for edge in edges where edge[0] == 2 {
            let (u, v) = (edge[1], edge[2])
            if uf2.set(by: u) != uf2.set(by: v) {
                uf2.union(u, v)
            } else {
                ans += 1
            }
        }
        
        for i in 1...n {
            if uf1.set(by: i) != uf1.set(by: 1) { return -1 }
            if uf2.set(by: i) != uf2.set(by: 1) { return -1 }
        }
        
        return ans
    }
}
