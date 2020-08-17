class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let arr = arr.sorted()
        let zarr = zip(arr, arr.dropFirst())
        let min = zarr.map { $1 - $0 }.min()
        return zarr.filter { $1 - $0 == min }.map { [$0, $1] }
    }
}

Solution().minimumAbsDifference([3, 8, -10, 23, 19, -4, -14, 27])
