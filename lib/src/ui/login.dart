import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'signup.dart';
import 'accounts.dart';
import 'terms_of_service.dart';
import '../blocs/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
    check().then((internet) {
      if (internet == false) {
      } else {
        bloc.getUser.listen((data) {
          if (data.user.email != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Accounts(),
              ),
            );
          }
        });
      }
    });

    return Form(
      key: _formKey,
      child: loginForm(context),
    );
  }

  Scaffold loginForm(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    'SimuStock',
                    style: TextStyle(
                      color: Color(0xff0b2b26),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 57,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Welcome to SimuStock the one stop shop for stock simulations. Here you can enjoy finding out how much money you could have have gained or lost",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: screenSize.width,
                child: Column(
                  children: [
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: usernameController,
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
                      height: 10,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: passwordController,
                        maxLines: 1,
                        autofocus: false,
                        obscureText: true,
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                          Validators.minLength(
                              8, 'Password cannot less than 8 characters'),
                          Validators.maxLength(120,
                              'Password cannot be greater than 120 characters'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Password*',
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
                                'Sign in',
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
                            } else {
                              if (_formKey.currentState.validate() == true) {
                                setState(() {
                                  load = true;
                                });
                                // await bloc.loginUserLogin(
                                //     usernameController.text,
                                //     passwordController.text);
                                setState(() {
                                  load = false;
                                });
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Accounts(),
                                ),
                              );
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      borderRadius: new BorderRadius.circular(15.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupForm(),
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
                                    text: 'Don`t have an account? ',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  new TextSpan(
                                    text: ' Sign Up',
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
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TermsOfService(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Text(
                          "By processing you also agree to the Privacy Policy",
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
