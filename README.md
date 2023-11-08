# Swift Bank
## Introduction
Swift Bank is a simple bank account program written using the Swift programming language that showcases Swift's access control capabilities.

The program allows users to create a new account with a password and initial deposit. 

Users can make deposits and withdrawals(within reasonable contraint), and check their account balance. 

Users will receive a bonus rate of 1% on their first deposit of $1000 or more.

## Examples
### Running below code snippet:
```
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
```

### Will result in an output of:
```
// create a new account with a deposit of $1000
Since this is your first time making a deposit of $1000 or more, you will receive a bonus rate of %1.0. The final amount deposited is $1010.0.

// deposit $200
Making a deposit of $200.0.

// withdraw $100 with incorrect password
Error: Invalid password. Cannot retrieve balance

// withdraw $1250 wit correct password
Error: For deposits, amount has to be greater than zero. For withdrawals, amount has to be greater than zero and less than or equal to your current balance.

// check account balance with correct password
Your current balance is $1210.0
```