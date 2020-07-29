let tags: [Tag] = [.heap, .sort, .ON, .marked]

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if tasks.isEmpty { return 0 }
        var counts = [Character: Int]()
        tasks.forEach { counts[$0, default: 0] += 1 }

        var pq = PriorityQueue<Int>(by: >)
        counts.values.filter { $0 > 0 }.forEach { pq.enqueue($0) }

        var time = 0
        while !pq.isEmpty {
            var rem = [Int]()
            var count = 0
            //: `n+1` tasks per cycle, that is, there's no same tasks in one cycle
            for _ in 0..<n + 1 {
                //: always take the task that remains the most
                //: for a task that was ranked k-th before, it is now ranked k-th **at most**
                //: since the remaining number of it and the tasks before it have all been reduced by 1
                //: thus, the schedule is feasible
                if let task = pq.dequeue() {
                    count += 1
                    if task > 1 { rem.append(task - 1) }
                } else {
                    break
                }
            }
            if rem.isEmpty { //: implies `pq.isEmpty`, the last cycle
                time += count
            } else {
                rem.forEach { pq.enqueue($0) }
                time += n + 1
            }
        }

        return time
    }
}


let f = Solution().leastInterval

f(["A", "A", "A", "A", "B", "B", "C"], 2)
// A, B, C; A, B, _; A, _, _; A;
f(["A", "A", "A", "B", "B", "B"], 0)


class Solution2 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if tasks.isEmpty { return 0 }

        var counts = [Character: Int]()
        tasks.forEach { counts[$0, default: 0] += 1 }
        let sorted = counts.values.filter { $0 > 0 }.sorted(by: >)
        
        let maxCount = sorted.firstIndex { $0 < sorted.first! } ?? sorted.endIndex
        //: all these tasks require full of `sorted.first!` cycles
        let _ = maxCount * sorted.first!
        //: `n+1` tasks per cycle, so there are `blank` time slots remaining
        var blank = (n + 1 - maxCount) * (sorted.first! - 1)
        //: schedule other tasks, note that they all require less than `sorted.first!` cycles
        for count in sorted[maxCount...] {
            blank -= count
        }
        
        //: `blank < 0` implies we need to expand the slots
        return tasks.count + max(0, blank)
    }
}

let g = Solution2().leastInterval

g(["A", "A", "A", "A", "B", "B", "C"], 2)
g(["A", "A", "A", "B", "B", "B"], 0)
