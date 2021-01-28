import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import '../models/user_model.dart';

final bloc = LoginBloc();

class LoginBloc {
  final repository = Repository();
  final userFetcher = PublishSubject<UserModel>();

  StreamView<UserModel> get getUser => userFetcher.stream;

  loginUserLogin(String username, String password) async {
    if (username != "" && password != "") {
      try {
        UserModel userModel =
            await repository.loginUserLogin(username, password);
        userFetcher.sink.add(userModel);
      } catch (e) {
        print("Error == ${e.toString()}");
        if (!userFetcher.isClosed) {
          // userFetcher.sink.addError(e.toString());
        }
      }
    }
  }

  dispose() async {
    await userFetcher.drain();
    userFetcher.close();
    print('dispose');
  }
}
