class Solution {
    func numTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let (m, n) = (nums1.count, nums2.count)
        var occ1 = [Int: Int](); var occ2 = occ1
        for num in nums1 { occ1[num * num, default: 0] += 1 }
        for num in nums2 { occ2[num * num, default: 0] += 1 }
        
        var ans = 0
        for i in 0..<m {
            for j in (i+1)..<m {
                ans += occ2[nums1[i] * nums1[j]] ?? 0
            }
        }
        for i in 0..<n {
            for j in (i+1)..<n {
                ans += occ1[nums2[i] * nums2[j]] ?? 0
            }
        }
        return ans
    }
}
