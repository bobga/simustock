class UserModel {
  User user;
  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    user = User(parsedJson);
  }
}

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String country;
  String state;

  User(parsedJson) {
    id = parsedJson['user_id'];
    firstName = parsedJson['first_name'];
    lastName = parsedJson['last_name'];
    email = parsedJson['email'];
    country = parsedJson['location']['country'];
    state = parsedJson['location']['state'];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    return map;
  }
}
