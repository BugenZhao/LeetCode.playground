let tags: [Tag] = [.hash]

class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        var cur = 0 * 10_001 + 0
        var set = Set<Int>([cur])
        return path.first { c in
            switch(c) {
            case "N": cur += 1
            case "S": cur -= 1
            case "E": cur += 10001
            case "W": cur -= 10001
            default: return false
            }
            defer { set.insert(cur) }
            return set.contains(cur)
        } != nil
    }
}

let f = Solution().isPathCrossing

f("NES")
f("NESW")
