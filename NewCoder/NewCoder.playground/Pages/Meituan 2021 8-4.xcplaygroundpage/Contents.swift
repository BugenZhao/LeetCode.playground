let p = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m, xs, ys, xt, yt) = (p[0], p[1], p[2] - 1, p[3] - 1, p[4] - 1, p[5] - 1)

var A = [[Int]]()
var B = [[Int]]()

for _ in 0..<n { A.append(readLine()!.split(separator: " ").map { Int($0)! }) }
for _ in 0..<n { B.append(readLine()!.split(separator: " ").map { Int($0)! }) }

func solve() -> Int {
    var q = [(Int, Int)]()
    q.append((xs, ys))
    var visited = [[Bool]](repeating: .init(repeating: false, count: m), count: n)
    
    var i = q.startIndex
    var cost = 0
    while i != q.endIndex {
        let levelEnd = q.endIndex
        while i != levelEnd {
            let (x, y) = q[i]; i += 1
            if x == xt && y == yt { return cost }
            
            let rem = cost % (A[x][y] + B[x][y])
            let dsts: [(Int, Int)]
            if rem < A[x][y] {
                dsts = [(x - 1, y), (x + 1, y)]
            } else {
                dsts = [(x, y - 1), (x, y + 1)]
            }
            
            q.append((x, y))
            for (nx, ny) in dsts {
                guard 0..<n ~= nx && 0..<m ~= ny else { continue }
                guard !visited[nx][ny] else { continue }
                visited[nx][ny] = true
                q.append((nx, ny))
            }
        }
        cost += 1
    }
    
    return cost
}


print(solve())
