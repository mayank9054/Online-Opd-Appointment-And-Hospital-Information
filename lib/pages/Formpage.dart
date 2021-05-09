import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:care_hospital/database/Databasemanager.dart';

class FormPage extends StatefulWidget {
  final dynamic userid;

  @override
  _FormPageState createState() => _FormPageState();
  FormPage({Key key, this.userid}) : super(key: key);
}

final FirebaseAuth auth = FirebaseAuth.instance;
final Databasemanager databasemanager = Databasemanager();

enum SingingCharacter { Male, Female }

SingingCharacter _character = SingingCharacter.Male;

// date and time
String formatted ,error = "";
DateTime dateTime;
void datetimeresult() {
  DateTime now = dateTime;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  formatted = formatter.format(now);

}


class _FormPageState extends State<FormPage> {
  final _formKeyform = new GlobalKey<FormState>();
  bool _validate = false;
  String firstname;
  String lastname;
  String email;
  int phone;
  String dob;
  String gender;
  String address;
  double weight;
  double height;
  dynamic userid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userid = widget.userid;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String validateName(String value) {
    String pattern = r'(^[A-Z,a-z]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Enter  name";
    } else if (!regExp.hasMatch(value)) {
      return "Enter  valid name";
    } else {
      return null;
    }
  }

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

  void submit() {
    final form = _formKeyform.currentState;

    if (form.validate()) {
      if (_character == SingingCharacter.Male)
        gender = "male";
      else
        gender = "female";

      dob = formatted;
      if (formatted != null) {
        if (_formKeyform.currentState.validate()) {
          _formKeyform.currentState.save();
          databasemanager.Storedata(context, firstname, lastname, email, phone, dob, gender, address, weight, height, userid);

          // print('number $number');
        } else {
          _validate = true;
        }
      } else {
        setState(() {
          error = "Enter Date of birth";
        });
      }
    }
  }

    @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal[100],
          title: Text(
            'Form ',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.red[900],
            ),
          ),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Form(
                key: _formKeyform,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: ((width / 2) - 20.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "First Name ",
                                    hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: validateName,
                                  onSaved: (String val) => firstname = val,
                                ),
                              ),
                            ),
                            Container(
                              width: ((width / 2) - 20.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Last Name ",
                                    hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: validateName,
                                  onSaved: (String val) => lastname = val,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateNumber,
                        onSaved: (String val) => phone = int.parse(val),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) =>
                        !val.contains('@') ? "Enter valid Email" : null,
                        onSaved: (String val) => email = val,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Date Of Birth :",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime.now(),
                                  ).then((date) {
                                    setState(() {
                                      dateTime = date;
                                      datetimeresult();
                                    });
                                  });
                                },

                              ),
                              SizedBox(
                                // width: 5.0,
                              ),
                              Text(
                                dateTime == null ? "" : formatted,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 10.0,
                        ),),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(
                            width: 1.5,
                            color: Colors.grey[300],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Gender :",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Container(
                                // width: 100.0,
                                child: ListTile(
                                  title: Text(
                                    'Male',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: SingingCharacter.Male,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                // width: 50.0,
                                child: ListTile(
                                  title: Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  leading: Radio(
                                    value: SingingCharacter.Female,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: ((width / 2) - 20.0),
                              // height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Weight (KG) ",
                                    hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (val) =>
                                  val.isEmpty ? "Enter Weight" : null,
                                  onSaved: (String val) =>
                                  weight = double.parse(val),
                                ),
                              ),
                            ),
                            Container(
                              width: ((width / 2) - 20.0),
                              // height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.5),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Height (CM) ",
                                    hintStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black87,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (val) =>
                                  val.isEmpty ? "Enter Height" : null,
                                  onSaved: (String val) =>
                                  height = double.parse(val),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          hintText: "Address ",
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) =>
                        val.isEmpty
                            ? "Enter Address"
                            : null,
                        onSaved: (String val) => address = val,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          color: Colors.teal[100],
                          child: Text(
                            'Submit',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.red[900],
                              ),
                            ),
                          ),
                          onPressed: submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
