class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var last = [Character: Int]()
        let s = Array(s)
        var subs = [String]()

        for (j, c) in s.enumerated() {
            if let i = last[c] {
                let sub = s[(i + 1)..<j]
                subs.append(String(sub))
            } else {
                last[c] = j
            }
        }

        return subs.map { $0.count }.max() ?? -1
    }
}


Solution().maxLengthBetweenEqualCharacters("mgntdygtxrvxjnwksqhxuxtrv")
