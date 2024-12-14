import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

class BankAccount {
    
    var balance: Int = 100
    
    let firstQueue = DispatchQueue.global()
    let secondQueue = DispatchQueue.global()
    let nslock = NSLock()
    let group = DispatchGroup()
    
    
    func deposit(){
        group.enter()
        secondQueue.async {
            self.nslock.lock()
            self.balance += 1
            self.nslock.unlock()
            self.group.leave()
        }
    }
    
    func withraw(){
        group.enter()
        firstQueue.async {
            self.nslock.lock()
            self.balance -= 1
            self.nslock.unlock()
            self.group.leave()
        }
    }
    
    
    func printBalance(){
        group.notify(queue: .main) {print(self.balance)}
    }
}
    
    let bankAcc = BankAccount()
    for i in 1...1000{
        bankAcc.deposit()
    }
    for i in 1...1000{
        bankAcc.withraw()
    }
    bankAcc.printBalance()

