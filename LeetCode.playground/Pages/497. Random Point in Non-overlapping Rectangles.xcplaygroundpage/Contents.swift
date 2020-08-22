let tags: [Tag] = [.binSearch]

final class Solution {
    let rects: [[Int]]
    let accu: [Int]

    init(_ rects: [[Int]]) {
        self.rects = rects
        let areas = rects.map { ($0[2] - $0[0] + 1) * ($0[3] - $0[1] + 1) }
        self.accu = areas.reduce(into: []) { arr, area in arr.append((arr.last ?? 0) + area) }
    }

    func pick() -> [Int] {
        let rand = (0..<accu.last!).randomElement()!
        let index = accu.binarySearch { rand >= $0 }
        let rect = rects[index]
        return [(rect[0]...rect[2]).randomElement()!, (rect[1]...rect[3]).randomElement()!]
    }
}

let f = Solution([[-2, -2, -1, -1], [1, 0, 3, 0]]).pick

(1...100).map { _ in
    f()
}
