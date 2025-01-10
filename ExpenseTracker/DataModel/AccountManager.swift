import Foundation
class AccountManager {
    static let shared = AccountManager()
    
    var bankAccounts: [Account]
    
    private init() {
        bankAccounts = [
            Account(name: "SBI", balance: 10000),
            Account(name: "BOB", balance: 10000),
            Account(name: "HDFC", balance: 10000)
        ]
    }
    func getAccountBalance(for index: Int) -> Double? {
        guard index >= 0 && index < bankAccounts.count else { return nil }
        return bankAccounts[index].balance
    }
    
    func getAccountName(for index: Int) -> String? {
        guard index >= 0 && index < bankAccounts.count else { return nil }
        return bankAccounts[index].name
    }
    
    func updateAccountBalance(for index: Int, by amount: Double) -> Bool{
        guard index < bankAccounts.count else { return false }
        let newBalance = bankAccounts[index].balance + amount
        if newBalance < 0 {
            return false
        }
        bankAccounts[index].balance = newBalance
        return true
    }
    
    
}
