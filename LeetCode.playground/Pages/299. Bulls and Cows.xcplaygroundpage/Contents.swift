class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        let bull = zip(secret, guess).filter { $0 == $1 }.count
        let ne = zip(secret, guess).filter { $0 != $1 }
        var stat = [(Int, Int)](repeating: (0, 0), count: 10)
        for (a, b) in ne {
            stat[a.hexDigitValue!].0 += 1
            stat[b.hexDigitValue!].1 += 1
        }
        let cow = stat.map{ min($0, $1) }.reduce(0, +)
        return "\(bull)A\(cow)B"
    }
}

Solution().getHint("1123897", "0111987")
