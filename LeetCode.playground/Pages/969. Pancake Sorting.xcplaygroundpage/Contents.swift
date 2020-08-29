let tags: [Tag] = [.sort]

class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        var A = A
        var ans = [Int]()
        for i in (1...A.count).reversed() {
            let prefix = A.prefix(i)
            let maxi = prefix.max()! //: like bubble sort
            let idx = prefix.firstIndex(of: maxi)!
            ans.append(idx + 1)
            A[0...idx].reverse()
            ans.append(maxi)
            A[0..<maxi].reverse()
        }
        return ans
    }
}


Solution().pancakeSort([3, 2, 4, 1])
