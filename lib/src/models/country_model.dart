class CountryModel {
  List<Country> datas = [];

  CountryModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Country> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      Country data = Country(parsedJson['data'][i]);
      temp.add(data);
    }
    datas = temp;
  }

  List<Country> get data => datas;
}

class Country {
  int countryId;
  String countryName;

  Country(parsedJson) {
    countryId = parsedJson['country_id'];
    countryName = parsedJson['country_name'];
  }
}
