import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static String verifyId = "";
  //to send otp
  static Future sentOtp(
      {required String phone,
      required Function errorStep,
      required Function nextStep}) async {
    await _firebaseAuth
        .verifyPhoneNumber(
            timeout: Duration(seconds: 30),
            phoneNumber: "+91$phone",
            verificationCompleted: (PhoneAuthCredential) async {
              return;
            },
            verificationFailed: (error) async {
              return;
            },
            codeSent: (verificationId, forceResendingToken) async {
              verifyId = verificationId;
              nextStep();
            },
            codeAutoRetrievalTimeout: (verificationId) async {
              return;
            })
        .onError((error, stackTrace) {
      errorStep();
    });
  }

  // verify otp
  static Future loginWithOtp({required String otp}) async {
    final cred =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);

    try {
      final user = await _firebaseAuth.signInWithCredential(cred);
      if (user.user != null) {
        return "Success";
      } else {
        return "Error in OTP login";
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  // to logout
  static Future logout() async {
    await _firebaseAuth.signOut();
  }

  // tocheck whether the user is logged in or not
  static Future<bool> isLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }
}
