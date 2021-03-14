while let line = readLine() {
    let ts = line.split(separator: " ").map { Int($0)! }
    let (n, m) = (ts[0], ts[1])
    let (a, b) = (min(ts[2], ts[3]), max(ts[2], ts[3]))
    
    var nums = readLine()!.split(separator: " ").map { Int($0)! }
    let (cMin, cMax) = (nums.min(), nums.max())
    
    switch n - m {
    case 0:
        break
    case 1:
        if cMin == a { nums.append(b) }
        else if cMax == b { nums.append(a) }
    default:
        nums.append(a)
        nums.append(b)
    }
    
    if nums.min() == a && nums.max() == b {
        print("YES")
    } else {
        print("NO")
    }
}
