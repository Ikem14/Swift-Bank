// Swift Bank struct
struct SwiftBank {
  // password and balance variables
  private let password: String
  private var balance: Double = 0.0 {
    willSet(newBalance) {
      if newBalance < 100 {
        lowBalanceAlert(balance: newBalance)
      }
    }
  }
  // variables for bonus rate
  static let depositBonusRate = 0.01
  private var hasBonusRate = false
  // static constants for error messages
  static private let passwordError = "Error: Invalid password. Cannot retrieve balance"
  static private let amountError = "Error: For deposits, amount has to be greater than zero. For withdrawals, amount has to be greater than zero and less than or equal to your current balance."

  // SwiftBank initializer
  init(password: String, initialDeposit: Double) {
    // initial deposit must be equal to or greater than $10
    if initialDeposit < 10 {
      print("Error: Intial deposit must have a value equal to or greater than $10. Your current initial deposit has a value of $\(initialDeposit)")
    }
    self.password = password
    makeDeposit(depositAmount: initialDeposit)
  }

  // private method to check if password is valid
  private func isValid(enteredPassword: String) -> Bool {
    if self.password == enteredPassword {
      return true
    } 
    return false
  }

  // private method to calculate final deposit amount with bonus
  private func finalDepositWithBonus(deposit: Double) -> Double {
    return deposit + (deposit * SwiftBank.depositBonusRate)
  }

  // internal method for making deposits
  // a user can only get a bonus once with a deposit of $1000 or more.
  mutating func makeDeposit(depositAmount: Double) {
    // check if deposit amount is valid
    if(depositAmount <= 0) {
      print(SwiftBank.amountError)
      return
    } // check if deposit amount is greater than or equal to $1000 and if user has already received a bonus
    else if depositAmount >= 1000 && !self.hasBonusRate {
      let depositWithBonus = finalDepositWithBonus(deposit: depositAmount)

      print("Since this is your first time making a deposit of $1000 or more, you will receive a bonus rate of %\(SwiftBank.depositBonusRate * 100). The final amount deposited is $\(depositWithBonus).")
      self.balance += depositWithBonus
      self.hasBonusRate = true
    } else {
      print("Making a deposit of $\(depositAmount).")
      self.balance += depositAmount
    }
  }

  // internal method for displaying balance
  func displayBalance(password: String) {
    if !isValid(enteredPassword: password) {
      print(SwiftBank.passwordError)
      return
    }
    print("Your current balance is $\(balance)")
  }

  // internal method for making withdrawals
  mutating func makeWithdrawal(withdrawalAmount: Double, password: String) {
    // check if password is valid
    if !isValid(enteredPassword: password) {
      print(SwiftBank.passwordError)
      return
    }
    // check if withdrawal amount is valid
    if(withdrawalAmount <= 0 || withdrawalAmount > self.balance) {
      print(SwiftBank.amountError)
      return
    }
    print("Making a withdrawal of \(withdrawalAmount)")
    self.balance -= withdrawalAmount
    print("Final account balance is \(self.balance)")
  }

  // private method for low balance alert
  private func lowBalanceAlert(balance: Double) {
    print("Alert: Your balance is very low at $\(balance)")
  }
}