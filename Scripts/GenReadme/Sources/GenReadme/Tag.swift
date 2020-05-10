import Foundation

public enum Tag: String, Hashable, Equatable, CustomStringConvertible, CaseIterable {
    public var description: String {
        switch self {
        case .marked:
            return "**\(self.rawDescription)**"
        default:
            return self.rawDescription
        }
    }
    
    public var rawDescription: String {
        switch self {
        case .marked:
            return "Marked"
        case .hash:
            return "Hash Table"
        case .list:
            return "Linked List"
        case .heap:
            return "Heap"
        case .sort:
            return "Sort"
        case .binSearch:
            return "Binary Search"
        case .twoPtrs:
            return "Two Pointers"
        case .dp:
            return "DP"
        case .tree:
            return "Tree"
        case .graph:
            return "Graph"
        case .math:
            return "Mathematics"
        }
    }

    case marked
    case hash, list, heap
    case sort
    case binSearch, twoPtrs
    case dp, tree, graph, math
}
