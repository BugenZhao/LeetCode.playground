let tags: [Tag] = [.stack, .ON, .marked]

class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        var mins = nums
        for i in mins.indices.dropFirst() {
            mins[i] = min(mins[i], mins[i - 1])
        }

        var stack = [Int]() //: monotonically decreasing stack
        for (num, currMin) in zip(nums, mins).reversed() {
            // currMin  --- 1
            // num      --- 3
            // stackTop --- 2
            while !stack.isEmpty, stack.last! <= currMin {
                stack.popLast() //: pop all non-candidates of `2`
            }
            if stack.isEmpty || num <= stack.last! {
                stack.append(num) //: not a `3`, push to stack
            } else {
                return true //: got a `3`
            }
        }

        return false
    }
}


Solution().find132pattern([1, 0, 1, -4, -3])
Solution().find132pattern([1, 1, 1, 9, 10, 2])
