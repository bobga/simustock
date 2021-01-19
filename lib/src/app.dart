import 'package:flutter/material.dart';
import 'package:simustock/src/dummy.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffdaf1de),
        brightness: Brightness.light,
        primaryColor: Color(0xff235347),
        accentColor: Colors.black,
        focusColor: Color(0xff8eb69b),
        textTheme: TextTheme(),
      ),
      home: Scaffold(
        body: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("App snapshot == ${snapshot.toString()}");
            if (snapshot.hasError) {
              print("App snapshot.hasError");
              return DummyPage();
            } else if (snapshot.hasData) {
              print("App snapshot.hasData");
              return Container();
            } else {
              print("App snapshot.hasError");
              return DummyPage();
            }
          },
        ),
      ),
    );
  }
}
