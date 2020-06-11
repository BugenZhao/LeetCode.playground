let tags: [Tag] = [.math, .greedy]

class Solution {
    func maxDiff(_ num: Int) -> Int {
        let numStr = "\(num)"
        let a: Int
        if let victim = numStr.first(where: { $0 != "9" }) {
            a = Int(numStr.replacingOccurrences(of: "\(victim)", with: "9"))!
        } else {
            a = num
        }

        let b: Int
        if numStr.first! != "1" {
            b = Int(numStr.replacingOccurrences(of: "\(numStr.first!)", with: "1"))!
        } else if let victim = numStr.dropFirst().first(where: { $0 != "0" && $0 != "1" }) {
            b = Int(numStr.replacingOccurrences(of: "\(victim)", with: "0"))!
        } else {
            b = num
        }

        return a - b
    }
}

let f = Solution().maxDiff

f(555)
f(9)
f(123456)
f(10000)
f(9288)
f(111)
