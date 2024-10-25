import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Are you sure?',
          style: GoogleFonts.roboto(
              fontSize: kEighteenFont, fontWeight: kFW600, color: KdarkText),
        ),
        content: Text(
          'Do you want to exit an App',
          style: GoogleFonts.roboto(
              fontSize: 13.sp, fontWeight: kFW600, color: KlightText),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'No',
              style: GoogleFonts.roboto(
                  fontSize: kTwelveFont, fontWeight: kFW600, color: KdarkText),
            ),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text(
              'Yes',
              style: GoogleFonts.roboto(
                  fontSize: kTwelveFont, fontWeight: kFW600, color: KdarkText),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: Kwhite,
          body: Container(
            margin: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/bloodbank.png",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome to",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp, color: KdarkText, fontWeight: kFW600),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nuhvin Blood Bank",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        fontSize: 30.sp, color: kbloodred, fontWeight: kFW600),
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(10.r),
                  Color: KTextgery,
                  textColor: Kwhite,
                  height: 42.h,
                  width: double.infinity,
                  label: "Login as Admin",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () {
                    Get.toNamed(kAdminSignIn);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(10.r),
                  Color: kblack,
                  textColor: Kwhite,
                  height: 42.h,
                  width: double.infinity,
                  label: "Register as Donor",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () {
                    Get.toNamed(kDonorSignUp);
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(10.r),
                  Color: kbloodred,
                  textColor: Kwhite,
                  height: 42.h,
                  width: double.infinity,
                  label: "Find a Blood Donor",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () async {
                    //  Get.toNamed(kFindDonor);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
