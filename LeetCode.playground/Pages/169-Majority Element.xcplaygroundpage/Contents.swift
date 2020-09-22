//: Boyer-Moore Voting Algorithm
//: imagining that there is an **arena challenge**, the one whose count of occurrence is `> n/2` will beat all the other candidates

let tags: [Tag] = [.array, .ON]

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var ans = nums.first! // Stack top
        var count = 0         // Stack count
        nums.forEach { num in
            if count == 0 { ans = num; count = 1 } // Stack's empty
            else if ans == num { count += 1 }      // Push
            else { count -= 1 }                    // Pop
        }
        return ans
    }
}

let f = Solution().majorityElement

f([3, 2, 3])
f([2, 2, 1, 1, 1, 2, 2])
f([1, 2, 2])
f([8, 8, 8, 8, 1, 1, 1])
