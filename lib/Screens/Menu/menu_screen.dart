import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: true,
        title: "Menu",
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Container(
          margin: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              apiController.profileData["profile"] == null
                  ? CircleAvatar(
                      backgroundColor: Kwhite,
                      radius: 50.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: Image.asset(
                          "assets/images/profileImageStatic.png",
                          // height: 150.h,
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.toNamed(kProfileScreen);
                      },
                      child: CircleAvatar(
                        backgroundColor: Kwhite,
                        radius: 50.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.r),
                          child: CachedNetworkImage(
                            imageUrl: kBaseImageUrl +
                                apiController.profileData["profile"],
                            placeholder: (context, url) => SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.white.withOpacity(0.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Kwhite.withOpacity(0.5),
                                  ),
                                  height: 100.h,
                                  width: 100.w,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              backgroundColor: Kwhite,
                              radius: 50.r,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200.r),
                                child: Image.asset(
                                  "assets/images/profileImageStatic.png",
                                  // height: 150.h,
                                  height: 100.h,
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            height: 100.h,
                            width: 100.w,
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
              SizedBox(
                height: 20.h,
              ),
              Text(
                apiController.profileData["employeeType"] == "Donor"
                    ? apiController.profileData["firstName"]
                            .toString()
                            .capitalizeFirst! +
                        " " +
                        apiController.profileData["lastName"]
                            .toString()
                            .capitalizeFirst!
                    : apiController.profileData["bloodBankName"]
                            .toString()
                            .capitalizeFirst! ??
                        "No name",
                // apiController.profileData["employeeType"] == "Blood Needed"
                //     ? "Welcome " +
                //             apiController.profileData["attendeeFirstName"]
                //                 .toString()
                //                 .capitalizeFirst! ??
                //         "No name"
                //     : "Welcome " +
                //             apiController.profileData["firstName"]
                //                 .toString()
                //                 .capitalizeFirst! +
                //             " " +
                //             apiController.profileData["lastName"]
                //                 .toString()
                //                 .capitalizeFirst! ??
                //         "No name",
                // apiController.storedloginsData["firstName"] ??
                //     "No name" + apiController.storedloginsData["lastName"] ??
                //     "",
                // "Ram Nayak",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp, color: KdarkText, fontWeight: kFW500),
              ),
              SizedBox(
                height: 10.h,
              ),
              apiController.profileData["employeeType"] == "Donor"
                  ? Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 4.h, bottom: 4.h),
                      decoration: BoxDecoration(
                        color: kbloodred,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1.5,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                            color: Ktextcolor.withOpacity(0.25),
                          )
                        ],
                      ),
                      child: Text(
                        apiController.profileData["bloodGroup"] ??
                            "No Blood Group",
                        //   "AB -",
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont.sp,
                            color: Kwhite,
                            fontWeight: kFW500),
                      ),
                    )
                  : SizedBox(),

              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kAboutUs);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "About Us",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),

              // SizedBox(height: 20.h),
              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(kAddRating);
              //   },
              //   child: Container(
              //     // margin: EdgeInsets.only(top: 10.h),
              //     decoration: BoxDecoration(
              //         color: Kwhite,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Ktextcolor.withOpacity(0.2),
              //             blurRadius: 5,
              //             offset: const Offset(0, 0),
              //             spreadRadius: 2,
              //           )
              //         ],
              //         borderRadius: BorderRadius.circular(10.r)),
              //     //margin: EdgeInsets.all(13.r),
              //     child: ListTile(
              //       title: Text(
              //         "Add Review",
              //         maxLines: 2,
              //         textAlign: TextAlign.left,
              //         overflow: TextOverflow.ellipsis,
              //         style: GoogleFonts.roboto(
              //             fontSize: 16.sp,
              //             fontWeight: kFW600,
              //             color: KdarkText),
              //       ),
              //       trailing: Image.asset(
              //         "assets/images/arrowCorner.png",
              //         height: 40.h,
              //         color: kbloodred,
              //       ),
              //       // Image.asset(
              //       //   Actions[i]["Subimage"],
              //       //   height: 30.h,
              //       // ),
              //     ),
              //   ),
              // ),

              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kProfileScreen);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Profile",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(kChangePasswordScreen);
              //   },
              //   child: Text(
              //     "Change Password",
              //     style:GoogleFonts.roboto(
              //         fontSize: kEighteenFont, color: kblack, fontWeight: kFW500),
              //   ),
              // ),
              //// Update Schedule
              apiController.profileData["employeeType"] == "Donor"
                  ? SizedBox()
                  : SizedBox(
                      height: 20.h,
                    ),
              apiController.profileData["employeeType"] == "Donor"
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.toNamed(kUpdateSchedule);
                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                            color: Kwhite,
                            boxShadow: [
                              BoxShadow(
                                color: Ktextcolor.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.r)),
                        //margin: EdgeInsets.all(13.r),
                        child: ListTile(
                          title: Text(
                            "Update Blood Bank Timings",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: kFW600,
                                color: KdarkText),
                          ),
                          trailing: Image.asset(
                            "assets/images/arrowCorner.png",
                            height: 40.h,
                            color: kbloodred,
                          ),
                          // Image.asset(
                          //   Actions[i]["Subimage"],
                          //   height: 30.h,
                          // ),
                        ),
                      ),
                    ),

              apiController.profileData["employeeType"] == "Donor"
                  ? SizedBox(
                      height: 20.h,
                    )
                  : SizedBox(),
              apiController.profileData["employeeType"] == "Donor"
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(kFindDonorSignUp);
                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                            color: Kwhite,
                            boxShadow: [
                              BoxShadow(
                                color: Ktextcolor.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.r)),
                        //margin: EdgeInsets.all(13.r),
                        child: ListTile(
                          title: Text(
                            "Add Patient",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: kFW600,
                                color: KdarkText),
                          ),
                          trailing: Image.asset(
                            "assets/images/arrowCorner.png",
                            height: 40.h,
                            color: kbloodred,
                          ),
                          // Image.asset(
                          //   Actions[i]["Subimage"],
                          //   height: 30.h,
                          // ),
                        ),
                      ),
                    )
                  : SizedBox(),
              apiController.profileData["employeeType"] == "Donor"
                  ? SizedBox(
                      height: 20.h,
                    )
                  : SizedBox(),
              apiController.profileData["employeeType"] == "Donor"
                  ? GestureDetector(
                      onTap: () {
                        Get.toNamed(kPatientsScreen);
                      },
                      child: Container(
                        // margin: EdgeInsets.only(top: 10.h),
                        decoration: BoxDecoration(
                            color: Kwhite,
                            boxShadow: [
                              BoxShadow(
                                color: Ktextcolor.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                                spreadRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.r)),
                        //margin: EdgeInsets.all(13.r),
                        child: ListTile(
                          title: Text(
                            "Patients List",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: kFW600,
                                color: KdarkText),
                          ),
                          trailing: Image.asset(
                            "assets/images/arrowCorner.png",
                            height: 40.h,
                            color: kbloodred,
                          ),
                          // Image.asset(
                          //   Actions[i]["Subimage"],
                          //   height: 30.h,
                          // ),
                        ),
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kBloodBanksList);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Blood Banks",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kPrivacypolicy);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Privacy Policy",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kAbokTermsutUs);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Terms and Conditions",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kBlogsList);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Blogs",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kRatingsList);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Reviews",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(kHelpDeskScreen);
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: Kwhite,
                      boxShadow: [
                        BoxShadow(
                          color: Ktextcolor.withOpacity(0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                          spreadRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.r)),
                  //margin: EdgeInsets.all(13.r),
                  child: ListTile(
                    title: Text(
                      "Help Desk",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: kFW600,
                          color: KdarkText),
                    ),
                    trailing: Image.asset(
                      "assets/images/arrowCorner.png",
                      height: 40.h,
                      color: kbloodred,
                    ),
                    // Image.asset(
                    //   Actions[i]["Subimage"],
                    //   height: 30.h,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Are You Sure',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    fontWeight: kFW700,
                                    color: KdarkText)),
                            content: Text('You Want To LogOut ?',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    fontWeight: kFW700,
                                    color: KdarkText.withOpacity(0.7))),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('No',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: kFW700,
                                        color: KdarkText)),
                              ),
                              TextButton(
                                // textColor: Color(0xFF6200EE),
                                onPressed: () async {
                                  ///
                                  /// Delete the database at the given path.
                                  ///
                                  // Future<void> deleteDatabase(String path) =>
                                  //     _databaseHelper.database;
                                  UserSimplePreferences.clearAllData();
                                  Get.offAllNamed(kMobileSignUp);
                                },
                                child: Text('Yes',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: kFW700,
                                        color: KdarkText)),
                              )
                            ],
                          );
                        });
                  },
                  child: Container(
                    // margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        color: Kwhite,
                        boxShadow: [
                          BoxShadow(
                            color: Ktextcolor.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.r)),
                    //margin: EdgeInsets.all(13.r),
                    child: ListTile(
                      title: Text(
                        "Log out",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: kFW600,
                            color: kbloodred),
                      ),
                      trailing: Image.asset(
                        "assets/images/arrowCorner.png",
                        height: 40.h,
                        color: kbloodred,
                      ),
                      // Image.asset(
                      //   Actions[i]["Subimage"],
                      //   height: 30.h,
                      // ),
                    ),
                  )),
              SizedBox(
                height: 80.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
