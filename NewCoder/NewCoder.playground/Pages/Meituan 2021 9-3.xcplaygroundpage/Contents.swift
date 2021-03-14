func solve(_ nums: [Int]) {
    let sum = nums.reduce(0, +)
    
    var (minAns, maxAns) = (0, 0)
    var (minCurr, maxCurr) = (0, 0)
    
    for n in nums {
        minCurr = min(minCurr + n, n)
        minAns = min(minAns, minCurr)
        maxCurr = max(maxCurr + n, n)
        maxAns = max(maxAns, maxCurr)
    }
    
    print(max(maxAns, sum - minAns))
}

let T = Int(readLine()!)!
(0..<T).map{ _ in
    let _ = readLine()!
    solve(readLine()!.split(separator: " ").map { Int($0)! })
}
