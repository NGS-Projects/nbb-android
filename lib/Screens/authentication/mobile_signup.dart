import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class MobileSignUp extends StatefulWidget {
  const MobileSignUp({super.key});

  @override
  State<MobileSignUp> createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  ApiController apiController = Get.put(ApiController());
  TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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

  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Kwhite,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: 20.w, right: 20.w, bottom: 20.h, top: 80.h),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(kSignInScreen);
                    },
                    child: Text(
                      "Mobile Verification",
                      style: GoogleFonts.roboto(
                          fontSize: 28.sp,
                          color: kbloodred,
                          fontWeight: kFW600),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Enter Mobile Number to continue into the app..",
                    // "Enter your mobile number on the screen for quick and secure account access.",
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KText,
                        fontWeight: kFW400),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormFields(
                    labelColor: KText,
                    enabled: true,
                    controller: _phoneController,
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
                    height: 90.h,
                  ),
                  Obx(() => apiController.mobileRegistrationLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: kbloodred,
                          ),
                        )
                      : CustomButton(
                          margin: EdgeInsets.only(top: 50.h),
                          borderRadius: BorderRadius.circular(10.r),
                          Color: kbloodred,
                          textColor: Kwhite,
                          height: 42.h,
                          width: double.infinity,
                          label: "Send",
                          fontSize: kSixteenFont,
                          fontWeight: kFW500,
                          isLoading: false,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              var payload = {"mobile": _phoneController.text};
                              apiController.mobileRegistration(payload);
                            }
                            ;

                            //     Get.toNamed(kOtpScreen);
                          },
                        )
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
