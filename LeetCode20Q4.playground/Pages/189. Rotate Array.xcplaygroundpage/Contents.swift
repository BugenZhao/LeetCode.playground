let tags: [Tag] = [.array, .ON, .marked]

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        nums.reverse()
        nums[..<k].reverse()
        nums[k...].reverse()
    }
}


var nums = [1, 2, 3, 4, 5, 6, 7]
Solution().rotate(&nums, 10)
