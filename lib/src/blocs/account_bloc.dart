import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/account_model.dart';
import '../models/stock_model.dart';

final bloc = AccountBloc();

class AccountBloc {
  final repository = Repository();
  final accountFetcher = PublishSubject<AccountModel>();
  final detailFetcher = PublishSubject<AccountModel>();
  final stockFetcher = PublishSubject<StockModel>();

  StreamView<AccountModel> get allAccount => accountFetcher.stream;
  StreamView<AccountModel> get accountDetail => detailFetcher.stream;
  StreamView<StockModel> get allStock => stockFetcher.stream;

  dispose() async {
    await accountFetcher.drain();
    await detailFetcher.drain();
    await stockFetcher.drain();
    accountFetcher.close();
    detailFetcher.close();
    stockFetcher.close();
  }

  fetchAllAccount() async {
    AccountModel accountModel = await repository.fetchAllAccount();
    accountFetcher.sink.add(accountModel);
  }

  fetchAccountById(int accountId, String filter) async {
    AccountModel accountModel =
        await repository.fetchAccountById(accountId, filter);
    detailFetcher.sink.add(accountModel);
  }

  fetchAllStock() async {
    StockModel stockModel = await repository.fetchAllStock();
    stockFetcher.sink.add(stockModel);
  }

  saveAccount(
      double shareAmount, String symbol, double usdAmount, int userId) async {
    bool result =
        await repository.saveAccount(shareAmount, symbol, usdAmount, userId);
    return result;
  }
}
