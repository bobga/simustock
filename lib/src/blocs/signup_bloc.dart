import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/user_model.dart';

final bloc = SignupBloc();

class SignupBloc {
  final repository = Repository();
  final userFetcher = PublishSubject<UserModel>();

  StreamView<UserModel> get getUser => userFetcher.stream;

  userSignup(dynamic params) async {
    try {
      UserModel userModel = await repository.userSignup(params);
      userFetcher.sink.add(userModel);
    } catch (e) {
      userFetcher.sink.addError(e);
    }
  }

  dispose() {
    userFetcher.close();
  }
}
