// Dynamic Programming

class SolutionDP {
    func numDecodings(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        guard s.count >= 2 else { return ("1"..."9" ~= s.first!) ? 1 : 0 }

        let s = Array(s)
        var dp = [Int](repeating: 0, count: s.count + 1)
        // dp[i] represents the ways using first i chars
        dp[0] = 1; dp[1] = ("1"..."9" ~= s[0]) ? 1 : 0

        for i in 2...s.count {
            if "1"..."9" ~= s[i - 1] { dp[i] += dp[i - 1] }
            if "1" == s[i - 2] && "0"..."9" ~= s[i - 1] { dp[i] += dp[i - 2] }
            if "2" == s[i - 2] && "0"..."6" ~= s[i - 1] { dp[i] += dp[i - 2] }
            // else? unexpected "0"
        }

        return dp.last!
    }
}

let f = SolutionDP().numDecodings

f("12")
f("29")
f("226")
f("02")
f("0")
f("230")
f("2222")
f("1")
