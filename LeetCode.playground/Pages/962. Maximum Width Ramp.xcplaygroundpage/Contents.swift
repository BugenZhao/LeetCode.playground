//: Monotonic stack

let tags: [Tag] = [.stack, .marked, .twoPtrs]

class Solution {
    func maxWidthRamp(_ A: [Int]) -> Int {
        var mono = [Int]()
        //: construct a monotonic decreasing sequence starting from` A[0]`
        //: we can prove that the sequence must contain the lower end of the max-width ramp
        //: since every elements on the left of the end is larger than it
        for i in A.indices {
            if mono.isEmpty || A[i] < A[mono.last!] { mono.append(i) }
        }

        var ans = 0
        //: find the higher end in reversed order
        for j in A.indices.reversed() {
            while !mono.isEmpty, A[mono.last!] <= A[j] {
                ans = max(ans, j - mono.last!)
                mono.removeLast() //: we have obtained the best result whose lower end is at `mono.last`
            }
        }
        return ans
    }
}


let f = Solution().maxWidthRamp

f([6, 0, 8, 2, 1, 5])
f([9, 8, 1, 0, 1, 9, 4, 0, 4, 1])
