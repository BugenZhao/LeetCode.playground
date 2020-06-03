/*:
 ### Find the median in two sorted arrays
 - Key idea: **Binary Search**, try to exclude half of numbers each operation
 - Write a method to find the `k`-th number in two sorted arrays
    - If `A[k/2] < B[k/2]`, then none of the numbers in `A[...k/2]` can be the `k`-th one
    - If there are no enough numbers in `A`, just test `A.last!`
 
 1. ![1](1.png)
 2. ![2](2.png)
 3. ![3](3.png)
 4. ![4](4.png)
 */
let tags: [Tag] = [.array, .binSearch, .marked]
//: Naive, exclude one number each operation
class SolutionNaive {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var (i, j) = (0, 0)
        var nums = [Int]()

        while true {
            if i < nums1.count && j < nums2.count {
                if nums1[i] < nums2[j] { nums.append(nums1[i]); i += 1 }
                else { nums.append(nums2[j]); j += 1 }
            } else if i < nums1.count {
                nums.append(nums1[i]); i += 1
            } else if j < nums2.count {
                nums.append(nums2[j]); j += 1
            } else {
                break
            }
        }

        return Double((nums[nums.count / 2] + nums[(nums.count - 1) / 2])) / 2.0
    }
}


let f = SolutionNaive().findMedianSortedArrays

f([1, 3], [2])
f([1, 3], [2, 4])

//: Binary Search, try to exclude half of numbers each operation
class Solution {
    //: find the `k`-th number in `A` and `B`, `k = 1,2,...`
    func findKth(k: Int, _ A: ArraySlice<Int>, _ B: ArraySlice<Int>) -> Int {
        if A.count > B.count { //: ensure that `A` is shorter
            return findKth(k: k, B, A)
        } else if A.count == 0 { //: just find the `k`-th one in `B`
            return B[B.index(B.startIndex, offsetBy: k - 1)]
        } else if k == 1 { //: get the first one
            return min(A.first!, B.first!)
        } else {
            //: try to exclude `k/2` numbers (or exclude all from some array)
            let ri = min(k / 2, A.count) - 1
            let rj = min(k / 2, B.count) - 1
            let i = A.index(A.startIndex, offsetBy: ri)
            let j = B.index(B.startIndex, offsetBy: rj)
            if A[i] < B[j] { //: `A[k/2]` is smaller, thus, all of the first `k/2` elements in `A` can be excluded
                return findKth(k: k - ri - 1, A[(i + 1)...], B)
            } else { //: `B[k/2]` is smaller, thus, all of the first `k/2` elements in `B` can be excluded
                return findKth(k: k - rj - 1, A, B[(j + 1)...])
            }
        }
    }

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        return Double(
            findKth(k: (nums1.count + nums2.count + 1) / 2, nums1[0...], nums2[0...]) +
            findKth(k: (nums1.count + nums2.count + 2) / 2, nums1[0...], nums2[0...])
        ) / 2.0
    }
}

let g = Solution().findMedianSortedArrays

let arr = (1...100).map { $0 }.shuffled()
let A = arr[0..<50].sorted(); let B = arr[50...].sorted()
A
B
g(A, B) == 50.5

g([1, 3], [2])
g([1, 3], [2, 4])
g([], [1])
g([1, 2], [])

//: Debugging...
let findKth = Solution().findKth
for _ in 1...5 {
    let arr = (1...100).map { $0 }.shuffled()
    let A = arr[0..<50].sorted(); let B = arr[50...].sorted()
    (1...100).forEach { assert(findKth($0, A[0...], B[0...]) == $0) }
}
