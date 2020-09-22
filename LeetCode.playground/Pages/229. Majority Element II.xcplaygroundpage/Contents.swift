//: Boyer-Moore Voting Algorithm `> n/3`, see 169 first

let tags: [Tag] = [.array, .ON, .marked]

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        typealias Num = (val: Int?, count: Int)
        var (M, m): (Num, Num) = ((nil, 0), (nil, 0))

        for num in nums {
            if M.val == num {
                M.count += 1
            } else if m.val == num {
                m.count += 1
            } else if M.count == 0 {
                M.val = num
                M.count = 1
            } else if m.count == 0 {
                m.val = num
                m.count = 1
            } else {
                M.count -= 1
                m.count -= 1
            }
        }

        M.count = nums.filter { $0 == M.val }.count
        m.count = nums.filter { $0 == m.val }.count
        return [M, m].filter { $0.count > nums.count / 3 }.compactMap { $0.val }
    }
}

let f = Solution().majorityElement

f([3, 2, 3])
f([1, 1, 1, 3, 3, 2, 2, 2])
f([1, 2, 2, 3, 2, 1, 1, 3])
