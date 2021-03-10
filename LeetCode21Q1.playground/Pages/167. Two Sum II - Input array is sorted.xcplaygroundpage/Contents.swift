let tags: [Tag] = [.binSearch, .twoPtrs]

extension RandomAccessCollection {
    func myBinarySearch(p: (Element) -> Bool) -> Index {
        var lo = self.startIndex
        var hi = self.endIndex

        while lo != hi {
            let mid = self.index(lo, offsetBy: self.distance(from: lo, to: hi) / 2)
            if p(self[mid]) { lo = self.index(after: mid) }
            else { hi = mid }
        }

        return lo
    }
}

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var lo = numbers.startIndex
        var hi = numbers.endIndex - 1
        while true {
            let sum = numbers[lo] + numbers[hi]
            if sum == target {
                return [lo + 1, hi + 1]
            } else if sum < target {
                let range = lo...hi
                let newLoIdx = range.myBinarySearch { i in numbers[i] + numbers[hi] < target }
                lo = range[newLoIdx]
            } else {
                let range = (lo...hi).reversed()
                let newHiIdx = range.myBinarySearch { i in numbers[lo] + numbers[i] > target }
                hi = range[newHiIdx]
            }
        }
    }
}
