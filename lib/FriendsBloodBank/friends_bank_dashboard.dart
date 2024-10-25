import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FriendsBankDashboard extends StatefulWidget {
  const FriendsBankDashboard({super.key});

  @override
  State<FriendsBankDashboard> createState() => _FriendsBankDashboardState();
}

class _FriendsBankDashboardState extends State<FriendsBankDashboard> {
  FriendsApiController fapiController = Get.put(FriendsApiController());
  @override
  void initState() {
    setState(() {
      fapiController.slectedCategory.value = "Blood Group";
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      bottomSheet: Obx(() => fapiController.fDonorsDataLoading == true
          ? CircularProgressIndicator(
              color: kbloodred,
            )
          : SizedBox(
              height: 50.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    margin: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                    ),
                    Padding: EdgeInsets.only(bottom: 1),
                    // margin: EdgeInsets.only(
                    //     top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
                    borderRadius: BorderRadius.circular(10.r),
                    Color: kbloodred,
                    textColor: Kwhite,
                    height: 42.h,
                    width: double.infinity,
                    label: "Search Donors",
                    fontSize: kSixteenFont,
                    fontWeight: kFW500,
                    isLoading: false,
                    onTap: () async {
                      if (fapiController.slectedBloodgroup == "" ||
                          fapiController.slectedState == "" ||
                          fapiController.slectedDistrict == "" ||
                          fapiController.slectedCity == "") {
                        Fluttertoast.showToast(
                          msg: "Select Items in all Categories",
                        );
                      } else {
                        fapiController.getfdonorsList();
                      }
                    },
                  ),
                  Container(
                    color: Kwhite,
                    height: 8,
                  )
                ],
              ),
            )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.w,
        titleSpacing: 20.w,
        backgroundColor: Kwhite,
        title: Text(
          "Nuhvin Blood Bank",
          style: GoogleFonts.roboto(
              fontSize: 20.sp, color: KdarkText, fontWeight: kFW600),
        ),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              customButton: Container(
                margin: EdgeInsets.only(right: 20.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 30.sp,
                      color: kbloodred,
                    ),
                    Text(
                      " Menu ",
                      style: GoogleFonts.roboto(
                          fontSize: kFourteenFont,
                          color: kbloodred,
                          fontWeight: kFW500),
                    ),
                  ],
                ),
              ),
              items: [
                ...MenuItems.firstItems.map(
                  (item) => DropdownMenuItem<MenuItem>(
                    value: item,
                    child: MenuItems.buildItem(item),
                  ),
                ),
                // DropdownMenuItem<Divider>(enabled: false, child: Divider()),
                // ...MenuItems.secondItems.map(
                //   (item) => DropdownMenuItem<MenuItem>(
                //     value: item,
                //     child: MenuItems.buildItem(item),
                //   ),
                // ),
              ],
              onChanged: (value) {
                MenuItems.onChanged(context, value! as MenuItem);
              },
              dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kbloodred,
                ),
                offset: const Offset(0, 8),
              ),
              menuItemStyleData: MenuItemStyleData(
                customHeights: [
                  ...List<double>.filled(MenuItems.firstItems.length, 48),
                  // 8,
                  // ...List<double>.filled(MenuItems.secondItems.length, 48),
                ],
                padding: const EdgeInsets.only(left: 16, right: 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(16.r),
            // padding: EdgeInsets.only(bottom: 100.h),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    // color: kyellow.withOpacity(0.5),
                    color: Kwhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categories ",
                          style: GoogleFonts.roboto(
                              fontSize: kTwentyFont,
                              color: KdarkText,
                              fontWeight: kFW500),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fapiController.slectedCategory.value =
                                  "Blood Group";
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Blood Group",
                                style: GoogleFonts.roboto(
                                    fontSize: kSixteenFont,
                                    color: KdarkText,
                                    fontWeight: kFW500),
                              ),
                              // Icon(Icons.keyboard_arrow_right)
                              fapiController.slectedCategory.value ==
                                      "Blood Group"
                                  ? Icon(
                                      Icons.arrow_right,
                                      size: 28.sp,
                                      color: kbloodred,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            if (fapiController.slectedBloodgroup == "") {
                              Fluttertoast.showToast(
                                msg: "Select Blood Group",
                              );
                            } else {
                              setState(() {
                                fapiController.slectedCategory.value = "State";
                              });
                            }
                          },
                          ////////////////////////
                          //                           var slectedBloodgroup = "".obs;
                          // var slectedState = "".obs;
                          // var slectedDistrict = "".obs;
                          // var slectedCity = "".obs;
                          //////////////
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "State",
                                style: GoogleFonts.roboto(
                                    fontSize: kSixteenFont,
                                    color: KdarkText,
                                    fontWeight: kFW500),
                              ),
                              // Icon(Icons.keyboard_arrow_right)

                              fapiController.slectedCategory.value == "State"
                                  ? Icon(
                                      Icons.arrow_right,
                                      size: 28.sp,
                                      color: kbloodred,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            if (fapiController.slectedBloodgroup == "" ||
                                fapiController.slectedState == "") {
                              Fluttertoast.showToast(
                                msg: "Select Blood Group And State",
                              );
                            } else {
                              setState(() {
                                fapiController.slectedCategory.value =
                                    "District";
                              });
                            }
                          },
                          //////////
                          ////////////////////////
                          //                           var slectedBloodgroup = "".obs;
                          // var slectedState = "".obs;
                          // var slectedDistrict = "".obs;
                          // var slectedCity = "".obs;
                          //////////////
                          /////
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "District",
                                style: GoogleFonts.roboto(
                                    fontSize: kSixteenFont,
                                    color: KdarkText,
                                    fontWeight: kFW500),
                              ),
                              // Icon(Icons.keyboard_arrow_right)
                              fapiController.slectedCategory.value == "District"
                                  ? Icon(
                                      Icons.arrow_right,
                                      size: 28.sp,
                                      color: kbloodred,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            if (fapiController.slectedBloodgroup == "" ||
                                fapiController.slectedState == "" ||
                                fapiController.slectedDistrict == "") {
                              Fluttertoast.showToast(
                                msg:
                                    "Select Blood Group And State And District",
                              );
                            } else {
                              setState(() {
                                fapiController.slectedCategory.value = "City";
                              });
                            }
                          },
                          ///////////////////////////////////
                          //                         var slectedBloodgroup = "".obs;
                          // var slectedState = "".obs;
                          // var slectedDistrict = "".obs;
                          // var slectedCity = "".obs;
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "City",
                                style: GoogleFonts.roboto(
                                    fontSize: kSixteenFont,
                                    color: KdarkText,
                                    fontWeight: kFW500),
                              ),
                              fapiController.slectedCategory.value == "City"
                                  ? Icon(
                                      Icons.arrow_right,
                                      size: 28.sp,
                                      color: kbloodred,
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  // VerticalDivider(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: VerticalDivider(
                      width: 1, // Sets the width of the divider
                      thickness: 1, // Sets the thickness of the line
                      color: KdarkText, // Sets the color of the divider
                      indent: 0, // Removes padding at the top
                      endIndent: 0, // Removes padding at the bottom
                    ),
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      // color: kyellow.withOpacity(0.5),
                      child: fapiController.slectedCategory.value ==
                              "Blood Group"
                          ? ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: fapiController.BloodGroup.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          fapiController.selecedIndex.value =
                                              index;
                                          fapiController
                                                  .slectedBloodgroup.value =
                                              fapiController.BloodGroup[index];
                                        });
                                        print(fapiController.slectedBloodgroup);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 5.w),
                                            child: Text(
                                              fapiController.BloodGroup[index],
                                              style: GoogleFonts.roboto(
                                                  fontSize: kFourteenFont,
                                                  color: KdarkText,
                                                  fontWeight: kFW500),
                                            ),
                                          ),
                                          fapiController.selecedIndex.value ==
                                                  index
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20.w),
                                                  child: Icon(
                                                    Icons.radio_button_checked,
                                                    color: kbloodred,
                                                    size: 18.sp,
                                                  ))
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20.w),
                                                  child: Icon(
                                                    Icons.circle_outlined,
                                                    size: 18.sp,
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                    Divider()
                                  ],
                                );
                              })
                          : fapiController.slectedCategory.value == "State"
                              ? ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: fapiController.states.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              fapiController.selecedStateIndex
                                                  .value = index;
                                              fapiController
                                                      .slectedState.value =
                                                  fapiController.states[index];
                                            });
                                            print(fapiController.slectedState);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 5.w),
                                                child: Text(
                                                  fapiController.states[index],
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kFourteenFont,
                                                      color: KdarkText,
                                                      fontWeight: kFW500),
                                                ),
                                              ),
                                              fapiController.selecedStateIndex
                                                          .value ==
                                                      index
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20.w),
                                                      child: Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        color: kbloodred,
                                                        size: 18.sp,
                                                      ))
                                                  : Container(
                                                      margin: EdgeInsets.only(
                                                          right: 20.w),
                                                      child: Icon(
                                                        Icons.circle_outlined,
                                                        size: 18.sp,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                        Divider()
                                      ],
                                    );
                                  })
                              : fapiController.slectedCategory.value ==
                                      "District"
                                  ? ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          fapiController.districts.length,
                                      itemBuilder: (context, index) {
                                        return fapiController.districts[index]
                                                    ["state"] ==
                                                fapiController
                                                    .slectedState.value
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        fapiController
                                                            .selecedDistrictIndex
                                                            .value = index;
                                                        fapiController
                                                            .slectedDistrict
                                                            .value = fapiController
                                                                    .districts[
                                                                index]["name"] ??
                                                            "";
                                                        // fapiController.states[index];
                                                      });
                                                      print(fapiController
                                                          .slectedDistrict);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 5.w),
                                                          child: Text(
                                                            fapiController.districts[
                                                                        index]
                                                                    ["name"] ??
                                                                "",
                                                            // fapiController.districts[index]["name"],
                                                            style: GoogleFonts.roboto(
                                                                fontSize:
                                                                    kFourteenFont,
                                                                color:
                                                                    KdarkText,
                                                                fontWeight:
                                                                    kFW500),
                                                          ),
                                                        ),
                                                        fapiController
                                                                    .selecedDistrictIndex
                                                                    .value ==
                                                                index
                                                            ? Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right: 20
                                                                            .w),
                                                                child: Icon(
                                                                  Icons
                                                                      .radio_button_checked,
                                                                  color:
                                                                      kbloodred,
                                                                  size: 18.sp,
                                                                ))
                                                            : Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right: 20
                                                                            .w),
                                                                child: Icon(
                                                                  Icons
                                                                      .circle_outlined,
                                                                  size: 18.sp,
                                                                ),
                                                              )
                                                      ],
                                                    ),
                                                  ),
                                                  Divider()
                                                ],
                                              )
                                            : SizedBox();
                                      })
                                  : fapiController.slectedCategory.value ==
                                          "City"
                                      ? ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              fapiController.cities.length,
                                          itemBuilder: (context, index) {
                                            return fapiController.cities[index]
                                                            ["state"] ==
                                                        fapiController
                                                            .slectedState
                                                            .value &&
                                                    fapiController.cities[index]
                                                            ["district"] ==
                                                        fapiController
                                                            .slectedDistrict
                                                            .value
                                                ?
                                                // fapiController.districts[index]
                                                //             ["state"] ==
                                                //         fapiController
                                                //             .slectedState.value
                                                //     ?
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            fapiController
                                                                .selecedCityIndex
                                                                .value = index;
                                                            fapiController
                                                                    .slectedCity
                                                                    .value =
                                                                fapiController.cities[
                                                                            index]
                                                                        [
                                                                        "name"] ??
                                                                    "";
                                                          });
                                                          print(fapiController
                                                              .slectedCity);
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          5.w),
                                                              child: Text(
                                                                fapiController.cities[
                                                                            index]
                                                                        [
                                                                        "name"] ??
                                                                    "",
                                                                // fapiController.districts[index]["name"],
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    color:
                                                                        KdarkText,
                                                                    fontWeight:
                                                                        kFW500),
                                                              ),
                                                            ),
                                                            fapiController
                                                                        .selecedCityIndex
                                                                        .value ==
                                                                    index
                                                                ? Container(
                                                                    margin: EdgeInsets.only(
                                                                        right: 20
                                                                            .w),
                                                                    child: Icon(
                                                                      Icons
                                                                          .radio_button_checked,
                                                                      color:
                                                                          kbloodred,
                                                                      size:
                                                                          18.sp,
                                                                    ))
                                                                : Container(
                                                                    margin: EdgeInsets.only(
                                                                        right: 20
                                                                            .w),
                                                                    child: Icon(
                                                                      Icons
                                                                          .circle_outlined,
                                                                      size:
                                                                          18.sp,
                                                                    ),
                                                                  )
                                                          ],
                                                        ),
                                                      ),
                                                      Divider()
                                                    ],
                                                  )
                                                : SizedBox();
                                            // : SizedBox();
                                          })
                                      : SizedBox()),
                ],
              ),
            )),
      ),
    );
  }
}

//
//  bool? isUserLoggedIn;
//  isUserLoggedIn = UserSimplePreferences.getLoginStatus();
class MenuItem {
  const MenuItem({
    required this.text,
    // required this.icon,
  });

  final String text;
  // final IconData icon;
}

abstract class MenuItems {
  static List<MenuItem> firstItems = [
    Profile,
    Register,
    SignIn,
    HelpDesk,
    PrivacyPolicy,
    Terms,
    AboutUs
  ];
  // static const List<MenuItem> secondItems = [logout];

  static const Profile = MenuItem(
    text: 'Profile',
  );
  static const Register = MenuItem(
    text: 'Register',
  );
  static const SignIn = MenuItem(
    text: 'SignIn',
  );
  static const HelpDesk = MenuItem(
    text: 'HelpDesk',
  );
  static const PrivacyPolicy = MenuItem(
    text: 'PrivacyPolicy',
  );
  static const Terms = MenuItem(
    text: 'Terms',
  );

  static const AboutUs = MenuItem(
    text: 'AboutUs',
  );
  //  static const HelpDesk = MenuItem(
  //   text: 'HelpDesk',
  // );
  // static   SignIn = MenuItem(
  //   text: 'SignIn',
  // );
  // static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.Profile:
        if (UserSimplePreferences.getLoginStatus() != null &&
            UserSimplePreferences.getLoginStatus() == true) {
          Get.toNamed(KFriendsProfile);
        } else {
          Fluttertoast.showToast(
            msg: "You are not logged in.",
          );
          // Get.toNamed(KFriendsSignIn);
        }

        // Get.toNamed(KFriendsProfile);
        break;
      case MenuItems.Register:
        Get.toNamed(KFriendsSignup);
        break;
      case MenuItems.SignIn:
        Get.toNamed(KFriendsSignIn);

        //Do something
        break;
      case MenuItems.HelpDesk:
        Get.toNamed(kHelpDeskScreen);

        //Do something
        break;
      case MenuItems.PrivacyPolicy:
        Get.toNamed(kPrivacypolicy);

        //Do something
        break;
      case MenuItems.Terms:
        Get.toNamed(kAbokTermsutUs);

        //Do something
        break;
      case MenuItems.AboutUs:
        Get.toNamed(kAboutUs);
        //Do something
        break;

      // case MenuItems.logout:
      //   //Do something
      //   break;
    }
  }
}
