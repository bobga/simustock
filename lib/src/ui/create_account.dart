import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey5 = GlobalKey<FormState>();
  TextEditingController stockController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController numberOfSharesController = TextEditingController();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey5,
      child: createAccountForm(context),
    );
  }

  Scaffold createAccountForm(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'Create Account',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: screenSize.width,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                        width: screenSize.width,
                        child: Text(
                          'New Account Details',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: DropdownSearch<String>(
                          mode: Mode.BOTTOM_SHEET,
                          isFilteredOnline: true,
                          showClearButton: false,
                          showSearchBox: true,
                          label: 'Stock:',
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
                          items: ['TSLA'],
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: Validators.compose([
                            Validators.required('This field is required'),
                          ]),
                          // onFind: ,
                          onChanged: (String data) {
                            setState(() {
                              stockController.text = data;
                            });
                            print(data);
                          },
                        ),
                        // child: TextFormField(
                        //   controller: stockController,
                        //   maxLines: 1,
                        //   keyboardType: TextInputType.text,
                        //   autofocus: false,
                        //   validator: Validators.compose([
                        //     Validators.required('This field is required'),
                        //   ]),
                        //   decoration: InputDecoration(
                        //     labelText: 'Stock:',
                        //     labelStyle: TextStyle(
                        //       color: Theme.of(context).primaryColor,
                        //     ),
                        //     filled: true,
                        //     contentPadding:
                        //         EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        //     fillColor: Colors.white,
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide.none,
                        //       borderRadius: BorderRadius.circular(5.0),
                        //     ),
                        //   ),
                        // ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: numberOfSharesController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          validator: Validators.compose([
                            Validators.required('This field is required'),
                          ]),
                          decoration: InputDecoration(
                            labelText: 'Number of Shares:',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: amountController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          validator: Validators.compose([
                            Validators.required('This field is required'),
                          ]),
                          decoration: InputDecoration(
                            prefixText: '\$ ',
                            labelText: 'Amount:',
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
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
                        height: 140,
                        width: screenSize.width / 1.6,
                        child: Center(
                          child: Text(
                            ' Here you are creating a stock account to simulate the value of.'
                            ' Select a stock, how many shares you are purchasing, and the total price for all the shares.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                        width: screenSize.width,
                        child: Text(
                          'Summary',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${numberOfSharesController.text} Shares of ${stockController.text}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '\$${amountController.text}',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.3,
        color:
            Theme.of(context).primaryColor.withOpacity(0.01).withOpacity(0.5),
        child: new Align(
          alignment: Alignment.center,
          child: ButtonTheme(
            height: kToolbarHeight / 1.20,
            minWidth: screenSize.width / 1.3,
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              child: (load == false)
                  ? new Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
