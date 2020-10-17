let tags: [Tag] = [.hash]

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let s = Array(s)
        var once = Set<ArraySlice<Character>>()
        var twice = Set<ArraySlice<Character>>()

        for i in s.indices.dropLast(9) {
            let sub = s[i..<i + 10]
            if once.contains(sub) { twice.insert(sub) }
            else { once.insert(sub) }
        }

        return twice.map { String($0) }
    }
}
