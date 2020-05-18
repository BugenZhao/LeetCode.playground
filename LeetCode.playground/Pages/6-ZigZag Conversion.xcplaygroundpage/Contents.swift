let tags: [Tag] = [.array]

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }
        
        var rows = [[Character]](repeating: [], count: numRows)
        var current = 0; var dir = -1
        s.forEach { char in
            rows[current].append(char)
            if [0, numRows - 1].contains(current) { dir.negate() }
            current += dir
        }

        return rows.reduce("") { $0 + String($1) }
    }
}


let f = Solution().convert

f("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR"
f("PAYPALISHIRING", 4) == "PINALSIGYAHRPI"
f("bugenzhao", 1)
f("bugenzhao", 2)
