import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../resources/repository.dart';
import '../models/country_model.dart';
import '../models/state_model.dart';

final bloc = SignupBloc();

class SignupBloc {
  final repository = Repository();

  final countryFetcher = PublishSubject<CountryModel>();
  final stateFetcher = PublishSubject<StateModel>();

  StreamView<CountryModel> get getAllCountry => countryFetcher.stream;
  StreamView<StateModel> get getAllState => stateFetcher.stream;

  dispose() async {
    await countryFetcher.drain();
    await stateFetcher.drain();
    countryFetcher.close();
    stateFetcher.close();
  }

  userSignup(dynamic params) async {
    try {
      String result = await repository.userSignup(params);
      return result;
    } catch (e) {
      print("Error == ${e.toString()}");
    }
  }

  fetchAllCountry() async {
    CountryModel countryModel = await repository.fetchAllCountry();
    countryFetcher.sink.add(countryModel);
  }

  fetchAllState() async {
    StateModel stateModel = await repository.fetchAllState();
    stateFetcher.sink.add(stateModel);
  }
}
