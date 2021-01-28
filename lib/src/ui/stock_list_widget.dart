import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/account_model.dart';
import 'account_detail_widget.dart';

class StockListWidget extends StatefulWidget {
  final int accountId;
  final String symbol;
  final String firstName;
  final String lastName;
  final String currentAccountValue;
  final String ratio;
  final List<HistoricalAccountValue> values;

  const StockListWidget({
    Key key,
    this.accountId,
    this.symbol,
    this.firstName,
    this.lastName,
    this.currentAccountValue,
    this.ratio,
    this.values,
  }) : super(key: key);
  @override
  _StockListWidgetState createState() => _StockListWidgetState();
}

class _StockListWidgetState extends State<StockListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountDetailWidget(
              accountId: widget.accountId,
            ),
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
                          "${widget.symbol}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.firstName} ${widget.lastName}",
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
                      _createSampleData(widget.values),
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                          renderSpec: new charts.NoneRenderSpec()),
                      domainAxis: new charts.DateTimeAxisSpec(
                          renderSpec: new charts.NoneRenderSpec()),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.currentAccountValue}",
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
                          "+ ${double.parse(widget.ratio).toStringAsFixed(2).toString()}",
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

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData(
      List<HistoricalAccountValue> values) {
    final List<TimeSeriesSales> data = [];

    for (int i = 0; i < values.length; i++) {
      data.add(
        new TimeSeriesSales(
          new DateTime(
            DateTime.parse(values[i].validFrom).year,
            DateTime.parse(values[i].validFrom).month,
            DateTime.parse(values[i].validFrom).day,
            DateTime.parse(values[i].validFrom).hour,
            DateTime.parse(values[i].validFrom).minute,
            DateTime.parse(values[i].validFrom).second,
          ),
          double.parse(values[i].usdAccountValue),
        ),
      );

      if (values[i].validTo != "None") {
        data.add(
          new TimeSeriesSales(
            new DateTime(
              DateTime.parse(values[i].validTo).year,
              DateTime.parse(values[i].validTo).month,
              DateTime.parse(values[i].validTo).day,
              DateTime.parse(values[i].validTo).hour,
              DateTime.parse(values[i].validTo).minute,
              DateTime.parse(values[i].validTo).second,
            ),
            double.parse(values[i].usdAccountValue),
          ),
        );
      } else {
        data.add(
          new TimeSeriesSales(
            new DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
            double.parse(values[i].usdAccountValue),
          ),
        );
      }
    }
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
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
