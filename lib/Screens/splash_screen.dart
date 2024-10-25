import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ApiController apiController = Get.put(ApiController());
  bool? isUserLoggedIn;
  @override
  void initState() {
    super.initState();

    ////////////////////////////// orgcode
    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    Future.delayed(const Duration(seconds: 2), () async {
      // Get.toNamed(KFriendsDashboard);
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        await apiController.getProfile();

        apiController.profileData["employeeType"] == "Donor"
            ? Get.toNamed(kDonorBottomNavigation)
            : Get.toNamed(kNavigation);
      } else {
        Get.toNamed(kNavigation);
      }
    });
    /////////////////////////////
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      body: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/bloodbank.jpeg",
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Nuhvin Blood Bank",
              style: GoogleFonts.roboto(
                  fontSize: kTwentyFont, color: kbloodred, fontWeight: kFW600),
            ),
          ],
        ),
      ),
    );
  }
}
