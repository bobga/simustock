import 'dart:convert';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'utils.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();

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

  Future<void> setClient(username, password) async {
    var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: NetworkUtils.clientIdentifier,
        secret: NetworkUtils.clientSecret);

    await _setMobileToken(jsonEncode(client.credentials.toJson()));
  }

  Future getClient() async {
    var _mobileToken = await _getMobileToken();

    if (_mobileToken.isEmpty) {
      throw "couldn't get user";
    } else {
      var client =
          oauth2.Client(oauth2.Credentials.fromJson(jsonDecode(_mobileToken)));

      return client;
    }
  }
}
