import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:text_scroll/text_scroll.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ApiController apiController = Get.put(ApiController());

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  ////////////////////ramlat
  bool? isUserLoggedIn;
  //////////////

  ///Refresh

  @override
  void initState() {
    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    setState(() {
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        apiController.getProfile();
      }
      //  apiController.getProfile(); // un comment Later
      apiController.getBannersOne();
      apiController.getFeedsData();
      apiController.getBannersTwo();
      apiController.getAnnouncedData();
    });
    // print(apiController.storedloginsData);
    // apiController.storedloginsData = jsonDecode(UserSimplePreferences.getUserdata().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Kwhite,
          leadingWidth: 50.w,
          leading: InkWell(
            onTap: () {
              isUserLoggedIn = UserSimplePreferences.getLoginStatus();
              Future.delayed(Duration(seconds: 0), () async {
                if (isUserLoggedIn != null && isUserLoggedIn == true) {
                  Get.toNamed(kProfileScreen);
                } else {
                  Get.toNamed(kMobileSignUp);
                }
              });
              // Get.toNamed(kProfileScreen);
            },
            child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Obx(
                  () => apiController.profileData["profile"] == null
                      ? CircleAvatar(
                          backgroundColor: Kwhite,
                          radius: 35.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200.r),
                            child: Image.asset(
                              "assets/images/bloodbank.jpeg",
                              // height: 150.h,
                              height: 35.h,
                              width: 35.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              top: orientation == Orientation.portrait
                                  ? 0.h
                                  : 5.h,
                              bottom: orientation == Orientation.portrait
                                  ? 0.h
                                  : 5.h),
                          child: CircleAvatar(
                            backgroundColor: Kwhite,
                            radius: 35.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.r),
                              child: CachedNetworkImage(
                                imageUrl: kBaseImageUrl +
                                    apiController.profileData["profile"],
                                placeholder: (context, url) => SizedBox(
                                  height: 35.h,
                                  width: 35.w,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black12,
                                    highlightColor:
                                        Colors.white.withOpacity(0.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Kwhite.withOpacity(0.5),
                                      ),
                                      height: 35.h,
                                      width: 35.w,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                  backgroundColor: Kwhite,
                                  radius: 35.r,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200.r),
                                    child: Image.asset(
                                      "assets/images/profileImageStatic.png",
                                      // height: 150.h,
                                      height: 35.h,
                                      width: 35.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                height: 35.h,
                                width: 35.w,
                                //   fit: BoxFit.cover,
                                fit: BoxFit.cover,
                              ),
                              // Image.asset(
                              //   "assets/images/profileImageStatic.png",
                              //   // height: 150.h,
                              //   height: 100.h,
                              //   width: 100.w,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ),
                )),
          ),
          title: SizedBox(
            width: 180.w,
            child: Obx(() => Text(
                  apiController.profileData["employeeType"] == null
                      ? "Welcome to Nuhvin Blood Bank"
                      : apiController.profileData["employeeType"] == "Donor"
                          ? "Welcome " +
                                  apiController.profileData["firstName"] ??
                              ""
                          : "Welcome " +
                                  apiController.profileData["bloodBankName"] ??
                              "",
                  // "Welcome Ram Nayak",
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                      fontSize: kEighteenFont,
                      color: kblack,
                      fontWeight: kFW500),
                )),
          )),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Obx(() => apiController.feedDatadataLoading == true &&
                    apiController.bannerDatadataLoading == true &&
                    apiController.bannerTwoDatadataLoading == true
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100.h),
                    child: CircularProgressIndicator(
                      color: kbloodred,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      apiController.announceddataLoading == true
                          ? SizedBox()
                          : TextScroll(
                              apiController.announcedData["title"] +
                                  "          ",
                              // mode: TextScrollMode.,
                              // velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
                              velocity:
                                  Velocity(pixelsPerSecond: Offset(90, 0)),
                              delayBefore: Duration(milliseconds: 500),
                              numberOfReps: 100,
                              pauseBetween: Duration(milliseconds: 50),
                              style: GoogleFonts.roboto(
                                  fontSize: kSixteenFont,
                                  color: KRed.withOpacity(0.7),
                                  fontWeight: kFW500),
                              textAlign: TextAlign.right,
                              selectable: true,
                            ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Banners(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Blood Donation Feeds",
                        style: GoogleFonts.roboto(
                            fontSize: kEighteenFont,
                            color: kblack,
                            fontWeight: kFW600),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Feeds(),
                      SizedBox(
                        height: 20.h,
                      ),
                      BannersTwo(),
                      SizedBox(
                        height: 20.h,
                      ),
                      DonatebloodCard(),
                      SizedBox(
                        height: 20.h,
                      ),
                      ExploreCard(),
                      SizedBox(
                        height: 30.h,
                      ),
                      CompatableDonors(),
                      SizedBox(
                        height: 40.h,
                      ),
                      Divider(
                        color: kbloodred,
                      ),
                      Text(
                        "Donate Blood , Save Life.",
                        style: GoogleFonts.roboto(
                            height: 1.2,
                            fontSize: 70,
                            letterSpacing: 0,
                            color: KRed,
                            fontWeight: kFW500),
                      ),
                      Row(
                        children: [
                          Text(
                            "with ",
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: KdarkText,
                                fontWeight: kFW600),
                          ),
                          Icon(
                            Icons.favorite,
                            size: 25.sp,
                            color: kbloodred,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Nuhvin Blood Bank",
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: KdarkText,
                                fontWeight: kFW600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120.h,
                      ),
                    ],
                  ))),
      ),
    );
  }
}
