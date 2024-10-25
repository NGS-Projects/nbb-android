import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FriendProfile extends StatefulWidget {
  const FriendProfile({super.key});

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  FriendsApiController fapiController = Get.put(FriendsApiController());
  @override
  void initState() {
    fapiController.getFriendprofile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Profile",
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(
                  KFriendsEdit,
                );
                // KFADDRecord
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
                    "Edit Profile",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
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
                Get.toNamed(
                  KFADDRecord,
                );
                //  KFDonationsHistory
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
                    "Add Donation Record",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
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
                Get.toNamed(
                  KFDonationsHistory,
                );
                //  KFDonationsHistory
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
                    "Donations History",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
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
                              Get.offAllNamed(KFriendsSignIn);
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
              // onTap: () {
              //   fapiController.deleteAccountList();
              //   //  KFDonationsHistory
              // },
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
                    "Log Out",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
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
                        content: Text('You Want To Delete Account ?',
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

                              fapiController.deleteAccountList();
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
              // onTap: () {
              //   fapiController.deleteAccountList();

              // },
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
                    "Delete Account",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
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
          ],
        ),
      ),
    );
  }
}
