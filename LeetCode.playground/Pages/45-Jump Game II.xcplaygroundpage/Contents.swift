let tags: [Tag] = [.marked, .greedy, .bfs]

//: ![Figure](45.png)

class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else  { return 0 }

        var count = 0
        var farthestThisJump = 0 //: farthest position we can reach this jump
        var farthestNextJump = 0 //: farthest position we can reach next jump

        for i in 0..<nums.count {
            farthestNextJump = max(farthestNextJump, i + nums[i])
            if farthestNextJump >= nums.count - 1 { return count + 1 }
            if i == farthestThisJump {
                farthestThisJump = farthestNextJump
                count += 1
            }
        }

        return count
    }
}


let f = Solution().jump

f([2, 3, 1, 1, 4])
