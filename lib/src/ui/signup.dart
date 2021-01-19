import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'login.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  bool load = false;

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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey1,
      child: signupForm(context),
    );
  }

  Scaffold signupForm(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            floating: true,
            elevation: 1.0,
            centerTitle: true,
            pinned: true,
            title: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
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
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        autofocus: false,
                        validator: Validators.compose([
                          Validators.required('Email is required'),
                          Validators.email('Invalid email address'),
                          Validators.minLength(
                              5, 'Email cannot be less than 5 characters'),
                          Validators.maxLength(120,
                              'Email cannot be greater than 120 characters'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Email*',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        maxLines: 1,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                          Validators.minLength(
                              8, 'Password cannot be less than 8 characters'),
                          Validators.maxLength(120,
                              'Password cannot be greater than 120 characters'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Password*',
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: passwordCheckController,
                        maxLines: 1,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                          Validators.minLength(
                              8, 'Password cannot be less than 8 characters'),
                          Validators.maxLength(120,
                              'Password cannot be greater than 120 characters'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Repeat Password*',
                          filled: true,
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(
                        "By processing you also agree to the Terms of Service and Privacy Policy",
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
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
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            : CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                        onPressed: () {
                          check().then((internet) async {
                            if (internet == false) {
                            } else {}
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      borderRadius: new BorderRadius.circular(15.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginForm(),
                          ),
                        );
                      },
                      child: Container(
                        height: kToolbarHeight / 1.20,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: new Align(
                          alignment: Alignment.center,
                          child: new RichText(
                            text: new TextSpan(
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(61, 131, 225, 1),
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' Sign in',
                                    style: new TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
