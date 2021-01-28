class AccountModel {
  List<Account> datas = [];
  AccountModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Account> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      Account data = Account(parsedJson['data'][i]);
      temp.add(data);
    }
    datas = temp;
  }

  List<Account> get data => datas;
}

class Account {
  int accountId;
  String currentUsdAccountValue;
  String shareAmount;
  int stockId;
  String symbol;
  String usdAmount;
  String firstName;
  String lastName;
  String userId;
  List<HistoricalAccountValue> values = [];

  // Data.fromJson(Map<String, dynamic> parsedJson) {
  //   List<HistoricalAccountValue> temp = [];
  //   for (int i = 0;
  //       i < parsedJson['data']['historical_account_values'].length;
  //       i++) {
  //     HistoricalAccountValue data =
  //         HistoricalAccountValue(parsedJson['historical_account_values'][i]);
  //     temp.add(data);
  //   }
  //   values = temp;
  // }

  List<HistoricalAccountValue> get value => values;

  Account(parsedJson) {
    accountId = parsedJson['account_id'];
    currentUsdAccountValue = parsedJson['current_usd_account_value'];
    shareAmount = parsedJson['share_amount'];
    stockId = parsedJson['stock']['stock_id'];
    symbol = parsedJson['stock']['symbol'];
    usdAmount = parsedJson['usd_amount'];
    firstName = parsedJson['user']['first_name'];
    lastName = parsedJson['user']['last_name'];
    userId = parsedJson['user']['user_id'];
    values = [];
    for (int i = 0; i < parsedJson['historical_account_values'].length; i++) {
      HistoricalAccountValue data =
          HistoricalAccountValue(parsedJson['historical_account_values'][i]);
      values.add(data);
    }
  }
}

class HistoricalAccountValue {
  String usdAccountValue;
  String validFrom;
  String validTo;

  HistoricalAccountValue(parsedJson) {
    usdAccountValue = parsedJson['usd_account_value'];
    validFrom = parsedJson['valid_from'];
    validTo = parsedJson['valid_to'];
  }
}
