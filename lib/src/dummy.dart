import 'package:flutter/material.dart';

import 'ui/login.dart';

void main() {
  runApp(MaterialApp(home: LoginForm()));
}

class DummyPage extends StatefulWidget {
  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500)).then((__) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginForm()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }
}
