import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
// import 'package:phone_verification/phone_verification.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;
  final ConversionController controller = Get.put(ConversionController());
  ApiController authentication = Get.put(ApiController());
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: GoogleFonts.roboto(
                  fontSize: kEighteenFont,
                  fontWeight: kFW600,
                  color: Ktextcolor),
            ),
            content: Text(
              'Do you want to exit this App',
              style: GoogleFonts.roboto(
                  fontSize: 13.sp, fontWeight: kFW600, color: KText),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: KdarkText),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: kbloodred),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Kwhite,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: 20.w, right: 20.w, bottom: 20.h, top: 50.h),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///////////////////////////////////////////////////////////////////////////////////////////////
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Sign In",
                    style: GoogleFonts.roboto(
                        fontSize: 30.sp, color: kbloodred, fontWeight: kFW600),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Text(
                    "Please enter your  Phone Number to login into your account",
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KText,
                        fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),

                  CustomFormFields(
                    labelColor: KText,
                    enabled: true,
                    controller: authentication.loginMobileController,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    fontSize: kFourteenFont,
                    fontWeight: FontWeight.w500,
                    hintText: "Enter Mobile Number",
                    maxLines: 1,
                    readOnly: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Mobile Number';
                      }
                      return null;
                    },
                    label: 'Mobile Number',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  SizedBox(
                    height: 80.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(kSignUpScreen);
                      },
                      child: RichText(
                        textScaleFactor: 1,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Don't Have an account ? ",
                          style: GoogleFonts.roboto(
                            fontSize: kTwelveFont,
                            fontWeight: kFW500,
                            color: KText,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Signup Now",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: KText,
                                  fontWeight: kFW600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(
                    () => authentication.loginsLoading == true
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
                            label: "Sign In",
                            fontSize: kSixteenFont,
                            fontWeight: kFW500,
                            isLoading: false,
                            onTap: () {
                              var payload = {
                                "mobile":
                                    authentication.loginMobileController.text,
                                //  "8297297247"
                              };
                              if (_formKey.currentState!.validate()) {
                                authentication.loginSignin(payload);
                              }
                            }),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(kMobileSignUp);
                      },
                      child: RichText(
                        textScaleFactor: 1,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "Login with  ",
                          style: GoogleFonts.roboto(
                            fontSize: kTwelveFont,
                            fontWeight: kFW500,
                            color: KText,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Mobile Number OTP",
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  color: KText,
                                  fontWeight: kFW600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget buildRow(
//     TextEditingController mlController, TextEditingController unitController) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       children: [
//         SizedBox(
//           width: 120.w,
//           child: CustomFormFields(
//             labelColor: KText,
//             enabled: true,
//             controller: mlController,
//             keyboardType: TextInputType.number,
//             obscureText: false,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//             fontSize: kFourteenFont,
//             fontWeight: FontWeight.w500,
//             hintText: "Enter Quantity (ml)",
//             maxLines: 1,
//             readOnly: false,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter Quantity';
//               }
//               return null;
//             },
//             label: 'Quantity',
//           ),
//         ),
//         // Expanded(
//         //   child: TextFormField(
//         //     controller: mlController,
//         //     // decoration: InputDecoration(
//         //     //   labelText: 'Millilitres (ml)',
//         //     // ),
//         //     keyboardType: TextInputType.number,
//         //   ),
//         // ),
//         SizedBox(width: 16),
//         SizedBox(
//           width: 120.w,
//           child: CustomFormFields(
//             labelColor: KText,
//             enabled: true,
//             controller: unitController,
//             keyboardType: TextInputType.number,
//             obscureText: false,
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//             fontSize: kFourteenFont,
//             fontWeight: FontWeight.w500,
//             hintText: "Enter Quantity (ml)",
//             maxLines: 1,
//             readOnly: false,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter Quantity';
//               }
//               return null;
//             },
//             label: 'Quantity',
//           ),
//         ),
//         // Expanded(
//         //   child: TextFormField(
//         //     controller: unitController,
//         //     // decoration: InputDecoration(
//         //     //   labelText: 'Units',
//         //     // ),
//         //     keyboardType: TextInputType.number,
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }
