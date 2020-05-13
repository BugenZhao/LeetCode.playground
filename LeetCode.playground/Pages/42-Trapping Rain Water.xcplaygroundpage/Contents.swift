/*:
 ### What is monotonic stack?
 
 A monotonically decreasing stack means that, every time a new element comes, we have to `pop()` until we find a bigger stack top than the elment itself.
 
 Thus, the stack will always be monotonically decreasing.
 
 ![Figure](42.png width="500")
 */
let tags: [Tag] = [.stack, .marked]

class SolutionMonotonicStack {
    func trap(_ height: [Int]) -> Int {
        var stack = [(pos: Int, height: Int)]()
        var ans = 0

        for (curPos, curHeight) in height.enumerated() {
            while !stack.isEmpty, stack.last!.height < curHeight {
                let lo = stack.popLast()! //: low place
                guard let left = stack.last else { break } //: get left boundary
                ans += (curPos - left.pos - 1) * (min(curHeight, left.height) - lo.height)
            }
            stack.append((curPos, curHeight))
        }

        return ans
    }
}


let f = SolutionMonotonicStack().trap

f([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
f([0, 1, 0])
f([2, 1, 0, 5])



class SolutionSidesToMid {
    func trap(_ height: [Int]) -> Int {
        guard let (maxPos, _) = height.enumerated().max(by: { $0.element < $1.element })
            else { return 0 } //: find the highest pos
        var ans = 0

        var maxLeftHeight = 0 //: left side => no need to care about the right boundarty
        for h in height[..<maxPos] {
            if maxLeftHeight > h { ans += maxLeftHeight - h }
            else { maxLeftHeight = h }
        }
        var maxRightHeight = 0 //: right side => no need to care about the left boundarty
        for h in height[maxPos...].reversed() {
            if maxRightHeight > h { ans += maxRightHeight - h }
            else { maxRightHeight = h }
        }

        return ans
    }
}


let g = SolutionSidesToMid().trap

g([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
g([0, 1, 0])
g([2, 1, 0, 5])
g([2, 1, 0, 2])
