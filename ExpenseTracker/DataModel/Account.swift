import Foundation
class Account {
    var name: String
    var balance: Double
    
    init(name: String, balance: Double) {
        self.name = name
        self.balance = balance
    }
    
    func updateBalance(by amount: Double) {
        self.balance += amount
    }
}
