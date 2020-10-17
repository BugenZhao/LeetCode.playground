class Solution {
    func trimMean(_ arr: [Int]) -> Double {
        var arr = arr.sorted()
        let N = arr.count
        arr.removeFirst(N / 20)
        arr.removeLast(N / 20)
        return Double(arr.reduce(0, +)) / Double(arr.count)
    }
}
