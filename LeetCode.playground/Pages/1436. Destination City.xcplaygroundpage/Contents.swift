let tags: [Tag] = [.hash, .graph]

class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var set = Set<String>()
        paths.forEach { set.insert($0[1]) }
        paths.forEach { set.remove($0[0]) }
        return set.first!
    }
}

Solution().destCity([["B", "C"], ["D", "B"], ["C", "A"]])
