import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhysicianDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        title: Text(
          "Physician",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: Text(
                  'DEPARTMENT',
                  style: GoogleFonts.balooBhai(
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Gastroenterology',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      // color: Color.fromRGBO(236,255,245,1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Positioned(
                        top: 25,
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/maled.png', height: 150),
                            // CircleAvatar(backgroundImage: AssetImage('assets/femaled.png'),radius: 50.0,),
                            SizedBox(height: 10),
                            Text(
                              'Dr. Ankur Dabhi',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            // SizedBox(height: 2),
                            Text(
                              'MBBS',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Time : 1 To 4 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      // color: Color.fromRGBO(236,255,245,1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/femaled.png', height: 150),
                          // CircleAvatar(backgroundImage: AssetImage('assets/femaled.png'),radius: 50.0,),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Milan Virani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 9 To 12 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'General Medicine',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Ramesh Radadiya',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 9 To 12 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/femaled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Kiran Virani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 4 To 7 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'General Surgery',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Naresh Patel',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 8 To 11 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Mukesh Paladiya',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 5 To 8 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Orthopaedics and Traumatology',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Ajay Kanani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 9 To 12 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/femaled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Bansi Sangani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 4 To 7 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Plastic Surgery',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Chirag Chovatiya',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 9 To 12 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Ramanik Hapani',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 5 To 8 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Psychiatry',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Yogesh Gajera',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'DPM',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 8 To 11 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/femaled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Krishna Kamani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 4 To 7 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Skin',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Ketan Gajera',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'DPM',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 9 To 1 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/femaled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Saroj Patel',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 4 To 7 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Surgery',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Bharat Sangani',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'DPM',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 10 To 12 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Bhavesh narola',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MBBS',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 2 To 5 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'TB & chest',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Kamlesh Dabhi',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MD',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 8 To 10 AM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Container(
                    width: (width / 2) - 10,
                    child: Card(
                      shadowColor: Colors.grey,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/maled.png', height: 150),
                          SizedBox(height: 10),
                          Text(
                            'Dr. Chetan Gondaliya',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'MD',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Time : 6 To 8 PM',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
