import 'package:care_hospital/pages/Home.dart';
import 'package:care_hospital/pages/dashboard/bookappointement/Historyapp.dart';
import 'package:care_hospital/pages/dashboard/loading1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


class BookAppointment extends StatefulWidget {
  final profileinfo;
  final userid;


  BookAppointment({Key key, this.profileinfo, this.userid}) : super(key: key);
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final _formKey = GlobalKey<FormState>();
  dynamic profileinfo;
  dynamic userid;
 final String Gastroenterologynam1 = "Dr. Ankur Dabhi";
 final String Gastroenterologyti1 = "Time : 1 To 4 PM";

  final String Gastroenterologynam2 = "Dr. Milan Virani";
  final String Gastroenterologyti2 = "Time : 9 To 12 AM";

  final String GeneralMedicinename1 = "Dr. Ramesh Radadiya";
  final String GeneralMedicineti1 = "Time : 9 To 12 AM";

  final String GeneralMedicinename2 = "Dr. Kiran Virani";
  final String GeneralMedicineti2 = "Time : 4 To 7 PM";

  final String GeneralSurgeryname1 = "Dr. Naresh Patel";
  final String GeneralSurgeryti1 = "Time : 8 To 11 AM";

  final String GeneralSurgeryname2 = "Dr. Mukesh Paladiya";
  final String GeneralSurgeryti2 = "Time : 5 To 8 PM";

  final String OrthopaedicsandTraumatologyname1 = "Dr. Ajay Kanani";
  final String OrthopaedicsandTraumatologyti1 = "Time : 9 To 12 AM";

  final String OrthopaedicsandTraumatologyname2 = "Dr. Bansi Sangani";
  final String OrthopaedicsandTraumatologyti2 = "Time : 4 To 7 PM";

  final String PlasticSurgeryname1 = "Dr. Chirag Chovatiya";
  final String PlasticSurgeryti1 = "Time : 9 To 12 AM";

  final String PlasticSurgeryname2 = "Dr. Ramanik Hapani";
  final String PlasticSurgeryti2 = "Time : 5 To 8 PM";

  final String Psychiatryname1 = "Dr. Yogesh Gajera";
  final String Psychiatryti1 = "Time : 8 To 11 AM";

  final String Psychiatryname2 = "Dr. Krishna Kamani";
  final String Psychiatryti2 = "Time : 4 To 7 PM";

  final String Skinname1 = "Dr. Ketan Gajera";
  final String Skinti1 = "Time : 9 To 1 AM";

  final String Skinname2 = "Dr. Saroj Patel";
  final String Skinti2 = "Time : 4 To 7 PM";

  final String Surgeryname1 = "Dr. Bharat Sangani";
  final String Surgeryti1 = "Time : 10 To 12 AM";

  final String Surgeryname2 = "Dr. Bhavesh narola";
  final String Surgeryti2 = "Time : 2 To 5 PM";

  final String TBchestname1 = "Dr. Kamlesh Dabhi";
  final String TBchestti1 = "Time : 8 To 10 AM";

  final String TBchestname2 = "Dr. Chetan Gondaliya";
  final String TBchestti2 = "Time : 6 To 8 PM";

  String docname1,docname2,docti1,docti2,mailname,mailetime;



  Map History = {};
  String _error = "";
  int available = -1;
  bool loading = false;
  bool show = false;


  final List<String> department = [
    '-- Select Department -- ',
    'Gastroenterology',
    'General Medicine',
    'General Surgery',
    'Orthopaedics and Traumatology',
    'Plastic Surgery',
    'Psychiatry',
    'Skin',
    'Surgery',
    'TB & chest',
  ];
  String _currentdepartment;
  String result;
  String formattedbook;
  DateTime dateTime;
  List<String> recipents = [];

  availableslot() async {

    if (_currentdepartment != null && _currentdepartment != '-- Select Department -- ') {
      setState(() {loading = true;show = true;});
      await FirebaseFirestore.instance
          .collection('$_currentdepartment')
          .where("date", isEqualTo: formattedbook)
          .get()
          .then((docSnapshot) async {
        available = await docSnapshot.size;
        setState(() {
          print('!!@@##%%^^&&** $available');
          if (available >= 10) {
            result = "Not slot Available Please Select Another Date";
          } else {
            int available1 = 10 - available;
            available = available1;
            print('!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@###################%%%%$result');
            result = "$available1";
            print('!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@###################%%%%%%%%%%%%%%%%%%%%%%%%%%%%$result');
          }
          loading = false;
          if(_currentdepartment == "Gastroenterology"){
            docname1 = Gastroenterologynam1;
            docname2 = Gastroenterologynam2;
            docti1 = Gastroenterologyti1;
            docti2 = Gastroenterologyti2;
          }else if( _currentdepartment == "General Medicine"){
            docname1 = GeneralMedicinename1;
            docname2 = GeneralMedicinename2;
            docti1 = GeneralMedicineti1;
            docti2 = GeneralMedicineti2;
          }else if(_currentdepartment == "General Surgery") {
            docname1 = GeneralSurgeryname1;
            docname2 = GeneralSurgeryname2;
            docti1 = GeneralSurgeryti1;
            docti2 = GeneralSurgeryti2;
          }else if(_currentdepartment == "Orthopaedics and Traumatology") {
            docname1 = OrthopaedicsandTraumatologyname1;
            docname2 = OrthopaedicsandTraumatologyname2;
            docti1 = OrthopaedicsandTraumatologyti1;
            docti2 = OrthopaedicsandTraumatologyti2;
          }else if(_currentdepartment == "Plastic Surgery") {
            docname1 = PlasticSurgeryname1;
            docname2 = PlasticSurgeryname2;
            docti1 = PlasticSurgeryti1;
            docti2 = PlasticSurgeryti2;
          }else if(_currentdepartment == "Psychiatry"){
            docname1 = Psychiatryname1;
            docname2 = Psychiatryname2;
            docti1 = Psychiatryti1;
            docti2 = Psychiatryti2;
          }else if (_currentdepartment == "Skin") {
            docname1 = Skinname1;
            docname2 = Skinname2;
            docti1 = Skinti1;
            docti2 = Skinti2;
          }else if (_currentdepartment == "Surgery") {
            docname1 = Surgeryname1;
            docname2 = Surgeryname2;
            docti1 = Surgeryti1;
            docti2 = Surgeryti2;
          }else {
            docname1 = TBchestname1;
            docname2 = TBchestname2;
            docti1 = TBchestti1;
            docti2 = TBchestti2;
          }

          if(available > 5){
            mailname = docname1;
            mailetime = docti1;
          }else {
            mailname = docname2;
            mailetime = docti2;
          }
        });

      });
    }
  }


  void datetimeresult() {
    DateTime nowbook = dateTime;
    DateFormat formatterbook = DateFormat('yyyy-MM-dd');
    formattedbook = formatterbook.format(nowbook);
  }


  Future<void> sendbookin() async {
    setState(() {
      loading = true;
    });
    DocumentReference datatata = await FirebaseFirestore.instance.collection('$_currentdepartment').doc(userid);
    var dadada = datatata.get().then((docSnapshot) async {
      print('datadfdatadfdtaftaafda$datatata');
        if(docSnapshot.exists){
          var d =  docSnapshot.data();
          int len = d['history'].length;
          print('QWERRTYUIOLKJHBN$len');
          len++;
          d['history'].addAll({'$len' : formattedbook});
          await datatata.update({
            'date' : formattedbook,
            'history' : d['history'],
          }).whenComplete(() {
            sendMail();
            setState(() {
              _currentdepartment = null;
              formattedbook = " ";
              result = null;
              loading = false;
              show = false;
            });

            // _sendSMS('Your Appointment is Book \n Name : ${profileinfo['firstname']} ${profileinfo['lastname']} \n date : ${formattedbook} \n For Any Query Contact +91 1234567890', recipents);
            showMyDialog();
          });

      }else {
          History.addAll({'1': formattedbook});
          await datatata.set({
            'name': '${profileinfo['firstname']} ${profileinfo['lastname']}',
            'date': formattedbook,
            'phonenumber': profileinfo['phonenumber'],
            'history' : History,
          }).whenComplete(() {
            print('$_currentdepartment &&&&&&&& $formattedbook');
            sendMail();
            setState(() {
              _currentdepartment = null;
              formattedbook = " ";
              result = null;
              loading = false;
              show = false;
            });
           // _sendSMS("Your Appointment is Book \n Name : ${profileinfo['firstname']} ${profileinfo['lastname']} \n date : $formattedbook \n For Any Query Contact +91 1234567890", recipents);
            showMyDialog();
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            //   return Home(
            //     profileinfo: profileinfo,
            //     userid: userid,
            //   );
            // }));
          });
      }
    });


  }

  sendMail() async {
    String username = ''; // Here Enter your Email From which you want to send Email
    String password = ''; // Here enter your emial password

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('${profileinfo['email']}')
//      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Confirmation of your appointment'
      ..text = 'This is the plain text.\nThis is line 2 of the text part. \nThis is line 3 of the text part.'
      ..html = "<h3>Dear ${profileinfo['firstname']} , </h3>\n<p> <b> Thank you for Booking Online Appointment! </b> </p> \n <p> <h2> Your appointment is confirmed For $mailname on $formattedbook at $mailetime. </h2> </p> \n <p> <b>Hope you dont miss the appointment! </b></p> \n <p>Thanks & Regards !</p> \n <p>Healing Hands..</p> \n <p>Be Happy.Be healthy</p>" ;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableslot();
    profileinfo = widget.profileinfo;
    userid = widget.userid;
    recipents.add('${profileinfo['phonenumber']}');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    formattedbook = null;
    result = null;

  }

  // void _sendSMS(String message, List<String> recipents) async {
  //   print('SMSMSMSMSMSMSMSMSMSMSMSM$message------09876512345678$recipents');
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }

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
                  'Your Appointment is Book',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Container doctordetail() {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Text("Physican Details",
                  style: GoogleFonts.balooBhai(
                    textStyle: TextStyle(
                      color: Colors.cyan[400],
                      fontSize: 25.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13,7,0,7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$docname1',
                      style: GoogleFonts.balooBhai(
                        textStyle: TextStyle(
                        fontSize: 18,
                          color: Colors.teal
                        ),
                      ),
                      ),
                      SizedBox(height: 5),

                      Text('$docti1',
                        style: GoogleFonts.balooBhai(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                          ),
                        ),)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13,7,0,7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$docname2',
                        style: GoogleFonts.balooBhai(
                          textStyle: TextStyle(
                            fontSize: 18,
                              color: Colors.teal,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),

                      Text('$docti2',
                        style: GoogleFonts.balooBhai(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                          ),
                        ),)
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),

      );
    }



    void _showhistory() {
      showModalBottomSheet(context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Historyapp( userid : userid),
        );
      });
    }

    return loading ? Loading1() :  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        title: Text(
          "Book Appointment",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 20.0,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'Patient Name : ${profileinfo['firstname']} ${profileinfo['lastname']}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[400],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        DropdownButtonFormField(
                          value: _currentdepartment ?? '-- Select Department -- ',
                          decoration: InputDecoration(
                            fillColor: Colors.grey[50],
                            filled: true,
                            contentPadding: EdgeInsets.all(12.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                            ),
                          ),
                          items: department.map((department) {
                            return DropdownMenuItem(
                              value: department,
                              child: Text('$department '),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentdepartment = val),
                        ),
                        SizedBox(height: 10.0),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Appointment Date :",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.black,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate:
                                    DateTime.now().add(Duration(days: 1)),
                                    firstDate:
                                    DateTime.now().add(Duration(days: 1)),
                                    lastDate:
                                    DateTime.now().add(Duration(days: 30)),
                                  ).then((date) {
                                    setState(() {
                                      dateTime = date;
                                      datetimeresult();
                                      availableslot();
                                      // result = "$available";
                                    });
                                  });
                                },
                              ),
                              Text(
                                dateTime == null ? "" : formattedbook,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Text(
                              'Available Slot : ',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                            ),
                            Text(
                              result == null ? "" : "$available",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 25.0),
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                MaterialButton(
                                  minWidth: width/4,
                                  height: 30.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                  color: Colors.blueGrey[50],
                                  child: Text('History',
                                    style: GoogleFonts.lato(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),),
                                  onPressed: _showhistory,
                                ),
                                SizedBox(width: 15),
                                MaterialButton(
                                  minWidth: width/3,
                                  height: 30.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  color: Colors.teal[100],
                                  child: Text(
                                    'Confirm',
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        color: Colors.red[900],
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if ((_currentdepartment == '-- Select Department -- ' || _currentdepartment == null) && formattedbook == null) {
                                        _error = "Please Select date and department";
                                      } else if (formattedbook == null) {
                                        _error = "Please Select Date";
                                      } else if(_currentdepartment == '-- Select Department -- ' || _currentdepartment == null){
                                        _error = "Please Select Department";
                                      }else{
                                        _error = "";
                                        sendbookin();
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '$_error',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.red,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: show ? doctordetail() : Image.asset('assets/hospital.png',
                    width: width,
                      height: 250,
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}



