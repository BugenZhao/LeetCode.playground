let tags: [Tag] = [.binSearch]

class RecentCounter {
    var timeline = [Int]()

    func ping(_ t: Int) -> Int {
        timeline.append(t)
        return timeline.count - timeline.binarySearch { $0 < t - 3000 }
    }
}
