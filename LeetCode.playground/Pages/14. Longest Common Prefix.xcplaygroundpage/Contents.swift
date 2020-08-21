let tags: [Tag] = [.string]

class Solution {
    func commonPrefix(_ lhs: Substring, _ rhs: String) -> Substring {
        for (i, j) in zip(lhs.indices, rhs.indices) {
            if lhs[i] != rhs[j] { return lhs[lhs.startIndex..<i] }
        }
        return min(lhs, rhs[...])
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        return String(strs.reduce(strs.first![...], commonPrefix))
    }
}


let f = Solution().longestCommonPrefix

f(["flower", "flow", "flight"])
f(["bugen", "zhao"])
f(["aa", "a"])


class SolutionBuiltin {
    func longestCommonPrefix(_ strs: [String]) -> String {
        return strs.reduce(strs.first ?? "") { $0.commonPrefix(with: $1) }
    }
}


let g = SolutionBuiltin().longestCommonPrefix

g(["flower", "flow", "flight"])
g(["bugen", "zhao"])
g(["aa", "a"])
