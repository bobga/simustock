import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../constant/utils.dart';
import '../constant/httpService.dart';
import '../models/user_model.dart';
import '../models/account_model.dart';
import '../models/stock_model.dart';

class SimuStockApiProvider {
  static Client client = Client();
  static var baseUrl = "${NetworkUtils.urlBase}${NetworkUtils.serverApi}";

  static Future<String> fetchToken() async {
    var client = await HttpService().getClient();
    return client.credentials.accessToken.toString();
  }

  Future<UserModel> loginUserLogin(String username, String password) async {
    try {
      await HttpService().setClient(username, password);
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + await fetchToken(),
      };
      var response = await client.get("${baseUrl}users", headers: headers);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return UserModel.fromJson(result["data"]);
      } else {
        print("Exception 1");
        throw Exception('Failed to load post');
      }
    } catch (e) {
      print("Exception 2 == ${e.error}");
      throw Exception(e.error);
    }
  }

  Future<AccountModel> fetchAccountList() async {
    Map<String, String> headers = {'Accept': 'application/json'};
    var response = await client.get("${baseUrl}accounts", headers: headers);

    if (response.statusCode == 200) {
      return AccountModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failded to load account');
    }
  }

  Future<AccountModel> fetchAccountById(int accountId, String filter) async {
    Map<String, String> headers = {'Accept': 'application/json'};

    var response = await client
        .get("${baseUrl}accounts/$accountId?filters=$filter", headers: headers);

    if (response.statusCode == 200) {
      return AccountModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load account');
    }
  }

  Future<StockModel> fetchAllStock() async {
    Map<String, String> headers = {'Accept': 'application/json'};

    var response = await client.get("${baseUrl}stocks", headers: headers);
    if (response.statusCode == 200) {
      return StockModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failded to load account');
    }
  }

  Future<AccountModel> saveAccount(
      double shareAmount, String symbol, double usdAmount, int userId) async {
    Map<String, String> headers = {'Accept': 'application/json'};

    String jsonBody = json.encode({
      "share_amound": shareAmount,
      "symbol": symbol,
      "use_amound": usdAmount,
      "user_id": userId
    });

    var response = await client.post('${baseUrl}accounts',
        body: jsonBody, headers: headers);
    if (response.statusCode == 200) {
      return AccountModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load account');
    }
  }
}
