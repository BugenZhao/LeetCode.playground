func solve(_ a: Int, _ b: Int, _ c: Int) -> Int {
    var mask = 1 << 62
    var ans = 0
    
    while mask >= 1 {
        let aa = (a & mask).signum()
        let bb = (b & mask).signum()
        let cc = (c & mask).signum()
        
        if cc == 0 {
            ans += aa + bb
        } else {
            if aa == 0 && bb == 0 { ans += 1 }
        }
        mask >>= 1
    }
    
    return ans
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let p = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (p[0], p[1], p[2])
    print(solve(a, b, c))
}
