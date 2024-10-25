import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  ApiController authentication = Get.put(ApiController());
  ApiController apiController = Get.put(ApiController());
  TextEditingController _otpController = TextEditingController();
///////////////////
  OtpFieldController otpControllers = OtpFieldController();
///////////////////
  var phoneNumber = Get.arguments;
  String? selectedValue;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    setState(() {
      authentication.timerOn.value = true;
    });
    debugPrint("hi");
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          setState(() {
            authentication.timerOn.value = false;
          });
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Kwhite,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: KTextdark,
            ),
          ),
        ),
        backgroundColor: Kwhite,
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Verification Code",
                    style: GoogleFonts.roboto(
                        fontSize: 30.sp, color: kbloodred, fontWeight: kFW600),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Please Enter Verification Code sent to +91 ${phoneNumber}",
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KText,
                        fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: OTPTextField(
                      controller: otpControllers,
                      // controller: _otpController.text,
                      otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor: Ktextcolor,
                          focusBorderColor: kbloodred),
                      length: 6,
                      width: double.infinity,
                      fieldWidth: 35.w,
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      margin: EdgeInsets.only(right: 8.w),
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 10,
                      style: GoogleFonts.roboto(
                          fontSize: kEighteenFont,
                          fontWeight: kFW500,
                          color: kbloodred),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (pin) {
                        setState(() {
                          _otpController.text = pin;
                        });
                        print("Completed: " + pin);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: RichText(
                      textScaleFactor: 1,
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: "Resending OTP in  ",

                        style: GoogleFonts.roboto(
                            fontSize: kTwelveFont,
                            color: KText,
                            fontWeight: kFW500),
                        // GoogleFonts.roboto(
                        //   fontSize: kTwentyFont,
                        //   fontWeight: FontWeight.bold,
                        //   color: selectedTheme == "Lighttheme"
                        //       ? KdarkText
                        //       : Kwhite,
                        // ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_seconds" + " s",
                            style: GoogleFonts.roboto(
                                fontSize: kTwelveFont,
                                color: KdarkText,
                                fontWeight: kFW500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          authentication.timerOn.value = true;
                        });
                        Get.back();
                        //  Get.toNamed(kMobileSignUp);
                      },
                      child: Text(
                        "Wrong Number ?",
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            color: kbloodred,
                            fontWeight: kFW500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 95.h,
                  ),
                  Center(
                      child: Text(
                    "Didn’t receive the OTP?",
                    style: GoogleFonts.roboto(
                        fontSize: kTwelveFont,
                        color: KText,
                        fontWeight: kFW500),
                  )),
                  SizedBox(
                    height: 15.h,
                  ),
                  authentication.timerOn == false
                      ? Center(
                          child: InkWell(
                            onTap: () async {
                              var payload = {"mobile": phoneNumber};
                              apiController.mobileRegistration(payload);
                              // AuthService.sentOtp(
                              //     phone: phoneNumber,
                              //     errorStep: () => Fluttertoast.showToast(
                              //           msg: "Error in sending OTP",
                              //         ),
                              //     nextStep: () => Get.toNamed(kOtpScreen,
                              //         arguments: phoneNumber));
                              Fluttertoast.showToast(
                                msg: "Sent Successfully",
                              );
                              setState(() {
                                apiController.isLoadings.value = false;
                              });

                              ;

                              //     Get.toNamed(kOtpScreen);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/recycle.png",
                                  height: 16.h,
                                  color: kbloodred,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  "Resend ?",
                                  style: GoogleFonts.roboto(
                                      fontSize: kFourteenFont,
                                      color: kbloodred,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/recycle.png",
                                height: 16.h,
                                color: KText,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "Resend ?",
                                style: GoogleFonts.roboto(
                                    fontSize: kFourteenFont,
                                    color: KText,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Obx(() => authentication.loginsLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: kbloodred,
                          ),
                        )
                      : CustomButton(
                          borderRadius: BorderRadius.circular(10.r),
                          Color: kbloodred,
                          textColor: Kwhite,
                          height: 42.h,
                          width: double.infinity,
                          label: "Verify",
                          fontSize: kSixteenFont,
                          fontWeight: kFW500,
                          isLoading: false,
                          onTap: () async {
                            // if (_otpController.text != "") {
                            //   AuthService.loginWithOtp(otp: _otpController.text)
                            //       .then((value) {
                            //     if (value == "Success") {
                            //       Fluttertoast.showToast(
                            //         msg: "SignIn Successfully",
                            //       );
                            //       var payload = {
                            //         "mobile": phoneNumber,

                            //       };

                            //   authentication.logins(payload);

                            //     } else {

                            //       Fluttertoast.showToast(
                            //         msg: value,
                            //       );
                            //     }
                            //   });
                            // } else {
                            //   Fluttertoast.showToast(
                            //     msg: "Please Enter OTP",
                            //   );
                            // }
                            if (_otpController.text != "") {
                              var payload = {
                                "mobile": phoneNumber,
                                "otp": _otpController.text
                              };

                              /// {"mobile":phoneNumber};
                              apiController.otpRegistration(payload);
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please Enter OTP",
                              );
                            }
                          },
                        )),
                ],
              ),
            ),
          ),
        ));
  }
}
