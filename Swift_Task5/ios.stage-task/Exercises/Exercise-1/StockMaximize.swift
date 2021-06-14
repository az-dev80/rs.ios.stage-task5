import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
       // let result = prices.contains { (price) -> Bool in
        //    price == prices.max() }
        
        if prices.isEmpty || prices.count == 1 || (prices.count == 2 && prices[0] == prices.max()) || prices.sorted(by: >) == prices {
            return 0
        }
        var prices = prices
        var result = 0
        for price in 0 ... prices.max()! {
            while prices.count > 0 {
            result = result + (prices.max()! - prices[price])
            prices.removeFirst()
            }
        }
        return result
    }
}
