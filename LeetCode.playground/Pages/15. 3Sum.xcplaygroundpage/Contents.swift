let tags: [Tag] = [.twoPtrs]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var results = [[Int]]()
        for first in nums.indices where first == 0 || nums[first] != nums[first - 1] {
            let target = -nums[first]
            var third = nums.endIndex - 1
            for second in (first + 1)..<nums.endIndex where second == first + 1 || nums[second] != nums[second - 1] {
                while second < third, nums[second] + nums[third] > target { third -= 1 }
                if second == third {
                    break
                } else if nums[second] + nums[third] == target {
                    results.append([nums[first], nums[second], nums[third]])
                }
            }
        }
        return results
    }
}

let f = Solution().threeSum
f([-1, 0, 1, 2, -1, -4])
f([0, 0, 0, 0, 0, 0])
f([0, 0])
