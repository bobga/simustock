import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'account_detail_widget.dart';

class StockListWidget extends StatefulWidget {
  @override
  _StockListWidgetState createState() => _StockListWidgetState();
}

class _StockListWidgetState extends State<StockListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Account details");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountDetailWidget(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 2,
        ),
        width: MediaQuery.of(context).size.width,
        height: 80,
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        child: Column(
          children: [
            Divider(
              height: 5,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DJI",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Doe Jones",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3.3,
                    child: charts.TimeSeriesChart(
                      _createSampleData(),
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                          renderSpec: new charts.NoneRenderSpec()),
                      domainAxis: new charts.DateTimeAxisSpec(
                          renderSpec: new charts.NoneRenderSpec()),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$24,334.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 1, 15, 1),
                        decoration: BoxDecoration(color: Color(0xff64dd17)),
                        child: Text(
                          "+1.11",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'usd',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff64dd17)),
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
