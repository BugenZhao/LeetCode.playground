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
