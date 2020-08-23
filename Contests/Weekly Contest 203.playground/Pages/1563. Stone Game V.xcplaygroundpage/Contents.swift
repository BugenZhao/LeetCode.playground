class Solution {
    func stoneGameV(_ stoneValue: [Int]) -> Int {
        let N = stoneValue.count
        let accu = stoneValue.reduce(into: [0]) { arr, val in arr.append(arr.last! + val) }
        var memo = [[Int?]](repeating: .init(repeating: nil, count: N + 1), count: N + 1)

        func worker(_ lo: Int, _ hi: Int) -> Int {
            if let m = memo[lo][hi] { return m }
            switch hi - lo + 1 {
            case 1: return 0
            case 2: return min(stoneValue[lo - 1], stoneValue[hi - 1])
            default:
                var ans = 0
                for i in lo..<hi {
                    // [lo, i], [i+1, hi]
                    let left = accu[i] - accu[lo - 1]
                    let right = accu[hi] - accu[i]
                    let a1 = left <= right ? left + worker(lo, i) : 0
                    let a2 = left >= right ? right + worker(i + 1, hi) : 0
                    ans = max(ans, a1, a2)
                }
                memo[lo][hi] = ans
                return ans
            }
        }

        return worker(1, N)
    }
}

let f = Solution().stoneGameV

f([6, 2, 3, 4, 5, 5])
f([7, 7, 7, 7, 7, 7, 7])
f([4])
f([1, 1, 2])
f([2, 3, 1, 4])
f([68, 75, 25, 50, 34, 29, 77, 1, 2, 69])
f([98, 77, 24, 49, 6, 12, 2, 44, 51, 96])
