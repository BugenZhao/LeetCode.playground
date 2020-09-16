class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}
