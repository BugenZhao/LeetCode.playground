let tags: [Tag] = [.math, .string]

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var k = k - 1
        var ans = ""
        let fact: [Int] = (1..<n).reduce(into: [1]) { $0.append($0.last! * $1) }.reversed()
        var nums = (1...n).map { $0 }

        for i in 0..<n {
            let q = k / fact[i]; k = k % fact[i]
            ans.append("\(nums[q])")
            nums.remove(at: q)
        }
        return ans
    }
}

let f = Solution().getPermutation
for k in 1...24 { print(f(4, k)) }
