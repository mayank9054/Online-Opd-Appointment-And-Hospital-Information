import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class payment extends StatelessWidget {
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
            "Payment",
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
        child: Center(
          child: Text('This is Not Available',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
