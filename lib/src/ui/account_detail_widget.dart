import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:simustock/src/models/account_model.dart';
import '../blocs/account_bloc.dart';

class AccountDetailWidget extends StatefulWidget {
  final int accountId;

  const AccountDetailWidget({Key key, this.accountId}) : super(key: key);
  @override
  _AccountDetailWidgetState createState() => _AccountDetailWidgetState();
}

class _AccountDetailWidgetState extends State<AccountDetailWidget> {
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    check().then((internet) {
      if (internet == false) {
      } else {
        bloc.fetchAccountById(widget.accountId, '1W');
      }
    });
  }

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
            StreamBuilder(
              stream: bloc.accountDetail,
              builder: (context, AsyncSnapshot<AccountModel> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data.datas[0].firstName} ${snapshot.data.datas[0].lastName} Industrial",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                    ),
                  );
                }

                return SizedBox();
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc.accountDetail,
        builder: (context, AsyncSnapshot<AccountModel> snapshot) {
          if (snapshot.hasData) {
            return ListView(
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
                            _createSampleData(
                              snapshot.data.datas[0].values,
                            ),
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
                                '${double.parse(snapshot.data.datas[0].currentUsdAccountValue ?? "0.0").toStringAsFixed(3)}',
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
                Center(
                  child: DefaultTabController(
                    length: 5,
                    child: TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            '1W',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '1M',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '3M',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '1Y',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            '5Y',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                      isScrollable: true,
                      indicatorColor: Theme.of(context).primaryColor,
                      unselectedLabelStyle: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4)),
                      onTap: (index) {
                        setState(() {
                          switch (index) {
                            case 1:
                              bloc.fetchAccountById(widget.accountId, '1M');
                              break;
                            case 2:
                              bloc.fetchAccountById(widget.accountId, '3M');
                              break;
                            case 3:
                              bloc.fetchAccountById(widget.accountId, '1Y');
                              break;
                            case 4:
                              bloc.fetchAccountById(widget.accountId, '5Y');
                              break;
                            default:
                              bloc.fetchAccountById(widget.accountId, '1W');
                          }
                        });
                      },
                    ),
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
                          '\$ ${double.parse(snapshot.data.datas[0].usdAmount).toStringAsFixed(3)}',
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
                          '${double.parse(snapshot.data.datas[0].shareAmount).toStringAsFixed(3)}',
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
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          );
        },
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
  final double sales;

  TimeSeriesSales(this.time, this.sales);
}
