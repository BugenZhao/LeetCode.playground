class Solution {
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    
    func modifyString(_ s: String) -> String {
        var ans = Array(s)
        let n = ans.count
        for (i, c) in s.enumerated() {
            guard c == "?" else { continue }
            var new = 0
            if i > 0, i < n - 1 {
                while letters[new] == ans[i - 1] || letters[new] == ans[i + 1] { new += 1 }
            } else if i > 0 {
                while letters[new] == ans[i - 1] { new += 1 }
            } else if i < n - 1 {
                while letters[new] == ans[i + 1] { new += 1 }
            }
            ans[i] = letters[new]
        }
        return String(ans)
    }
}


let f = Solution().modifyString

f("??yw?ipkj?")
f("?")
