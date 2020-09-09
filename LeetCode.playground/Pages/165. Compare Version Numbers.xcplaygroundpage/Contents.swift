let tags: [Tag] = [.string]

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let tokens1 = version1.split(separator: ".")
        let tokens2 = version2.split(separator: ".")
        
        for i in 0..<max(tokens1.count, tokens2.count) {
            let t1 = tokens1.indices ~= i ? Int(tokens1[i])! : 0
            let t2 = tokens2.indices ~= i ? Int(tokens2[i])! : 0
            if t1 == t2 { continue }
            else { return t1 > t2 ? 1 : -1 }
        }
        
        return 0
    }
}
