let tags: [Tag] = [.sort]

func test(using f: ([Int]) -> [Int]) -> Bool {
    for _ in 1...20 {
        let array = (1...(1...50).randomElement()!).map { _ in (-50...50).randomElement()! }
        guard f(array) == array.sorted() else { return false }
    }
    return true
}

class SolutionQuick {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums.shuffled()

        func worker(_ lo: Int, _ hi: Int) {
            guard hi - lo + 1 >= 2 else { return }

            let pivot = nums[hi]
            var slow = lo
            for fast in lo...hi {
                if nums[fast] < pivot {
                    nums.swapAt(slow, fast)
                    slow += 1
                }
            }
            nums.swapAt(slow, hi)

            worker(lo, slow - 1)
            worker(slow + 1, hi)
        }

        worker(0, nums.count - 1)
        return nums
    }
}

test(using: SolutionQuick().sortArray)


class SolutionMerge {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        var tmp = nums

        func worker(_ lo: Int, _ hi: Int) {
            switch hi - lo + 1 {
            case 0, 1:
                return
            case 2:
                if nums[lo] > nums[hi] { nums.swapAt(lo, hi) }
            default:
                let mid = lo + (hi - lo) / 2
                worker(lo, mid)
                worker(mid + 1, hi)

                var (i, j) = (lo, mid + 1)
                var cur = lo

                while i <= mid, j <= hi {
                    if nums[i] < nums[j] { tmp[cur] = nums[i]; i += 1 }
                    else { tmp[cur] = nums[j]; j += 1 }
                    cur += 1
                }

                while i <= mid { tmp[cur] = nums[i]; i += 1; cur += 1 }
                while j <= hi  { tmp[cur] = nums[j]; j += 1; cur += 1 }

                nums[lo...hi] = tmp[lo...hi]
            }
        }

        worker(0, nums.count - 1)
        return nums
    }
}

test(using: SolutionMerge().sortArray)
