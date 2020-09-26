let tags: [Tag] = [.sort]

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let nums = nums.map(String.init)
        let ans = nums.sorted(by: { a, b in a + b > b + a }).joined()
        let dropped = String(ans.drop(while: { $0 == "0" }))
        return dropped.isEmpty ? "0" : dropped
    }
}


let f = Solution().largestNumber

f([3, 30, 34, 5, 9]) == "9534330"
f([0, 0]) == "0"
