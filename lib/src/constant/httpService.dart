import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'utils.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();

  static Client client = Client();
  factory HttpService() {
    return _singleton;
  }
  HttpService._internal();

  final authorizationEndpoint =
      Uri.parse('${NetworkUtils.auth0Domain}${NetworkUtils.tokenEndpoint}');
  final _secureStorage = FlutterSecureStorage();

  Future<String> _getMobileToken() async {
    return await _secureStorage.read(key: NetworkUtils.storageKeyMobileToken) ??
        '';
  }

  Future<void> _setMobileToken(String token) async {
    return await _secureStorage.write(
        key: NetworkUtils.storageKeyMobileToken, value: token);
  }

  Future<void> setToken(username, password) async {
    final identifier = NetworkUtils.clientIdentifier;
    final secret = NetworkUtils.clientSecret;

    var headers = <String, String>{};

    headers['Authorization'] = basicAuthHeader(identifier, secret);

    var body = {
      'grant_type': 'password',
      'client_id': NetworkUtils.clientIdentifier,
      'audience': NetworkUtils.audience,
      'username': username,
      'password': password,
      'scope': 'openid'
    };

    var response =
        await client.post(authorizationEndpoint, headers: headers, body: body);

    if (response.statusCode == 200) {
      await _setMobileToken(json.decode(response.body)['access_token']);
    }
  }

  getAccessToken() async {
    var _mobileToken = await _getMobileToken();

    if (_mobileToken.isEmpty) {
      throw "couldn't get user";
    } else {
      return _mobileToken;
    }
  }

  String basicAuthHeader(String identifier, String secret) {
    var userPass = Uri.encodeFull(identifier) + ':' + Uri.encodeFull(secret);
    return 'Basic ' + base64Encode(ascii.encode(userPass));
  }
}
