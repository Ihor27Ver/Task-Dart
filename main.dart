void main() {
  Euro euro = Euro();
  Usd usd = Usd();
  Uah uah = Uah();

  Wallet walletUah = Wallet(1000, uah);
  Wallet walletEuro = Wallet(1000, euro);
  Wallet walleteUsd = Wallet(1000, usd);

  walletUah.getAmountFormatted();
  walletEuro.getAmountFormatted();
  walleteUsd.getAmountFormatted();

  walleteUsd.transferTo(walletUah, 100);
  walletEuro.transferTo(walletUah, 1);

  walletUah.getAmountFormatted();
  walletEuro.getAmountFormatted();
  walleteUsd.getAmountFormatted();

  walletUah.changeWalletCurrency(walletUah.currency.symbol);
  walletEuro.changeWalletCurrency(walletUah.currency.symbol);
  walleteUsd.changeWalletCurrency(walletUah.currency.symbol);

  walletUah.getAmountFormatted();
  walletEuro.getAmountFormatted();
  walleteUsd.getAmountFormatted();
}

class Currency {
  var name;
  var symbol;
  var rateToUah;
}

class Euro extends Currency {
  var currencyName = "Euro";
  var symbol = "€";
  var rateToUah = 30.73;
}

class Usd extends Currency {
  var currencyName = "Usd";
  var symbol = r"$";
  var rateToUah = 27.6;
}

class Uah extends Currency {
  var currencyName = "Usd";
  var symbol = "₴";
  var rateToUah = 1;
}

class Wallet {
  double amountMoney;
  Currency currency;

  Wallet(this.amountMoney, this.currency);

  void addMoney(amount) {
    amountMoney = amountMoney + amount;
  }

  void transferTo(Wallet wallet, amount) {
    amountMoney = amountMoney - amount;
    if (wallet.currency.symbol == "₴") {
      amount = amount * currency.rateToUah;
      wallet.addMoney(amount);
    }
    if (wallet.currency.symbol != "₴") {
      amount = amount / currency.rateToUah;
      wallet.addMoney(amount);
    }
  }

  void changeWalletCurrency(newCurrency) {
    if (newCurrency == "₴" && currency.symbol != "₴") {
      currency.symbol = newCurrency;
      amountMoney = amountMoney * currency.rateToUah;
    }
  }

  void getAmountFormatted() {
    print('Amount money ${amountMoney} ${currency.symbol}');
  }
}
