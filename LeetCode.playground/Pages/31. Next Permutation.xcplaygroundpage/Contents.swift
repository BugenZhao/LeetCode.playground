let tags: [Tag] = [.sort, .ON, .binSearch]

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // a   b   e   d   c
        //   +   +   -   -
        //    *l          *m
        
        //: find the last ascending index  `l`
        //: if none, the permutation is already the last one; otherwise, the subarray after `l` are descending
        guard let l = nums.indices.dropLast().last(where: { nums[$0] < nums[$0 + 1] }) else { nums.reverse(); return }
        //: find the number from the subarray which is the successor of `nums[l]`, say at index `m`
        let m = nums[(l + 1)...].binarySearch { $0 > nums[l] } - 1
        //: put `nums[m]` to index `l` and sort (just **reverse**) the rest ones
        nums.swapAt(l, m)
        nums[(l + 1)...].reverse()
    }
}

let f = Solution().nextPermutation

var list = [1, 2, 5, 4, 3]
f(&list)

var list2 = [4, 3, 2, 1]
for _ in 0..<24 {
    f(&list2)
    print(list2)
}
