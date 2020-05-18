let tags: [Tag] = [.hash]

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return Dictionary(grouping: s, by: { $0 }) == Dictionary(grouping: t, by: { $0 })
    }
}
