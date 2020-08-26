let tags: [Tag] = [.dfs]

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var ans = [[Int]]()
        var list = [Int]()
        func worker(_ rem: Int, _ candFrom: Int) {
            if rem == 0 { ans.append(list) }
            else if rem < 0 { return }
            for i in candFrom..<candidates.endIndex {
                //: to avoid duplicates!!!
                if i > candFrom, candidates[i] == candidates[i - 1] { continue }
                list.append(candidates[i])
                worker(rem - candidates[i], i + 1)
                list.removeLast()
            }
        }
        worker(target, 0)
        return ans
    }
}


let f = Solution().combinationSum2

f([10, 1, 2, 7, 6, 1, 5], 8)
f([2, 5, 2, 1, 2], 5)
