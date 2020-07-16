class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let a = Double((minutes * 6) % 360)
        var b = (Double(hour) + Double(minutes) / 60) * 30
        b = b >= 360 ? b - 360: b
        let d = abs(a - b)
        return d <= 180 ? d : 360 - d
    }
}

let f = Solution().angleClock

f(3, 15)
f(4, 50)
f(12, 0)
f(6, 0)
