class StockModel {
  List<Stock> datas = [];

  StockModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Stock> temp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      Stock data = Stock(parsedJson['data'][i]);
      temp.add(data);
    }
    datas = temp;
  }

  List<Stock> get data => datas;
}

class Stock {
  int stockId;
  String symbol;

  Stock(parsedJson) {
    stockId = parsedJson['stock_id'];
    symbol = parsedJson['symbol'];
  }
}
