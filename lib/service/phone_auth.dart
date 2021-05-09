import 'package:care_hospital/pages/Loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:care_hospital/pages/Home.dart';
import 'package:care_hospital/pages/Formpage.dart';
import 'package:care_hospital/database/Databasemanager.dart';


class PhoneAuth {
  
  final String phoneNo;
  String verificationId;
  String errorMessage = '';
  dynamic userid;

  // For firebase auth
  final auth = FirebaseAuth.instance;
  final Databasemanager databasemanager = Databasemanager();
  PhoneAuth({this.phoneNo});

//verify phone
  Future<void> verifyPhone(BuildContext context) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      final res = await auth.signInWithCredential(phoneAuthCredential);
      // Todo After Verification Complete
      final User user = auth.currentUser; // this is for get user id
      userid = user.uid;  // this is save userid
      databasemanager.dataexists(context,userid);
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => Loading()));
    };

// verification failed
    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
     if(authException.code == "invalid-phone-number"){
       print('The provided phone number is not valid. ');
     }
    };

    // verification code sent
    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      print('verification id is $verificationId');
      this.verificationId = verificationId;
    };

    // verification code directly added
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    //verify phone number
    await auth.verifyPhoneNumber(
      // mobile no. with country code
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 20),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  signIn(context, {@required String smsOTP}) {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      auth.signInWithCredential(credential);

      // Todo After Verification Complete
      databasemanager.dataexists(context,userid);


    } catch (e) {
      print(e);
    }
  }

  void signout() {
    auth.signOut();
  }
}


