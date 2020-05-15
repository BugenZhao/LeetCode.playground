let tags: [Tag] = [.dp]

class Solution {
    func maxSubarraySumCircular(_ A: [Int]) -> Int {
        guard !A.isEmpty else { return 0 }
        var sum = A[0]
        var dpMax = [Int](repeating: 0, count: A.count)
        var dpMin = [Int](repeating: 0, count: A.count)
        //: `dpMax[i]`: maximal sum of subarray ending up with the i-th char (continuous array)
        //: `dpMin[i]`: minimal sum of subarray ending up with the i-th char (whose complement is also valid in circular array)

        dpMax[0] = A[0] //: take at least one element
        dpMin[0] = min(A[0], 0) //: take at most all elements

        for i in 1..<A.count {
            //: append `nums[i]`, or drop all
            dpMax[i] = max(dpMax[i - 1] + A[i], A[i])
            dpMin[i] = min(dpMin[i - 1] + A[i], A[i])
            sum += A[i]
        }

        let continuous = dpMax.max()!
        let others = sum - dpMin.min()!
        
        return others == 0 ?
               continuous: //: `dpMin` takes all => complement takes none => not allowed
               max(continuous, others)
    }
}

let f = Solution().maxSubarraySumCircular

f([1, -2, 3, -2])
f([5, -3, 5])
f([-1, -2, -3])
f([3, -1, 2, -1])
