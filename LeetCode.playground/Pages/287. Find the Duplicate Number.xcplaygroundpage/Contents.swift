let tags: [Tag] = [.binSearch, .twoPtrs, .working]

class SolutionBS {
    func findDuplicate(_ nums: [Int]) -> Int {
        //: `cnt[i]`: # of numbers that are less or equal to `i`
        //: find the first `i` where `cnt[i] > i`
        return (1..<nums.count).binarySearch { i in
            let cnt = nums.filter { $0 <= i }.count
            return cnt <= i
        }
    }
}

let f = SolutionBS().findDuplicate

f([1, 3, 4, 2, 2])
f([1, 2, 2, 2, 2])
