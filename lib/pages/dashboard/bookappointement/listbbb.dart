import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class listb extends StatefulWidget {
  final data;
  listb({Key key, this.data}) : super(key: key);
  @override
  _listbState createState() => _listbState();
}

class _listbState extends State<listb> {
  var data;
  int len;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.data;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data['history'].length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${data['history']['${++index}']}",
            style: GoogleFonts.balooBhai(
              fontSize: 25.0,
              color: Colors.deepOrange,
            ),),
          );
        });
  }
}
