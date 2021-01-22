import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class EmailEditForm extends StatefulWidget {
  @override
  _EmailEditFormState createState() => _EmailEditFormState();
}

class _EmailEditFormState extends State<EmailEditForm> {
  final _formKey4 = GlobalKey<FormState>();
  TextEditingController newEmailController = TextEditingController();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey4,
      child: changeEmailForm(context),
    );
  }

  Scaffold changeEmailForm(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'Change Email',
              style: TextStyle(
                color: Colors.white,
              ),
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
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: TextFormField(
                        controller: newEmailController,
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        validator: Validators.compose([
                          Validators.required('Email is required'),
                          Validators.email('Invalid email address'),
                          Validators.minLength(
                              5, 'Email cannot be less than 5 characters'),
                          Validators.maxLength(120,
                              'Email cannot be greater than 120 characters'),
                          Validators.required('New Email is required'),
                        ]),
                        decoration: InputDecoration(
                          hintText: 'New Email',
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
                                'Update Email',
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
          )
        ],
      ),
    );
  }
}
