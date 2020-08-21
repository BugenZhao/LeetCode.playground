let tags: [Tag] = [.sort, .ON]

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var A = A
        var slow = A.startIndex
        for (fast, elem) in A.enumerated() where elem.isMultiple(of: 2) {
            A.swapAt(slow, fast); slow += 1
        }
        return A
    }
}

let f = Solution().sortArrayByParity

f([3, 1, 2, 4])
f([1, 3, 5, 7])
f([2, 4, 6, 8])
f([1])
f([])
