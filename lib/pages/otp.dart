import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:care_hospital/service/phone_auth.dart';

class Otp extends StatefulWidget {
  final String phoneNo;
  Otp({Key key, this.phoneNo}) : super(key: key);
  @override
  _OtpState createState() => _OtpState();

}

class _OtpState extends State<Otp> {

  GlobalKey<FormState> _key = new GlobalKey();
  String phoneNo;
  String _otp;
  PhoneAuth phoneAuth;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNo = widget.phoneNo;
    phoneAuth = PhoneAuth(phoneNo: widget.phoneNo);
    phoneAuth.verifyPhone(context);
  }


  String numberCountValidator(value, int requiredCount) {
    if (value.length < requiredCount || value.length > requiredCount) {
      return "Invalid";
    } else {
      _key.currentState.save();
      return null;
    }
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
                SizedBox(height: 10.0),
                Text(
                  'Care Hospital',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Enter OTP  ',
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
                      maxLength: 6,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius : BorderRadius.circular(20.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                        onSaved: ((value) {
                          _otp = value;
                        }),
                        validator: (value) =>
                            numberCountValidator(value, 6)
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.redAccent[700],
                  child: Text(
                    'LOGIN',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    if(_key.currentState.validate()){
                      phoneAuth.signIn(context, smsOTP: _otp);
                      // Navigator.push( context, MaterialPageRoute(builder: (context){ return Home(); }));
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
