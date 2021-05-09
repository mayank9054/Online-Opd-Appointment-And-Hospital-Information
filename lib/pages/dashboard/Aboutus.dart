import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatelessWidget {
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
          "About US",
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
            SizedBox(height: 20.0),
            Center(
              child: Text('Contact Us',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.phone, size: 40,color: Colors.teal,),
                      title: Text(
                          'Give us a Call',
                          style: TextStyle(fontSize: 15.0,color: Colors.black)
                      ),
                      subtitle: Text(
                          '+91-9055447788',
                          style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[700])
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.mail_outline, size: 40,color: Colors.red[400],),
                      title: Text(
                          'Send us a Message',
                          style: TextStyle(fontSize: 14.0,color: Colors.black)
                      ),
                      subtitle: Text(
                          'carehopital1212@gmail.com',
                          style: TextStyle(fontSize: 16.0,color: Colors.blueGrey[700])
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, size: 40,color: Colors.red[400],),
                      title: Text(
                          'Visit our location',
                          style: TextStyle(fontSize: 15.0,color: Colors.black)
                      ),
                      subtitle: Text(
                          'Surat',
                          style: TextStyle(fontSize: 20.0,color: Colors.blueGrey[700])
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Center(
              child: Text('Department',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
              child: Container(
                width: width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2.0,
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Gastroenterology',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('General Medicine',
                        style: TextStyle(
                            color: Colors.grey[800],
                          fontSize: 20.0
                        ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('General Surgery',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Orthopaedics and Traumatology',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Plastic Surgery',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Psychiatry ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Skin ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Surgery ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('TB & chest',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 20.0
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}
