import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        func calculating(p: Int, array: [Supply]) -> [[Int]] {
                    let n = array.count
                    var table = Array(repeating: Array(repeating: 0,count: p+1), count: n+1)
                    for i in 0..<n+1 {
                        for j in 0..<p+1 {
                            if i == 0 || j == 0 {
                                table[i][j] = 0
                            } else if array[i-1].weight<=j {
                                table[i][j] = max(array[i-1].value + table[i-1][j-array[i-1].weight],
                                              table[i-1][j])
                            } else {
                                table[i][j] = table[i-1][j]
                            }
                        }
                    }
                    
                    return table
                }
                let food = calculating(p: maxWeight, array: foods)[calculating(p: maxWeight, array: foods).count-1]
                let drink = calculating(p: maxWeight, array: drinks)[calculating(p: maxWeight, array: drinks).count-1]
                var resultArray = [Int]()
                
                for i in 0..<food.count {
                    if food[i]<drink[drink.count-1-i] {
                        resultArray.append(food[i])
                    } else {
                        resultArray.append(drink[drink.count-1-i])
                    }
                }
                return resultArray.max()!
            }
    }

