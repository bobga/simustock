import 'dart:convert';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:http/http.dart' show Client;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constant/utils.dart';
import '../constant/httpService.dart';

import '../models/account_model.dart';
import '../models/stock_model.dart';
import '../models/country_model.dart';
import '../models/state_model.dart';
import '../models/user_model.dart';

class SimuStockApiProvider {
  static Client client = Client();
  static var baseUrl = "${NetworkUtils.urlBase}${NetworkUtils.serverApi}";
  static var auth0Domain = "${NetworkUtils.auth0Domain}";

  static Future<String> fetchToken() async {
    var token = await HttpService().getAccessToken();
    return token;
  }

  Future<String> getUserIdFromToken() async {
    var accessToken = await fetchToken();

    if (accessToken.isEmpty) {
      return null;
    }
    return JwtDecoder.decode(accessToken)['sub'].split('|')[1];
  }

  Future<UserModel> loginUserLogin(String username, String password) async {
    try {
      await HttpService().setToken(username, password);

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + await fetchToken(),
      };

      var userId = await getUserIdFromToken();

      print("UserId : $userId");

      var response =
          await client.get("${baseUrl}users/$userId", headers: headers);

      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        print("Response body: ${response.body}");
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

  Future<String> signUpUser(dynamic params) async {
    try {
      Auth0 auth = Auth0(
        baseUrl: auth0Domain,
        clientId: NetworkUtils.clientIdentifier,
      );

      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };

      String status = '';
      await auth.auth.createUser({
        'email': params['email'],
        'password': params['password'],
        'connection': 'Username-Password-Authentication'
      }).then((value) async {
        print("Value: $value");

        String jsonBody = json.encode({
          "country": params['country'],
          "state": params['state'],
          "email": params['email'],
          "first_name": params['first_name'],
          "last_name": params['last_name'],
          "user_id": value['_id'],
        });

        var response = await client.post("${baseUrl}users",
            body: jsonBody, headers: headers);

        print("Response : ${response.body}");
        if (response.statusCode == 200) {
          status = "successed";
        } else {
          status = "failed";
        }
      });
      return status;
    } catch (e) {
      throw Exception(e.error);
    }
  }

  Future<AccountModel> fetchAccountList() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await fetchToken(),
    };
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
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await fetchToken(),
    };

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
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await fetchToken(),
    };

    var response = await client.get("${baseUrl}stocks", headers: headers);
    if (response.statusCode == 200) {
      return StockModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failded to load account');
    }
  }

  Future<CountryModel> fetchAllCountry() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var response = await client.get("${baseUrl}countries", headers: headers);
    if (response.statusCode == 200) {
      return CountryModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load country');
    }
  }

  Future<StateModel> fetchAllState() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var response = await client.get("${baseUrl}states", headers: headers);
    if (response.statusCode == 200) {
      return StateModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to load state');
    }
  }

  Future<bool> saveAccount(
      double shareAmount, String symbol, double usdAmount) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await fetchToken(),
    };

    String jsonBody = json.encode({
      "share_amount": shareAmount,
      "symbol": symbol,
      "usd_amount": usdAmount,
      "user_id": await getUserIdFromToken()
    });

    var response = await client.post('${baseUrl}accounts',
        body: jsonBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 404) {
      return false;
    } else {
      throw Exception('Failed to load account');
    }
  }
}
