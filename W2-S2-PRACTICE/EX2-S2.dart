class BankAccount {
    final int _accountId;
    final String _accountOwner;
    double _balance;

  BankAccount(int accountId, String accountOwner)
      : _accountId = accountId,
        _accountOwner = accountOwner,
        _balance = 0.0;

  // Getters for the private fields
  int get accountId => _accountId;
  String get accountOwner => _accountOwner;
  double balance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (_balance < amount) {
      throw Exception("Insufficient balance for withdrawal!");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }

  @override
  String toString() {
    return 'AccountOwner: $_accountOwner, AccountID: $_accountId, Balance: \$$_balance';
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts;

  Bank({required this.name}) : _accounts = [];

  // Method to create a new account
  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception("Account with ID $accountId already exists!");
      }
    }

    // Create and return the new account
    BankAccount newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }

  @override
  String toString() {
    return 'Bank: $name, Accounts: ${_accounts.length}, $_accounts';
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');
  print(
      ronanAccount); // Output: AccountOwner: Ronan, AccountID: 100, Balance: $0
  ronanAccount.credit(100);
  print(
      ronanAccount); // Output: AccountOwner: Ronan, AccountID: 100, Balance: $100
  ronanAccount.withdraw(50);
  print(
      ronanAccount); // Output: AccountOwner: Ronan, AccountID: 100, Balance: $50

  try {
    ronanAccount.withdraw(80);
  } catch (e) {
    print(e);
  } finally {
    print('Success');
  }

  try {
    myBank.createAccount(105, 'Honlgy');
  } catch (e) {
    print(e);
  } finally {
    print('Account Created');
  }

  print(myBank);
}
