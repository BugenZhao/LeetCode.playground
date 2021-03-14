let n = Int(readLine()!)!

var adj = [Int: [Int]]()

for _ in 0..<n - 1 {
    let ts = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (ts[0] - 1, ts[1] - 1)
    adj[x, default: []].append(y)
    adj[y, default: []].append(x)
}

func clean(_ x: Int) {
    if let ys = adj[x] {
        for y in ys {
            adj[y]?.removeAll { $0 == x }
            clean(y)
        }
    }
}
clean(0)

let colors = readLine()!.split(separator: " ").map { Int($0)! }

let q = Int(readLine()!)!
for _ in 0..<q {
    let t = Int(readLine()!)! - 1
    var colorCounter = [Int: Int]()

    func dfs(_ x: Int) {
        colorCounter[colors[x], default: 0] += 1
        adj[x]?.forEach(dfs)
    }
    dfs(t)

    print(colorCounter.max(by: { lhs, rhs in lhs.value == rhs.value ? lhs.key > rhs.key: lhs.value < rhs.value })!.key)
}
