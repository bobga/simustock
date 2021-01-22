import 'package:flutter/material.dart';
// import 'package:flutter_vibrate/flutter_vibrate.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  // void _onRefresh() async {
  //   Vibrate.feedback(FeedbackType.medium);

  //   _refreshController.refreshCompleted();
  // }

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

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Accounts"),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
              child: Icon(Icons.menu),
            ),
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
          body: ListView(
            children: [
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
              StockListWidget(),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  // Widget buildAccountList() {
  //   final screenSize = MediaQuery.of(context).size;
  //   return StreamBuilder(
  //     builder: (context, AsyncSnapshot snapshot) {
  //       if (snapshot.hasData) {
  //         if (snapshot.data.datas.length == 0) {
  //           return Center(
  //             child: Text('No Accounts'),
  //           );
  //         } else {
  //           return SmartRefresher(
  //             enablePullDown: true,
  //             header: ClassicHeader(),
  //             controller: _refreshController,
  //             child: ListView.builder(
  //                 physics: BouncingScrollPhysics(),
  //                 itemCount: snapshot.data.data.length,
  //                 itemBuilder: (BuildContext context, int index) {

  //                 }),
  //           );
  //         }
  //       }
  //     },
  //   );
  // }
}
