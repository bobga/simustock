import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AccountDetailWidget extends StatefulWidget {
  @override
  _AccountDetailWidgetState createState() => _AccountDetailWidgetState();
}

class _AccountDetailWidgetState extends State<AccountDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Revenue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Doe Jones Industrial",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height / 2.5,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: charts.TimeSeriesChart(
                      _createSampleData(),
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                        renderSpec: charts.SmallTickRendererSpec(
                          lineStyle: charts.LineStyleSpec(
                            dashPattern: [0, 100],
                          ),
                          labelStyle: new charts.TextStyleSpec(
                            color: charts.MaterialPalette.white,
                          ),
                        ),
                      ),
                      // primaryMeasureAxis: new charts.NumericAxisSpec(
                      //     renderSpec: new charts.NoneRenderSpec()),
                      domainAxis: new charts.DateTimeAxisSpec(
                          renderSpec: new charts.NoneRenderSpec()),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Value",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "\$ ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "97.230",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          DefaultTabController(
            length: 12,
            child: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'JAN',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'FEB',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'MAR',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'APR',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'JUN',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'JUL',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'AUG',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'SEP',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'OCT',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'NOV',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'DEC',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    'Jan',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
              isScrollable: true,
              indicatorColor: Theme.of(context).primaryColor,
              unselectedLabelStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.4)),
              onTap: (index) {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Container(
              padding: EdgeInsets.all(16),
              height: screenSize.width / 1.5,
              width: screenSize.width,
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Initial Investment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '\$ 22.343',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Initial Shares',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Number of Shares',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1.436',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
        strokeWidthPxFn: (TimeSeriesSales sales, _) => 5,
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
