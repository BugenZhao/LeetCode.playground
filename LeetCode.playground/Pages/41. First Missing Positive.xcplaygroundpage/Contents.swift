let tags: [Tag] = [.array, .marked]

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 1 }
        var nums = nums
        for i in nums.indices {
            //: note that the answer must be in `{1,2,...,count,count+1}`
            //: swap every number to its right place (`[1,2,3,...]`)
            while 1...nums.count ~= nums[i], nums[i] != nums[nums[i] - 1] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        print(nums)
        return (nums.indices.first { nums[$0] != $0 + 1 } ?? nums.endIndex) + 1 //: find the first incorrect one
    }
}


let f = Solution().firstMissingPositive

f([1, 2, 0])
f([0, 1, 2])
f([1, 2, 3])
f([5, 6, 7])
f([1, 1])
f([])
