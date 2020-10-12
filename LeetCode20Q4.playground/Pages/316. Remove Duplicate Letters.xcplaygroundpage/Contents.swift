let tags: [Tag] = [.greedy, .dp]

class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var av = Set(s)
        
        func worker(_ s: String) -> String {
            if s.isEmpty { return "" }
            
            for c in av.sorted() { //: greedy
                let rem = s.suffix(from: s.firstIndex(of: c) ?? s.endIndex)
                guard Set(rem) == av else { continue } //: should contain all chars
                
                let cleaned = rem.replacingOccurrences(of: String(c), with: "") //: never use `c` again
                av.remove(c); defer { av.insert(c) }
                return String(c) + worker(cleaned)
            }
            
            return ""
        }
        
        return worker(s)
    }
}
