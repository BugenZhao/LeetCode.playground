class Solution {
    func freqAlphabets(_ s: String) -> String {
        var scalars = [UInt8]()
        var i = s.startIndex
        while i != s.endIndex {
            print(s[i])
            if let sharp = s.index(i, offsetBy: 2, limitedBy: s.endIndex), sharp != s.endIndex, s[sharp] == "#" {
                scalars.append(UInt8(s[i..<sharp])!)
                i = s.index(after: sharp)
            } else {
                scalars.append(UInt8("\(s[i])")!)
                i = s.index(after: i)
            }
        }
        return String(scalars.map { Character(UnicodeScalar($0 + 96)) })
    }
}

let f = Solution().freqAlphabets
f("12345678910#11#12#13#14#15#16#17#18#19#20#21#22#23#24#25#26#")
f("10#11#12")
