let tags: [Tag] = [.greedy]

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let N = nums.count
        var lastPos = 0
        for i in 0..<N {
            if i > lastPos { return false }
            if lastPos >= N - 1 { return true }
            lastPos = max(lastPos, i + nums[i])
        }
        return true
    }
}


let f = Solution().canJump

f([2, 3, 1, 1, 4])
f([3, 2, 1, 0, 4])
f([0])
f([0, 1])
f([1, 0])
