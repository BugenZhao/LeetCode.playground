/*:
 For M, N with M`(a,x)`, N`(b,y)`:
 - If M goes to A, N goes to B: `cost = a + y`
 - If M goes to B, N goes to A: `cost = x + b`
 
 Then, if `a + y < x + b`, i.e., `a - x < b - y`, we should fly M to A. Thus, sort the array.
 */

let tags: [Tag] = [.greedy]

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let costs = costs.sorted(by: { lhs, rhs in lhs[0] - lhs[1] < rhs[0] - rhs[1] })
        return costs[..<(costs.count / 2)].map { $0[0] }.reduce(0, +)
             + costs[(costs.count / 2)...].map { $0[1] }.reduce(0, +)
    }
}

Solution().twoCitySchedCost([[10, 20], [30, 200], [400, 50], [30, 20]])
