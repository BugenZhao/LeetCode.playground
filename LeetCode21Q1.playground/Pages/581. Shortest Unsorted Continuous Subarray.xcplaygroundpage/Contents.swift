let tags: [Tag] = [.ON, .stack]

class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var (lo, hi) = (nums.first!, nums.last!);

        {
            var bad = false
            for (last, n) in zip(nums, nums.dropFirst()) {
                if n < last { bad = true }
                if bad { lo = min(lo, n) }
            }
        }();
        {
            var bad = false
            for (n, last) in zip(nums, nums.dropFirst()).reversed() {
                if n > last { bad = true }
                if bad { hi = max(hi, n) }
            }
        }();

        let l = nums.indices.first { nums[$0] > lo } ?? nums.count
        let r = nums.indices.last  { nums[$0] < hi } ?? -1
        return r > l ? r - l + 1: 0
    }
}

Solution().findUnsortedSubarray(
    [1, 3, 2, 4, 5])
