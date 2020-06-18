let tags: [Tag] = [.greedy, .marked]

extension Array where Element == Int {
    var deadline: Int { self[1] }
    var duration: Int { self[0] }
}

class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        let courses = courses.sorted(by: { $0.deadline < $1.deadline })
        var pq = PriorityQueue<Int>(by: { $0 > $1 })
        var current = 0
        
        for course in courses {
            //: take it
            pq.enqueue(course.duration)
            current += course.duration
            //: if the deadline is exceeded, then we have to drop one
            //: note that we are sure to succeed, since the top of `pq` is no less than `course.duration`
            if current > course.deadline {
                current -= pq.dequeue()!
            }
        }
        return pq.count
    }
}
