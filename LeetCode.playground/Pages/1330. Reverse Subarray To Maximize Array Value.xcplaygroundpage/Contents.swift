/*:
 `x, ..., a, [b, ..., c], d, ..., y` => `x, ..., a, [c, ..., b], d, ..., y`
 
 `delta = -[abs(a-b)+abs(c-d)] + [abs(a-c)+abs(b-d)]`
 
 Note that `abs(a-b) = max(a,b) - min(a,b)`. Consider two intervals `min(a,b)...max(a,b)` and  `min(c,d)...max(c,d)`, we can find that only in such case the `delta` will be non-negative:
 
 ![1330](1330.png)
 
 `delta` is 2 times the length of the yellow line. So we only need to find `b` and `c` to maximize the yellow line.
 */

let tags: [Tag] = [.math, .ON, .marked]

class Solution {
    func maxValueAfterReverse(_ nums: [Int]) -> Int {
        let value = zip(nums, nums.dropFirst()).map { abs($0 - $1) }.reduce(0, +)

        let lo = zip(nums, nums.dropFirst()).map { a, b in max(a, b) }.min()!
        let hi = zip(nums, nums.dropFirst()).map { c, d in min(c, d) }.max()!
        
        //: boundary situations
        let fromFirst = zip(nums, nums.dropFirst()).map { c, d in abs(nums.first! - d) - abs(c - d) }.max()!
        let toLast = zip(nums, nums.dropFirst()).map { a, b in abs(nums.last! - a) - abs(b - a) }.max()!
        
        return value + max((hi - lo) * 2, fromFirst, toLast)
    }
}
