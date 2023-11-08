// create a new account with a deposit of $1000
var newAccount = SwiftBank(password: "insecure_password", initialDeposit: 1000)

// deposit $200
newAccount.makeDeposit(depositAmount: 200)

// withdraw $100 with incorrect password
newAccount.makeWithdrawal(withdrawalAmount: 100, password: "insecur_password")

// withdraw $1250 with correct password
newAccount.makeWithdrawal(withdrawalAmount: 1250, password: "insecure_password")

// check account balance with correct password
newAccount.displayBalance(password: "insecure_password")