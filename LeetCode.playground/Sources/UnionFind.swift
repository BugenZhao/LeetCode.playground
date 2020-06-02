public struct UnionFind<T:Hashable> {
    public typealias SetIndex = Int

    private var indexOf = [T: SetIndex]()
    private var parentOf = [SetIndex]()
    private var sizeOf = [Int]()

    @discardableResult
    public mutating func addSet(with element: T) -> SetIndex {
        let idx = parentOf.count
        indexOf[element] = idx
        parentOf.append(idx)
        sizeOf.append(1)
        return idx
    }

    private mutating func set(by index: SetIndex) -> SetIndex {
        if index != parentOf[index] {
            parentOf[index] = set(by: parentOf[index])
        }
        return parentOf[index]
    }

    public mutating func set(of element: T) -> SetIndex? {
        if let index = indexOf[element] { return set(by: index) }
        else { return nil }
    }

    public mutating func union(_ lhs: T, _ rhs: T) {
        if let lhsIndex = set(of: lhs), let rhsIndex = set(of: rhs), lhsIndex != rhsIndex {
            if sizeOf[lhsIndex] < sizeOf[rhsIndex] {
                parentOf[lhsIndex] = rhsIndex
                sizeOf[rhsIndex] += sizeOf[lhsIndex]
            } else {
                parentOf[rhsIndex] = lhsIndex
                sizeOf[lhsIndex] += sizeOf[rhsIndex]
            }
        }
    }

    public mutating func inSameSet(_ lhs: T, _ rhs: T) -> Bool {
        if let lhsIndex = set(of: lhs), let rhsIndex = set(of: rhs), lhsIndex == rhsIndex {
            return true
        } else {
            return false
        }
    }
    
    public init() {}
}
