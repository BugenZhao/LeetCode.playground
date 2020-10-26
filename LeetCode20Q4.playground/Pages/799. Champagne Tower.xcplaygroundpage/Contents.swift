let tags: [Tag] = [.dp]

class Solution {
    func champagneTower(_ poured: Int, _ queryRow: Int, _ queryGlass: Int) -> Double {
        let poured = Double(poured)

        let N = max(queryRow, queryGlass)
        var memo = [[Double?]](repeating: .init(repeating: nil, count: N + 1), count: N + 1)
        func amount(_ row: Int, _ col: Int) -> Double {
            if col < 0 || col > row { return 0.0 }
            if row == 0 { return poured }
            if let m = memo[row][col] { return m }

            let ofl = max(amount(row - 1, col - 1) - 1, 0.0) / 2.0
            let ofr = max(amount(row - 1, col) - 1, 0.0) / 2.0
            let ans = ofl + ofr
            memo[row][col] = ans
            
            return ans
        }
        
        return min(amount(queryRow, queryGlass), 1.0)
    }
}


let f = Solution().champagneTower

f(100000009
  ,33
  ,17)
