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
  static var auth0Domain = "${NetworkUtils.auth0Domain}";

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

  Future<dynamic> signUpUser(dynamic params) async {
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };

      print("Params: ${params['email']}, ${params['password']}");

      String jsonBody = json.encode({
        "client_id": "${NetworkUtils.clientIdentifier}",
        "email": "${params['email']}",
        "password": "${params['password']}",
        "connection": "${NetworkUtils.connection}",
      });

      print("JsonBody: $jsonBody");

      var response = await client.post("$auth0Domain/dbconnections/signup",
          body: jsonBody, headers: headers);

      print("response: ${response.body}");
      if (response.statusCode == 200) {
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Exception 3 == ${e.error}");
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

  Future<bool> saveAccount(
      double shareAmount, String symbol, double usdAmount, int userId) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    String jsonBody = json.encode({
      "share_amount": shareAmount,
      "symbol": symbol,
      "usd_amount": usdAmount,
      "user_id": userId
    });

    var response = await client.post('${baseUrl}accounts',
        body: jsonBody, headers: headers);

    if (response.statusCode == 200) {
      print("response: ${response.body}");
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to load account');
    }
  }
}
