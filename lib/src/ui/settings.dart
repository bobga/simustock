import 'package:flutter/material.dart';
import 'password_edit.dart';
import 'email_edit.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: screenSize.height / 4,
                width: screenSize.width,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.8),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenSize.width,
                    color: Theme.of(context).primaryColor.withOpacity(0.15),
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      'PROFILE',
                      style: TextStyle(
                        color: Theme.of(context).accentColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          'First name',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                          right: 20,
                        ),
                        child: Text(
                          'Annie',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          'Last name',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                          right: 20,
                        ),
                        child: Text(
                          'Larson',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                          right: 20,
                        ),
                        child: Text(
                          'annie.larson@gmail.com',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screenSize.width,
                    color: Theme.of(context).primaryColor.withOpacity(0.15),
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ACCOUNT',
                          style: TextStyle(
                            color:
                                Theme.of(context).accentColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  InkWell(
                    onTap: () {
                      print("clicking change email");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailEditForm(),
                        ),
                      );
                    },
                    child: Container(
                      width: screenSize.width,
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        'Change Email',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                  InkWell(
                    onTap: () {
                      print("clicking change password");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PasswordEditForm(),
                        ),
                      );
                    },
                    child: Container(
                      width: screenSize.width,
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
