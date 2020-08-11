let tags: [Tag] = [.twoPtrs]

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1 = nums1.sorted()
        let nums2 = nums2.sorted()

        var (i, j) = (0, 0)
        var results = [Int]()
        while i < nums1.endIndex, j < nums2.endIndex {
            if nums1[i] == nums2[j] {
                results.append(nums1[i])
                i += 1; j += 1
            } else if nums1[i] > nums2[j] {
                j += 1
            } else {
                i += 1
            }
        }
        return results
    }
}

Solution().intersect([1, 2, 2, 1], [2, 2])
