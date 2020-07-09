class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        var w = Int(Double(area).squareRoot())
        while !area.isMultiple(of: w) { w -= 1 }
        return [area / w, w]
    }
}

Solution().constructRectangle(24)
