let tags: [Tag] = [.dp, .dq, .ON]

class SolutionDP {
    func maxProduct(_ nums: [Int]) -> Int {
        var (currMax, currMin) = (nums[0], nums[0]) //: max/min product ending up with current number
        var ans = currMax
        for num in nums.dropFirst() {
            (currMax, currMin) = (max(num, currMax * num, currMin * num),
                                  min(num, currMax * num, currMin * num))
            ans = max(ans, currMax)
        }
        return ans
    }
}

SolutionDP().maxProduct([2, 3, -2, 4])


class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        func walk<T>(_ nums: T) -> (max: Int, min: Int) where T: Sequence, T.Element == Int {
            var prod = 1; var ans = (Int.min, Int.max)
            for num in nums {
                prod *= num
                ans = (max(ans.0, prod), min(ans.1, prod))
            }
            return ans
        }

        func worker(_ nums: ArraySlice<Int>) -> Int {
            if nums.count == 1 { return nums.first! }

            let mid = nums.index(nums.startIndex, offsetBy: (nums.endIndex - nums.startIndex) / 2)
            let leftAns = worker(nums[..<mid])
            let rightAns = worker(nums[mid...])

            let leftWalk = walk(nums[..<mid].reversed())
            let rightWalk = walk(nums[mid...])

            return max(leftAns, rightAns, leftWalk.0 * rightWalk.0, leftWalk.1 * rightWalk.1)
        }

        return worker(nums[...])
    }
}

let f = Solution().maxProduct

f([2, 3, -2, 4])
