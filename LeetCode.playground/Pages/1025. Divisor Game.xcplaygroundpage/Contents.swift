let tags: [Tag] = [.math]

class Solution {
    func divisorGame(_ N: Int) -> Bool {
        //: one with an even `N` can always choose `x = 1` to turn it to be odd
        return N.isMultiple(of: 2)
    }
}
