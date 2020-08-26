let tags: [Tag] = [.dfs]

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        var list = [Int]()
        func worker(_ rem: Int, _ candFrom: Int) {
            if rem == 0 { ans.append(list) }
            else if rem < 0 { return }
            for i in candFrom..<candidates.endIndex {
                list.append(candidates[i])
                worker(rem - candidates[i], i)
                list.removeLast()
            }
        }
        worker(target, 0)
        return ans
    }
}


let f = Solution().combinationSum

f([2, 3, 5], 8)
f([2, 3, 6, 7], 7)
