class Solution {
    func smallestRepunitDivByK(_ K: Int) -> Int {
        if K.isMultiple(of: 2) || K.isMultiple(of: 5) { return -1 }
        var rem = 0
        //: easy to prove that the answer must exist iff gcd(K, 10) = 1
        for i in 1... {
            rem = (rem * 10 + 1) % K
            if rem == 0 { return i }
        }
        return 666
    }
}
