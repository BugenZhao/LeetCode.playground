//: Consider each square as four isosceles triangles, then apply union-find

let tags: [Tag] = [.union, .marked]

class Solution {
    func regionsBySlashes(_ grid: [String]) -> Int {
        let N = grid.count
        var uf = QuickUnionFind(N * N * 4)

        // inter-square
        for i in 0..<N {
            for j in 0..<N {
                if i != N - 1 {
                    let down = (i * N + j) * 4 + 3
                    let thatUp = ((i + 1) * N + j) * 4 + 1
                    uf.union(down, thatUp)
                }
                if j != N - 1 {
                    let right = (i * N + j) * 4 + 2
                    let thatLeft = (i * N + (j + 1)) * 4 + 0
                    uf.union(right, thatLeft)
                }
            }
        }
        
        // in-square
        for (i, row) in grid.enumerated() {
            for (j, c) in row.enumerated() {
                let left = (i * N + j) * 4
                let (up, right, down) = (left + 1, left + 2, left + 3)

                switch c {
                case " ":
                    uf.union(left, up)
                    uf.union(up, right)
                    uf.union(right, down)
                case "/":
                    uf.union(left, up)
                    uf.union(down, right)
                case "\\":
                    uf.union(left, down)
                    uf.union(up, right)
                default:
                    break
                }
            }
        }

        return uf.count
    }
}


let f = Solution().regionsBySlashes

f([
    "/\\",
    "\\/"
  ])
f([
    " /",
    "/ "
  ])
f(["  ", "  "])
