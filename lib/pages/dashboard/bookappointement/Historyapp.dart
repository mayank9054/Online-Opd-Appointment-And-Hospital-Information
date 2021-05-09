import 'package:care_hospital/pages/dashboard/bookappointement/listbbb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Historyapp extends StatefulWidget {
  final userid;
  Historyapp({Key key,this.userid}) : super(key:key);
  @override
  _HistoryappState createState() => _HistoryappState();

}

class _HistoryappState extends State<Historyapp> {
  final _formkey = GlobalKey<FormState>();
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
  String _error = "";
  String data = "";
  String uid;
  void _showhlist(dynamic hist) {
    showModalBottomSheet(context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) {
      return Container(

        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: listb(data: hist),
      );
    });
  }

  searchhistory() async {
    DocumentReference datatata = await FirebaseFirestore.instance.collection('$_currentdepartment').doc(uid);
    datatata.get().then((docSnapshot){
      if(docSnapshot.exists){
        var hist = docSnapshot.data();

        _showhlist(hist);
      }else
        {
          setState(() {
            data = "No Data Found";
          });

        }
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = widget.userid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              child: Column(
                key: _formkey,
                children: <Widget>[
                  SizedBox(height: 20),
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
                  SizedBox(height: 5),
                  Text(
                    '$_error',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: MaterialButton(
                      height: 30.0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      color: Colors.grey[100],
                      child: Text(
                        'Search',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.red[900],
                          ),
                        ),
                      ),
                      onPressed: () {
                       setState(() {
                          if ((_currentdepartment == '-- Select Department -- ' || _currentdepartment == null) ) {
                            _error = "Please Select department";
                          } else{
                            _error = "";
                            searchhistory();
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Text('$data',
                    style: GoogleFonts.balooBhai(
                      textStyle: TextStyle(
                        fontSize: 35,
                        color: Colors.red,
                      ),
                    ),
                    ),
                  )
                  // Container(
                  //   child: listb(),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
