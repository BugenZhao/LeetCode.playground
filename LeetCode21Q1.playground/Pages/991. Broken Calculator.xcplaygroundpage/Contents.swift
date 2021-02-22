let tags: [Tag] = [.greedy]

class Solution {
    func brokenCalc(_ X: Int, _ Y: Int) -> Int {
        var Y = Y
        var count = 0
        while Y > X {
            if Y.isMultiple(of: 2) { Y /= 2 } //: prefer /2
            else { Y = Y + 1 }
            count += 1
        }
        count += (X - Y)
        return count
    }
}
