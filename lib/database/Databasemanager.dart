import 'package:care_hospital/pages/Formpage.dart';
import 'package:care_hospital/pages/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:care_hospital/pages/Loading.dart';

class Databasemanager {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var profileinfo ;
  Map report = {};

  Future<void> Storedata(context, String firstname, String lastname, String email, int phone, String dob, String gender,String address, double weight, double height, dynamic uid) async {
    await FirebaseFirestore.instance.collection('profile').doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phone,
      'email': email,
      'dob': dob,
      'gender': gender,
      'weight': weight,
      'height': height,
      'address': address,
      'report' : report,
      'uid' : uid,
    }).whenComplete(() {
      print("fn $firstname \n ln $lastname \n email $email \n gen $gender \n dob $dob \n add $address \n weg $weight \n he $height");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loading()));
    });
  }
  int cont = 0;
   Future<bool> dataexists(context,dynamic userid)  async {
    var result = null;
       await firestore.collection('profile').doc(userid).get().then((docSnapshot) async {
        print('!!!!!!!!!!!!!!!!!!!!!!!${docSnapshot.exists}');
         result = await docSnapshot.exists;
        if(docSnapshot.exists){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return Loading(); //home
          }));
        }else{
          if(cont == 5) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) {
              return FormPage(userid: userid); // pass userid on formpage
            }));
          }else {
            cont++;
            dataexists(context, userid);
          }

        }
      });


  }

  Readdata(userid) async {
    profileinfo =  await FirebaseFirestore.instance.collection('profile').doc(userid).get().then((DocumentSnapshot documentSnapshot) async{
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        return documentSnapshot.data();
      } else {
        print('Document does not exist on the database');
      }
    });
    return profileinfo;
  }

  // Getprofileinfo() {
    // if(profileinfo != null) {
    //   print('getprofil in  !!!!!!!!!!!!!!! $profileinfo');
    //   return  profileinfo;
    // }else{
    //   print('getprofil in  !!!!!!!!!!!!!!! $profileinfo');
    //   CircularProgressIndicator(
    //     backgroundColor: Colors.redAccent,
    //     strokeWidth: 10.0,
    //   );
    // }

  }


