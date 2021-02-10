class StateModel {
  List<States> datas = [];

  StateModel.fromJson(Map<String, dynamic> parsedJson) {
    List<States> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      States data = States(parsedJson['data'][i]);
      temp.add(data);
    }
    datas = temp;
  }

  List<States> get data => datas;
}

class States {
  int stateId;
  String stateName;

  States(parsedJson) {
    stateId = parsedJson['state_id'];
    stateName = parsedJson['state_name'];
  }
}
