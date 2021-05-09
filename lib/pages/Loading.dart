import 'package:care_hospital/database/Databasemanager.dart';
import 'package:care_hospital/pages/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  // final String userid;
  // Loading({key,this.userid}) : super(key: key);
  @override
  _LoadingState createState() => _LoadingState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
final Databasemanager db = Databasemanager();

class _LoadingState extends State<Loading> {



 var userid;
 var profileinfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    userid = user.uid;
    getinfo();
  }

 getinfo()  async {
   profileinfo  =  await db.Readdata(userid);
  print('!!!!@@@@@@@@@@###########%%%%%%%%%%%${profileinfo}');
  if(profileinfo == null){
    print("!!!! NO DATA FOUND!!!!!");
    db.dataexists(context,userid);
  }else {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) =>
            Home(profileinfo: profileinfo, userid: userid)));
  }

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitCircle(
          color: Colors.teal[600],
          size: 75.0,
        ),
      ),
    );
  }
}
