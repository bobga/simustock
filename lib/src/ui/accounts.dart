import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../blocs/account_bloc.dart';
import '../models/account_model.dart';

import 'stock_list_widget.dart';
import 'settings.dart';
import 'create_account.dart';

class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedDestination = 0;
  Icon icon = Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget appBarTitle = Text("Accounts", style: TextStyle(color: Colors.white));
  TextEditingController _controller = TextEditingController();

  bool _isSearching;
  String _searchText = '';

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
        bloc.fetchAllAccount();
        _isSearching = false;
      }
    });
  }

  void _onRefresh() async {
    Vibrate.feedback(FeedbackType.medium);
    await bloc.fetchAllAccount();
    _refreshController.refreshCompleted();
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
      switch (_selectedDestination) {
        case 0:
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Accounts(),
              ),
            );
          }
          break;
        case 1:
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateAccountForm(),
              ),
            );
          }
          break;
        default:
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Settings(),
              ),
            );
          }
          break;
      }
    });
  }

  void searchOperation(String searchText) {
    setState(() {
      if (_isSearching == true) {
        _searchText = searchText;
      }
    });
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle =
          Text("Accounts", style: TextStyle(color: Colors.white));

      _isSearching = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: appBarTitle,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: Icon(Icons.menu),
            ),
            actions: <Widget>[
              new IconButton(
                icon: icon,
                onPressed: () {
                  setState(() {
                    if (this.icon.icon == Icons.search) {
                      this.icon = new Icon(
                        Icons.close,
                        color: Colors.white,
                      );

                      this.appBarTitle = new TextField(
                        controller: _controller,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          prefixIcon: new Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        onChanged: searchOperation,
                      );
                      _handleSearchStart();
                    } else {
                      _handleSearchEnd();
                    }
                  });
                },
              ),
            ],
          ),
          drawer: Drawer(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  ListTile(
                    leading: Icon(Icons.home_outlined),
                    title: Text('Account Home'),
                    selected: _selectedDestination == 0,
                    selectedTileColor: Color(0xff8eb69b),
                    onTap: () => selectDestination(0),
                  ),
                  ListTile(
                    leading: Icon(Icons.bar_chart),
                    title: Text('Create Stock Account'),
                    selected: _selectedDestination == 1,
                    selectedTileColor: Color(0xff8eb69b),
                    onTap: () => selectDestination(1),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Account Settings'),
                    selected: _selectedDestination == 2,
                    selectedTileColor: Color(0xff8eb69b),
                    onTap: () => selectDestination(2),
                  ),
                ],
              ),
            ),
          ),
          body: buildAccountList(),
        ),
        Container(
          height: MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  Widget buildAccountList() {
    // final screenSize = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: bloc.allAccount,
      builder: (context, AsyncSnapshot<AccountModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.datas.length == 0) {
            return Center(
              child: Text('No Accounts'),
            );
          } else {
            return SmartRefresher(
              enablePullDown: true,
              header: ClassicHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.datas.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_isSearching == false) {
                    return StockListWidget(
                      accountId: snapshot.data.data[index].accountId,
                      symbol: snapshot.data.data[index].symbol,
                      firstName: snapshot.data.data[index].firstName,
                      lastName: snapshot.data.data[index].lastName,
                      currentAccountValue: double.parse(snapshot
                                  .data.data[index].currentUsdAccountValue ??
                              "0.0")
                          .toStringAsFixed(4),
                      ratio: (double.parse(snapshot.data.data[index]
                                      .currentUsdAccountValue ??
                                  "0.0") /
                              double.parse(snapshot.data.data[index].usdAmount))
                          .toString(),
                      values: snapshot.data.data[index].values,
                    );
                  } else {
                    return snapshot.data.data[index].symbol
                            .toLowerCase()
                            .contains(_searchText.toLowerCase())
                        ? StockListWidget(
                            accountId: snapshot.data.data[index].accountId,
                            symbol: snapshot.data.data[index].symbol,
                            firstName: snapshot.data.data[index].firstName,
                            lastName: snapshot.data.data[index].lastName,
                            currentAccountValue: double.parse(snapshot.data
                                        .data[index].currentUsdAccountValue ??
                                    "0.0")
                                .toStringAsFixed(4),
                            ratio: (double.parse(snapshot.data.data[index]
                                            .currentUsdAccountValue ??
                                        "0.0") /
                                    double.parse(
                                        snapshot.data.data[index].usdAmount))
                                .toString(),
                            values: snapshot.data.data[index].values,
                          )
                        : SizedBox();
                  }
                },
              ),
            );
          }
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
    );
  }
}
