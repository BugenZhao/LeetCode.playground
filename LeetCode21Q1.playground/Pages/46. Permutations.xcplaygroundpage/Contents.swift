let tags: [Tag] = [.tree, .dfs]

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()

        func dfs(_ num: Int, _ visited: inout Set<Int>, _ perm: inout [Int]) {
            perm.append(num)
            visited.insert(num)

            let cands = nums.filter { !visited.contains($0) }
            if cands.isEmpty {
                ans.append(perm)
            } else {
                for cand in cands {
                    dfs(cand, &visited, &perm)
                }
            }

            visited.remove(num)
            perm.popLast()
        }

        for num in nums {
            var visited = Set<Int>()
            var perm = [Int]()
            dfs(num, &visited, &perm)
        }

        return ans
    }
}


Solution().permute([1, 2, 3])
