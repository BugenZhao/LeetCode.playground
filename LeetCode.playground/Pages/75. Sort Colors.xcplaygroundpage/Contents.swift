let tags: [Tag] = [.array, .twoPtrs]

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var put0 = nums.startIndex
        var put2 = nums.endIndex - 1
        var cur = nums.startIndex
        while cur <= put2 {
            switch nums[cur] {
            case 0:
                nums.swapAt(put0, cur); put0 += 1
                cur += 1 //: `cur` increase, since the left ones must be 0
            case 2:
                nums.swapAt(put2, cur); put2 -= 1
                //: `cur` won't increase, may check again
            default:
                cur += 1
            }
        }
    }
}

var nums = [2, 0, 2, 1, 1, 0]
Solution().sortColors(&nums)
