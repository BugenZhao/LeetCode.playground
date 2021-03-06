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
        case .array:
            return "Array"
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
        case .union:
            return "Union Find"
        case .string:
            return "String"
        case .greedy:
            return "Greedy"
        case .dfs:
            return "DFS"
        case .bfs:
            return "BFS"
        case .stack:
            return "Stack"
        case .sliding:
            return "Sliding Windows"
        case .sp:
            return "Shortest Path"
        case .working:
            return "Working"
        case .annoying:
            return "Annoying"
        case .bit:
            return "Bit Manipulation"
        case .ON:
            return "O(n)"
        case .dq:
            return "Divide & Conquer"
        case .state:
            return "State Machine"
        case .npc:
            return "NP Complete"
        }
    }

    public static let specialWithEmojis: [Tag: String] = [.marked: "🔞", .working: "📝", .annoying: "🤬"]
    public static let special: [Tag] = [.working, .marked, .annoying]

    case marked, working, annoying
    case array, hash, list, heap, tree, graph, string, stack
    case sort, binSearch, twoPtrs, sliding, union, dfs, bfs, sp, dq
    case dp, greedy, math, bit, state, ON, npc
}
