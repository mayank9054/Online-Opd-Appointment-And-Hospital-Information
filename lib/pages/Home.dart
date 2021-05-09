import 'package:care_hospital/database/Databasemanager.dart';
import 'package:care_hospital/pages/Login.dart';
import 'package:care_hospital/pages/dashboard/Aboutus.dart';
import 'package:care_hospital/pages/dashboard/bookappointement/bookappointment.dart';
import 'package:care_hospital/pages/dashboard/payment.dart';
import 'package:care_hospital/pages/dashboard/physiciandetails.dart';
import 'package:care_hospital/pages/dashboard/report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:care_hospital/pages/dashboard/physicianprofile.dart';

class Home extends StatefulWidget {
  final profileinfo;
  final userid;

  Home({Key key, this.profileinfo, this.userid}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final Databasemanager db = Databasemanager();

class _HomeState extends State<Home> {
  String userid, name, logo;
  var profileinfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileinfo = widget.profileinfo;
    userid = widget.userid;
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$profileinfo');
    name = profileinfo['firstname'] + ' ' + profileinfo['lastname'];
    logo = profileinfo['gender'];
  }

  Future<void> signout() async {
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text(''),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Do you want to Log out ?',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancle'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: signout,
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor:Colors.white,
        iconTheme: IconThemeData(
          color: Colors.red[900],
        ),
        title: Text(
          'DASHBOARD',
          style: TextStyle(
            color: Colors.red[900],
            fontSize: 22.0,
          ),
        ),
        elevation: 0,
        actions: [
          RaisedButton(
              onPressed: showMyDialog,
            child: Icon(
              Icons.logout,
            ),
            color:Colors.white,
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.teal[300],
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             CircleAvatar(
      //               backgroundImage:
      //                   AssetImage('assets/${profileinfo['gender']}.png'),
      //               radius: 50.0,
      //             ),
      //             SizedBox(height: 10.0),
      //             Text(
      //               ' $name',
      //               style: TextStyle(
      //                 fontSize: 20.0,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return Home(profileinfo: profileinfo, userid: userid);
      //           }));
      //         },
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.home,
      //             size: 30.0,
      //           ),
      //           title: Text(
      //             'Home',
      //             style: TextStyle(
      //               fontSize: 20.0,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Divider(),
      //       InkWell(
      //         onTap: showMyDialog,
      //         child: ListTile(
      //           leading: Icon(
      //             Icons.logout,
      //             size: 30.0,
      //           ),
      //           title: Text(
      //             'Logout',
      //             style: TextStyle(
      //               fontSize: 20.0,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            padding: EdgeInsets.all(8),
            crossAxisSpacing: 7,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookAppointment(
                        profileinfo: profileinfo, userid: userid);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 80.0,
                        color: Colors.black87,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Book\n Appointmemt',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return payment();
                  }));
                },
                child: Container(
                  // width: 48.0,
                  // height: 10.0,
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage('assets/payment.png'),
                        width: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Payment',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Aboutus();
                  }));
                },
                child: Container(
                  // width: 48.0,
                  // height: 10.0,
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage('assets/services.png'),
                        width: 135.0,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'About US',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return report(
                      profileinfo: profileinfo,
                      userid: userid,
                    );
                  }));
                },
                child: Container(
                  // width: 48.0,
                  // height: 10.0,
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage('assets/report.png'),
                        width: 80.0,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Pathology \nReport',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PhysicianDetails();
                  }));
                },
                child: Container(
                  // width: 48.0,
                  // height: 10.0,
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage('assets/profile.png'),
                        width: 80.0,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Physician \nDetails',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PhysicianProfile(
                      profileinfo: profileinfo,
                      userid: userid,
                    );
                  }));
                },
                child: Container(
                  // width: 48.0,
                  // height: 10.0,
                  padding: EdgeInsets.all(8),
                  decoration: _boxDecoration(),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Image(
                        image: AssetImage('assets/profile.png'),
                        width: 80.0,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Patient \nProfile',
                        textAlign: TextAlign.center,
                        style: _textStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[350],
          blurRadius: 10.0,
        ),
      ],
      color: Colors.white,
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: Colors.black87,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }
}
