let tags: [Tag] = [.bit, .ON]

class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let xor = nums.reduce(0, ^)
        //: get the lsb which is set, thus nums can be divided into two parts and one answer resides in one part
        let lsb = xor & (-xor)
        return [nums.filter { $0 & lsb != 0 }.reduce(0, ^),
                nums.filter { $0 & lsb == 0 }.reduce(0, ^)]
    }
}

let f = Solution().singleNumber

f([1, 2, 1, 3, 2, 5])
f([1, 1, 2, 3])
