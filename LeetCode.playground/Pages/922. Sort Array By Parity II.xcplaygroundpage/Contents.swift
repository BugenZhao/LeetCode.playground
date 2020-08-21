let tags: [Tag] = [.sort, .ON]

class Solution {
    func sortArrayByParityII(_ A: [Int]) -> [Int] {
        var A = A
        let N = A.count
        var (even, odd) = (0, 1) //: index
        while even < N, odd < N {
            while even < N, A[even].isMultiple(of: 2) { even += 2 }
            while odd < N, !A[odd].isMultiple(of: 2) { odd += 2 }
            if even < N, odd < N { A.swapAt(even, odd) }
        }
        return A
    }
}


let f = Solution().sortArrayByParityII

f([4, 2, 5, 7])
f([1, 2, 3, 4])
f([])
f([1, 2])
