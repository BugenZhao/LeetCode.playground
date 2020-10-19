

class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let s = Array(s)
        var poss = Set<String>()
        poss.insert(String(s))

        if b.isMultiple(of: 2) {
            var t = s
            while true {
                for i in t.indices where !i.isMultiple(of: 2) {
                    t[i] = Character(UnicodeScalar((t[i].hexDigitValue! + a) % 10 + 0x30)!)
                }
                let tt = String(t)
                if poss.contains(tt) { break }
                poss.insert(tt)
            }
        } else {
            var t = s
            while true {
                while true {
                    for i in t.indices where !i.isMultiple(of: 2) {
                        t[i] = Character(UnicodeScalar((t[i].hexDigitValue! + a) % 10 + 0x30)!)
                    }
                    let tt = String(t)
                    if poss.contains(tt) { break }
                    poss.insert(tt)
                }
                for i in t.indices where i.isMultiple(of: 2) {
                    t[i] = Character(UnicodeScalar((t[i].hexDigitValue! + a) % 10 + 0x30)!)
                }
                let tt = String(t)
                if poss.contains(tt) { break }
                poss.insert(tt)
            }
        }
        

        let b = b % s.count
        var mini = poss.min()!
        for i in s.indices {
            let shamt = (b * i) % s.count
            for p in poss {
                let n = (p + p.prefix(shamt)).dropFirst(shamt)
                mini = min(mini, String(n))
            }
        }

        return mini
    }
}


Solution().findLexSmallestString("192804"
    , 8
    , 5)
