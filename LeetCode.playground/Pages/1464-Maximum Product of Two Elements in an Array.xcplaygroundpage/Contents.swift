let tags: [Tag] = [.math]

class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var (MAX, max) = (0, 0)
        for num in nums {
            switch num {
            case MAX...:
                (MAX, max) = (num, MAX)
            case max...:
                (MAX, max) = (MAX, num)
            default:
                break
            }
        }
        return (MAX - 1) * (max - 1)
    }
}

Solution().maxProduct([3, 4, 5, 2])
