var memo0 = [Int: Double]()

func solve(_ n: Int, _ c: Int = 0) -> Double {
    if c == 2 { return Double(n) }
    
    if let m = memo0[n] { return m }
    if n <= 1 { return Double(n) }

    var ans: Double = 0
    for i in 1...(n - 1) {
        let short = min(i, n - i)
        let diff = abs(i - (n - i))
        ans += Double(short) + solve(diff, c + 1)
    }
    ans /= Double(n - 1)
    memo0[n] = ans

    return ans
}

//print((1...100).map { solve($0, 0) })

let n = Int(readLine()!)!
let ans = String(format: "%.4f", solve(n))
print(ans)
