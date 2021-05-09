import 'dart:io';
import 'package:care_hospital/pages/dashboard/pdfview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class report extends StatefulWidget {
  var profileinfo;
  var userid;

  report({Key key, this.profileinfo, this.userid}) : super(key: key);

  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  var profileinfo, len, details;
  String downloadURL;
  bool loading = false;
  bool downloading = false;
  var progressString = "";

  void initState() {
    // TODO: implement initState
    super.initState();
    profileinfo = widget.profileinfo;
    details = profileinfo['report'];
    len = details.length;
  }

  Future<void> downloadFile(String imgUrl) async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(imgUrl, "${dir.path}/myimage.pdf",onReceiveProgress: (rec, total) {
        print('${dir.path}');
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    Widget Loading() {
      return Center(child: CircularProgressIndicator());
    }

    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(
          color: Colors.teal,
        ),
        title: Text(
          "Report",
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
        child: Stack(
            children: <Widget>[
              Container(
                child: ListView.builder(
                    itemCount: profileinfo['report'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: InkWell(
                          child: Icon(Icons.download_sharp),
                          onTap: () {
                            int con = index;
                            con++;
                            downloadFile(profileinfo['report']['$con']);
                          },
                        ),
                        title: Text("$index.pdf"),
                        leading: Icon(Icons.picture_as_pdf),
                        onTap: () {
                          int con = index;
                          con++;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  pdfview(profileinfo['report']['$con']),
                            ),
                          );
                        },
                      );
                    }),
              ),
              //Stack(
              // children: <Widget>[
              Center(
                child: downloading
                    ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Downloading File: $progressString",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                    : Text(''),
              ),
              //  ],
              //)
            ]),
      ),
    );
  }


}
