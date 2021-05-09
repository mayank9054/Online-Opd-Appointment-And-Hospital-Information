import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:care_hospital/pages/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = new GlobalKey();

  bool _isLoading = false;
  bool _validate = false;

  String phoneno;

  String validateNumber(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Enter Phone number";
    } else if (value.length != 10) {
      return "Enter valid number";
    } else if (!regExp.hasMatch(value)) {
      return "Enter valid number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 30, 5, 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 80.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Care Hospital',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  'Enter Your Phone number',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.indigo[400]),
                  ),
                ),
                SizedBox(height: 30.0),
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateNumber,
                      onSaved: ((value) {
                        phoneno = '+91$value';
                        print(phoneno);
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.redAccent[700],
                  child: Text(
                    'GENERATE OTP',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      _key.currentState.save();
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              Otp(phoneNo: phoneno)));
                      // print('number $number');
                    } else {
                      _validate = true;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
