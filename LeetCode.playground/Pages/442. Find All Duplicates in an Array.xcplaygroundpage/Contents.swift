let tags: [Tag] = [.array, .ON]

class Solution {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var ans = [Int]()
        for num in nums {
            let index = abs(num) - 1
            if nums[index] < 0 { ans.append(num) }
            nums[index].negate()
        }
        return ans
    }
}

Solution().findDuplicates([1, 2, 2, 2, 3, 4, 4])
