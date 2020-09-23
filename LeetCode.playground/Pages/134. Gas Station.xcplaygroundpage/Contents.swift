/*:
 Let `d = gas - cost`, suppose `D_i = d_0 + d_1 + ... + d_i` is the smallest partial sum,
 we prove that `i+1` is an answer iff `D_(n-1) >= 0`.
 
 Since `D_i` is the smallest, then `D_(i+1) - D_i = d_(i+1) >= 0`, the same reasoning,
 `d_(i+1) >= 0`,
 `d_(i+1) + d_(i+2) >= 0`,
 ...
 `d_(i+1) + ... + d_(n-1) >= 0`.
 
 Note that, for `j` in `{0, 1, ... i}` we have
 `d_(i+1) + ... + d_(n-1) + d_0 + d_1 + ... + d_j` >=
 `d_(i+1) + ... + d_(n-1) + d_0 + d_1 + ... + d_i`  [according to the smallest property] `= D_(n-1) >= 0`
 
 Therefore, `i+1` is an answer.
 */

let tags: [Tag] = [.ON, .marked]

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let d = zip(gas, cost).map{ $0 - $1 }
        let D = d.reduce(into: [0]){ res, i in res.append(i + res.last!) }
        if D.last! < 0 { return -1 } //: total sum
        return D.indices.dropFirst().min(by: { i, j in D[i] < D[j] })! % gas.count
    }
}
