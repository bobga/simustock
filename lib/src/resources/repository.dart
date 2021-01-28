import '../models/user_model.dart';
import '../models/account_model.dart';
import '../models/stock_model.dart';

import 'simustock_api_provider.dart';

class Repository {
  final simuStockApiProvider = SimuStockApiProvider();
  Future<UserModel> loginUserLogin(String username, String password) =>
      simuStockApiProvider.loginUserLogin(username, password);

  Future<AccountModel> fetchAllAccount() =>
      simuStockApiProvider.fetchAccountList();

  Future<AccountModel> fetchAccountById(int accountId, String filter) =>
      simuStockApiProvider.fetchAccountById(accountId, filter);

  Future<StockModel> fetchAllStock() => simuStockApiProvider.fetchAllStock();

  Future<AccountModel> saveAccount(
          double shareAmount, String symbol, double usdAmount, int userId) =>
      simuStockApiProvider.saveAccount(shareAmount, symbol, usdAmount, userId);
}
