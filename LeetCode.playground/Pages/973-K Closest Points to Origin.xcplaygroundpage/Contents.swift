let tags: [Tag] = [.sort]

extension Array where Element: Numeric {
    var norm: Element {
        return self[0] * self[0] + self[1] * self[1]
    }
}

class SolutionNaive {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        return [[Int]](points.sorted(by: { $0.norm < $1.norm })[0..<K])
    }
}

SolutionNaive().kClosest([[1, 3], [-2, 2]], 1)
SolutionNaive().kClosest([[3, 3], [5, -1], [-2, 4]], 2)



class SolutionQuickSort {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var points = points
        func kSelect(_ left: Int, _ right: Int) {
            if left >= right { return }

            let pivot = points[right]
            var slow = left
            for fast in left..<right {
                if points[fast].norm < pivot.norm {
                    points.swapAt(slow, fast)
                    slow += 1
                }
            }
            points.swapAt(slow, right)
            kSelect(left, slow - 1)
            if slow < K { kSelect(slow + 1, right) }
        }

        kSelect(0, points.count - 1)
        return [[Int]](points[..<K])
    }
}


SolutionQuickSort().kClosest([[1, 3], [-2, 2]], 1)
SolutionQuickSort().kClosest([[3, 3], [5, -1], [-2, 4]], 2)

let array = (1...100).map { [$0, $0] }.shuffled()
SolutionQuickSort().kClosest(array, 10)
