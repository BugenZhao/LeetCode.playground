import Foundation

class Solution {
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        let ma = nums.max()!
        let idx = (1...ma).binarySearch { div in
            nums.map{ Int(ceil(Double($0)/Double(div))) }.reduce(0, +) > threshold
        }
        return (1...ma)[idx]
    }
}
