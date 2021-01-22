import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class PasswordEditForm extends StatefulWidget {
  @override
  _PasswordEditFormState createState() => _PasswordEditFormState();
}

class _PasswordEditFormState extends State<PasswordEditForm> {
  final _formKey3 = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey3,
      child: changePasswordForm(context),
    );
  }

  Scaffold changePasswordForm(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'Change Password',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: screenSize.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: TextFormField(
                        controller: currentPasswordController,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('Current password is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Current password',
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: TextFormField(
                        controller: newPasswordController,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('New password is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'New password',
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: TextFormField(
                        controller: passwordCheckController,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('Retype password is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Retype password',
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ButtonTheme(
                      height: kToolbarHeight / 1.20,
                      minWidth: screenSize.width / 1.3,
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                        child: (load == false)
                            ? new Text(
                                'Update Password',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
