let tags: [Tag] = [.twoPtrs, .greedy]

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        var (lo, hi) = (0, height.count - 1)
        while lo < hi {
            area = max(area, (hi - lo) * min(height[lo], height[hi]))
            if height[lo] < height[hi] { lo += 1 } //: easy to see that there's no need to check `(lo, hi - i)`...
            else { hi -= 1 }
        }
        return area
    }
}

Solution().maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])
