let tags: [Tag] = [.dfs]

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var ans = [[Int]]()
        var list = [Int]()
        func worker(_ rem: Int, _ from: Int) {
            if rem == 0, list.count == k { ans.append(list) }
            else if rem < 0 { return }
            else if list.count >= k { return }
            for i in from..<10 {
                list.append(i)
                worker(rem - i, i + 1)
                list.removeLast()
            }
        }
        worker(n, 1)
        return ans
    }
}


let f = Solution().combinationSum3

f(3, 7)
f(3, 9)
