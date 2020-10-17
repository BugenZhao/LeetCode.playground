class Fancy {
    let mod = 10_0000_0007
    
    var arr = [Int]()
    var (a, b) = (1, 0)
    
    func power(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return 1 }
        if b == 1 { return a % mod }
        if a == 1 { return 1 }
        
        let t = power(a, b / 2)
        return (b.isMultiple(of: 2) ? t * t : t * t % mod * a) % mod
    }

    init() {
        
    }
    
    func append(_ val: Int) {
        let x = ((val - b) % mod + mod) % mod
        let y = x * power(a, mod - 2) % mod
        arr.append(y)
    }
    
    func addAll(_ inc: Int) {
        b = (b + inc) % mod
    }
    
    func multAll(_ m: Int) {
        a = (a * m) % mod
        b = (b * m) % mod
    }
    
    func getIndex(_ idx: Int) -> Int {
        return arr.indices ~= idx ? (arr[idx] * a + b) % mod : -1
    }
}
