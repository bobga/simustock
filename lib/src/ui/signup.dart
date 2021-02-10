import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:string_validator/string_validator.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'login.dart';
import 'terms_of_service.dart';

import '../blocs/signup_bloc.dart';
import '../models/country_model.dart';
import '../models/state_model.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  bool load = false;

  List<String> countryList = [];
  List<String> stateList = [];

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
        bloc.fetchAllState();
        bloc.fetchAllCountry();
        bloc.getAllCountry.listen((snapshot) {
          for (int i = 0; i < snapshot.datas.length; i++) {
            countryList.add(snapshot.datas[i].countryName);
          }
        });
        bloc.getAllState.listen((snapshot) {
          for (int i = 0; i < snapshot.datas.length; i++) {
            stateList.add(snapshot.datas[i].stateName);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
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
      key: _scaffoldKey,
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
                      height: 20.0,
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: firstNameController,
                        maxLines: 1,
                        autofocus: false,
                        validator: Validators.compose([
                          Validators.required('First Name is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'First Name*',
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
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        controller: lastNameController,
                        maxLines: 1,
                        autofocus: false,
                        validator: Validators.compose([
                          Validators.required('Last Name is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'Last Name*',
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
                        validator: (String value) {
                          if (isNull(value)) {
                            return "Confirm password is required";
                          } else if (!isLength(value, 8, 20)) {
                            return "Confirm password must be min 8, max 20";
                          } else if (!equals(value, passwordController.text)) {
                            return "Password does not match";
                          } else
                            return null;
                        },
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
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: StreamBuilder(
                        stream: bloc.getAllCountry,
                        builder:
                            (context, AsyncSnapshot<CountryModel> snapshot) {
                          if (snapshot.hasData) {
                            return DropdownSearch<String>(
                              mode: Mode.BOTTOM_SHEET,
                              isFilteredOnline: true,
                              showClearButton: false,
                              showSearchBox: true,
                              hint: "Country*",
                              dropdownSearchDecoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              items: countryList,
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null)
                                  return "This field is required";
                                return null;
                              },
                              // onFind: ,
                              onChanged: (String data) {
                                setState(() {
                                  countryController.text = data;
                                });
                                print(data);
                              },
                            );
                          }

                          return CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.white),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: StreamBuilder(
                          stream: bloc.getAllState,
                          builder:
                              (context, AsyncSnapshot<StateModel> snapshot) {
                            if (snapshot.hasData) {
                              return DropdownSearch<String>(
                                mode: Mode.BOTTOM_SHEET,
                                isFilteredOnline: true,
                                showClearButton: false,
                                showSearchBox: true,
                                hint: "State*",
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                items: stateList,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null)
                                    return "This field is required";
                                  return null;
                                },
                                onChanged: (String data) {
                                  setState(() {
                                    stateController.text = data;
                                  });
                                  print(data);
                                },
                              );
                            }
                            return CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            );
                          }),
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
                            } else {
                              if (_formKey1.currentState.validate() == true) {
                                setState(() {
                                  load = true;
                                });
                                var params = {
                                  "first_name": firstNameController.text,
                                  "last_name": lastNameController.text,
                                  "email": emailController.text,
                                  "password": passwordController.text,
                                  "country": countryController.text,
                                  "state": stateController.text,
                                };
                                await bloc.userSignup(params).then((result) {
                                  setState(() {
                                    load = false;
                                  });
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text("$result"),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                });
                              }
                            }
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
