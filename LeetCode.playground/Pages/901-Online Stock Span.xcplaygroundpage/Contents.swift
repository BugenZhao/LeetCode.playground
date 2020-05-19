/*:
 ![901](901.png width="500")
 */
class StockSpanner {
    var mono = 1
    var history = [(price: Int, span: Int)]()

    func next(_ price: Int) -> Int {
        var span = 1
        defer { history.append((price, span)) }

        var last = history.count - 1
        //: backtrack, until we find a higher price
        while last >= 0, history[last].price <= price {
            span += history[last].span
            last -= history[last].span
        }

        return span
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */

let s = StockSpanner()
let answers = [100, 80, 60, 70, 60, 75, 85].map {
    s.next($0)
}
