import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysicianProfile extends StatelessWidget {
  final profileinfo;
  final userid;
  PhysicianProfile({Key key, this.profileinfo, this.userid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 22.0,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/${profileinfo['gender']}.png'),
                      radius: 70.0,
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'Name : ${profileinfo['firstname']} ${profileinfo['lastname']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Number :  ${profileinfo['phonenumber']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  // Divider(),
                  SizedBox(height: 20.0),
                  Text(
                    'Gender :  ${profileinfo['gender']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Email : ${profileinfo['email']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  // Divider(),
                  SizedBox(height: 20.0),
                  Text(
                    'Date Of Birth :  ${profileinfo['dob']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Weight :  ${profileinfo['weight']}(KG)',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  // Divider(),
                  SizedBox(height: 20.0),
                  Text(
                    'Height :  ${profileinfo['height']}(CM)',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Address :  ${profileinfo['address']}',
                    style: GoogleFonts.lato(
                      textStyle: _textStyle(),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
 TextStyle _textStyle(){
    return TextStyle(
      fontSize: 20.0,
      color: Colors.grey[600],
    );
  }
}
