import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

// class _ProfileState extends State<Profile> {
class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  ApiController apiController = Get.put(ApiController());
  bool _switchValue = false;
  bool isSwitched = false;
  bool showimagenullMessage = false;
  /////////////////
  final List<String> bloodgroupss = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  ///////////
  var textValue = 'Switch is OFF';
  Map userDetails = {};
  void toggleSwitch(bool value) async {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
    // UserSimplePreferences().setMapShowSTatuc(isSwitched);
  }

  File? selectedImage;
  File? selectedImagetwo;
  String base64Image = "";
  ApiController authentication = Get.put(ApiController());
  //////////////////////////imageedit
  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
      // .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          //.pickImage(source: ImageSource.gallery);
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      //  .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        authentication.donorEditProfile(selectedImage!);
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
//       Future getImageSize() async {
// // final pickedImage = await picker.getImage(source: ImageSource.gallery);
//         final bytes = selectedImage!.readAsBytesSync().lengthInBytes;
//         final kb = bytes / 1024;
//         final mb = kb / 1024;
//         print("Below kilo bytes,...........................................");
//         print(kb);
//       }
      // var value = await Services.profileimage(File(image.path));
      // if (jsonDecode(value["msg"]) != null) {
      //   Fluttertoast.showToast(msg: value["msg"]);
      // } else {
      //   // Get.toNamed(Kapply_leaves);
      // }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////
  late AnimationController _animationController;

  ////////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    apiController.getProfile();

    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  ////////////////////////////////////////////////
  late AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String dayName = DateFormat('EEEE').format(now);
    setState(() {
      apiController.todayName.value = dayName;
    });
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Kwhite,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                if (apiController.profileData["employeeType"] == "Donor") {
                  Get.toNamed(kDonorBottomNavigation);
                } else {
                  Get.back();
                }
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            "profile",
            style: GoogleFonts.roboto(
                fontSize: 20.sp, color: KdarkText, fontWeight: kFW600),
          ),
          titleSpacing: 10.w,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed(kEditProfileScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/edit.png",
                    color: KdarkText,
                    height: 17.h,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    "Edit Profile",
                    style: GoogleFonts.roboto(
                        fontSize: kFourteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                ],
              ),
            )
          ],
        ),
        body: Obx(
          () => apiController.profiledataLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: kbloodred,
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        apiController.profileData["profile"] == null
                            ? Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Kwhite,
                                    radius: 50.r,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(200.r),
                                      child: Image.asset(
                                        "assets/images/profileImageStatic.png",
                                        // height: 150.h,
                                        height: 100.h,
                                        width: 100.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    right: 0.w,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20)),
                                            ),
                                            backgroundColor: Kbackground,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Kbackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  height: 100.h,
                                                  padding: EdgeInsets.only(
                                                      top: 20.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage(
                                                              "Gallery");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .image_outlined,
                                                              color: kbloodred,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('Gallery',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage("camera");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color: kbloodred,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('camera',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Image.asset(
                                        "assets/images/edit.png",
                                        color: kbloodred,
                                        height: 20.h,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child: AnimatedBuilder(
                                      animation: _controller,
                                      builder: (context, child) {
                                        return CustomPaint(
                                          painter: DotPainter(
                                              animation: _controller),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top: orientation == Orientation.portrait
                                        ? 10.h
                                        : 5.h,
                                    left: orientation == Orientation.portrait
                                        ? 10.h
                                        : 5.h,
                                    child: CircleAvatar(
                                      backgroundColor: Kwhite,

                                      // backgroundImage: AssetImage(
                                      //     'assets/images/blood _loading.gif'),
                                      radius: 50.r,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200.r),
                                        child: CachedNetworkImage(
                                          imageUrl: kBaseImageUrl +
                                              apiController
                                                  .profileData["profile"],
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            height: 100.h,
                                            width: 100.w,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.black12,
                                              highlightColor:
                                                  Colors.white.withOpacity(0.5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      Kwhite.withOpacity(0.5),
                                                ),
                                                height: 100.h,
                                                width: 100.w,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              CircleAvatar(
                                            backgroundColor: Kwhite,
                                            radius: 50.r,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(200.r),
                                              child: Image.asset(
                                                "assets/images/profileImageStatic.png",
                                                // height: 150.h,
                                                height: 100.h,
                                                width: 100.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          height: 150.h,
                                          width: 150.w,
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
                                  Positioned(
                                    bottom: orientation == Orientation.portrait
                                        ? 0.h
                                        : -5.h,
                                    right: orientation == Orientation.portrait
                                        ? 0.w
                                        : -5.w,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20)),
                                            ),
                                            backgroundColor: Kbackground,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Kbackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20))),
                                                  height: 100.h,
                                                  padding: EdgeInsets.only(
                                                      top: 20.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage(
                                                              "Gallery");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .image_outlined,
                                                              color: kbloodred,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('Gallery',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          chooseImage("camera");
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color: kbloodred,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text('camera',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        kFW700,
                                                                    color:
                                                                        KdarkText)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Image.asset(
                                        "assets/images/edit.png",
                                        color: kbloodred,
                                        height: 20.h,
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     Get.toNamed(kEditProfileScreen);
                                    //   },
                                    //   child: Image.asset(
                                    //     "assets/images/edit.png",
                                    //     height: 20.h,
                                    //     color: kbloodred,
                                    //   ),
                                    // ),
                                  ),
                                ],
                              ),

                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          apiController.profileData["employeeType"] == "Donor"
                              ? apiController.profileData["firstName"] +
                                  " " +
                                  apiController.profileData["lastName"]
                              : apiController.profileData["bloodBankName"] ??
                                  "No name",
                          style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              color: KdarkText,
                              fontWeight: kFW500),
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        apiController.profileData["employeeType"] == "Donor"
                            ? Container(
                                padding: EdgeInsets.only(
                                    left: 6.w,
                                    right: 6.w,
                                    top: 2.h,
                                    bottom: 2.h),
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
                        SizedBox(
                          height: 20.h,
                        ),

                        Divider(),
                        SizedBox(
                          height: 10.h,
                        ),
                        apiController.profileData["employeeType"] == "Donor"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Are you available",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        fontWeight: kFW600,
                                        color: KdarkText),
                                  ),
                                  Switch(
                                    onChanged: (value) {
                                      if (value == false) {
                                        setState(() {
                                          apiController.switchValues.value =
                                              value;
                                        });
                                        var payload = {
                                          "mobile": apiController
                                              .profileData["mobile"],
                                          "isAvailable":
                                              apiController.switchValues.value
                                        };
                                        apiController
                                            .donorAvailability(payload);
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Are you sure ? ',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 12.sp,
                                                        fontWeight: kFW700,
                                                        color: KText)),
                                                content: Text(
                                                    'Are you healthy now ?',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 12.sp,
                                                        fontWeight: kFW700,
                                                        color: KdarkText)),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              content:
                                                                  Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    7,
                                                                child:
                                                                    CustomFormFields(
                                                                  controller:
                                                                      apiController
                                                                          .donorHealthreasonController,
                                                                  labelColor:
                                                                      KText,
                                                                  enabled: true,
                                                                  obscureText:
                                                                      false,
                                                                  contentPadding: const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          16,
                                                                      horizontal:
                                                                          8),
                                                                  fontSize:
                                                                      kFourteenFont,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  hintText:
                                                                      "Enter Reason",
                                                                  maxLines: 1,
                                                                  readOnly:
                                                                      false,
                                                                  label:
                                                                      'Reason',
                                                                ),
                                                              ),
                                                              // Text(
                                                              //     'How is your health ?',
                                                              //     maxLines: 2,
                                                              //     overflow:
                                                              //         TextOverflow
                                                              //             .ellipsis,
                                                              //     style: GoogleFonts.roboto(
                                                              //         fontSize:
                                                              //             12.sp,
                                                              //         fontWeight:
                                                              //             kFW700,
                                                              //         color:
                                                              //             KdarkText)),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                      'Cancel',
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.roboto(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              kFW700,
                                                                          color:
                                                                              KdarkText)),
                                                                ),
                                                                TextButton(
                                                                  // textColor: Color(0xFF6200EE),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      apiController
                                                                          .switchValues
                                                                          .value = value;
                                                                    });
                                                                    var payload =
                                                                        {
                                                                      "mobile":
                                                                          apiController
                                                                              .profileData["mobile"],
                                                                      "reason": apiController
                                                                          .donorHealthreasonController
                                                                          .text,
                                                                      "isAvailable": apiController
                                                                          .switchValues
                                                                          .value
                                                                    };
                                                                    apiController
                                                                        .donorAvailability(
                                                                            payload);

                                                                    print(
                                                                        _switchValue);
                                                                    Get.back();
                                                                  }

                                                                  // Get.back();
                                                                  // Get.back();
                                                                  // Get.toNamed(
                                                                  //     KBottom_navigation);
                                                                  // Navigator.pop(context);
                                                                  ,
                                                                  child: Text(
                                                                      'Submit',
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.roboto(
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              kFW700,
                                                                          color:
                                                                              KdarkText)),
                                                                )
                                                              ],
                                                            );
                                                          });
                                                    },
                                                    child: Text('No',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  ),
                                                  TextButton(
                                                    // textColor: Color(0xFF6200EE),
                                                    onPressed: () async {
                                                      setState(() {
                                                        apiController
                                                            .switchValues
                                                            .value = value;
                                                      });
                                                      var payload = {
                                                        "mobile": apiController
                                                                .profileData[
                                                            "mobile"],
                                                        "isAvailable":
                                                            apiController
                                                                .switchValues
                                                                .value
                                                      };
                                                      apiController
                                                          .donorAvailability(
                                                              payload);

                                                      print(_switchValue);
                                                      Get.back();
                                                    }

                                                    // Get.back();
                                                    // Get.back();
                                                    // Get.toNamed(
                                                    //     KBottom_navigation);
                                                    // Navigator.pop(context);
                                                    ,
                                                    child: Text('Yes',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText)),
                                                  )
                                                ],
                                              );
                                            });
                                      }
                                      ;
                                    },
                                    value: apiController.switchValues.value,
                                    activeColor: kbloodred,
                                    activeTrackColor:
                                        kbloodred.withOpacity(0.5),
                                    inactiveThumbColor: KText,
                                    inactiveTrackColor: KText.withOpacity(0.5),
                                  )
                                ],
                              )
                            : apiController.profileData["bloodBankTimming"] ==
                                    null
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Is Open 24/7",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13.sp,
                                            fontWeight: kFW600,
                                            color: KdarkText),
                                      ),
                                      Switch(
                                        onChanged: (value) {
                                          setState(() {
                                            apiController.switchValues.value =
                                                value;
                                          });
                                          var payload = {
                                            "mobile": apiController
                                                .profileData["mobile"],
                                            "isAvailable":
                                                apiController.switchValues.value
                                          };
                                          apiController
                                              .donorAvailability(payload);
                                          // apiController.getProfile();
                                          // setState(() {
                                          //   _switchValue =
                                          //       apiController.profileData["isAvailable"];
                                          // });
                                          print(_switchValue);
                                        },
                                        value: apiController.switchValues.value,
                                        activeColor: kbloodred,
                                        activeTrackColor:
                                            kbloodred.withOpacity(0.5),
                                        inactiveThumbColor: KText,
                                        inactiveTrackColor:
                                            KText.withOpacity(0.5),
                                      )
                                    ],
                                  )
                                : SizedBox(),
                        apiController.profileData["employeeType"] != "Donor" &&
                                apiController.profileData["bloodBankTimming"] ==
                                    null
                            ? SizedBox(
                                height: 10.h,
                              )
                            : SizedBox(),
                        apiController.profileData["employeeType"] != "Donor" &&
                                apiController.profileData["bloodBankTimming"] ==
                                    null
                            ? Divider()
                            : apiController.profileData["employeeType"] ==
                                    "Donor"
                                ? Divider()
                                : SizedBox(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: kFW500,
                                      color: KText),
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: Text(
                                    apiController.profileData["email"] ??
                                        "No Mail",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        fontWeight: kFW500,
                                        color: KdarkText),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobile",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: kFW500,
                                      color: KText),
                                ),
                                Text(
                                  apiController.profileData["mobile"] ??
                                      "No Mobile",

                                  //  "Male",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: kFW500,
                                      color: KdarkText),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        /////////////////////////////////////////////////////////////////////////////////
                        apiController.profileData["employeeType"] == "Donor"
                            ? SizedBox()
                            : Divider(),
                        apiController.profileData["employeeType"] == "Donor"
                            ? SizedBox()
                            : SizedBox(
                                height: 10.h,
                              ),
                        // Ram work on Time Table
                        apiController.profileData["employeeType"] == "Donor"
                            ? SizedBox()
                            : apiController.profileData["bloodBankTimming"] ==
                                    null
                                ? Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Open Time",
                                            style: GoogleFonts.roboto(
                                                fontSize: 13.sp,
                                                fontWeight: kFW500,
                                                color: KText),
                                          ),
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              apiController.profileData[
                                                      "startTime"] ??
                                                  "Update Time",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW500,
                                                  color: KdarkText),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 80.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Close time",
                                            style: GoogleFonts.roboto(
                                                fontSize: 13.sp,
                                                fontWeight: kFW500,
                                                color: KText),
                                          ),
                                          SizedBox(
                                            width: 80.w,
                                            child: Text(
                                              apiController
                                                      .profileData["endTime"] ??
                                                  "Update Time",

                                              //  "Male",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 13.sp,
                                                  fontWeight: kFW500,
                                                  color: KdarkText),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      apiController.todayName == "Monday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Monday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Monday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Monday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Monday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Monday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Monday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Monday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Monday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Monday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Monday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Monday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Tuesday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Tuesday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Tuesday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Tuesday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Tuesday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Tuesday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Tuesday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Tuesday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Tuesday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Tuesday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Tuesday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Tuesday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Wednesday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Wednesday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Wednesday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Wednesday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Wednesday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Wednesday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    [
                                                                    "Wednesday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    [
                                                                    "Wednesday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Wednesday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Wednesday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Wednesday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Wednesday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Thursday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Thursday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Thursday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Thursday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Thursday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Thursday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Thursday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Thursday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Thursday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Thursday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Thursday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Thursday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Friday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Friday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Friday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Friday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Friday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Friday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Friday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Friday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Friday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Friday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Friday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Friday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Saturday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Saturday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Saturday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Saturday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Saturday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Saturday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Saturday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Saturday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Saturday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Saturday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Saturday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Saturday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                      apiController.todayName == "Sunday"
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Sunday",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 13.sp,
                                                        fontWeight: kFW500,
                                                        color: KText),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Sunday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          "Closed Today",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      kFW500,
                                                                  color:
                                                                      KdarkText),
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Sunday"]
                                                            ["isClosed"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                /////24 hrs
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Sunday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? Text(
                                                        "Open 24 hours",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    kFW500,
                                                                color:
                                                                    KdarkText),
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                    "bloodBankTimming"]
                                                                ["Sunday"]
                                                            ["is24Hours"] ==
                                                        true
                                                    ? SizedBox(
                                                        height: 10.h,
                                                      )
                                                    : SizedBox(),
                                                apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Sunday"]
                                                                ["is24Hours"] ==
                                                            false &&
                                                        apiController.profileData[
                                                                        "bloodBankTimming"]
                                                                    ["Sunday"]
                                                                ["isClosed"] ==
                                                            false
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Open Time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              SizedBox(
                                                                width: 150.w,
                                                                child: Text(
                                                                  apiController.profileData["bloodBankTimming"]["Sunday"]["timming"]
                                                                              [
                                                                              0] ==
                                                                          ""
                                                                      ? "No Time"
                                                                      : apiController.profileData["bloodBankTimming"]["Sunday"]["timming"]
                                                                              [
                                                                              0] ??
                                                                          // apiController.profileData[
                                                                          //         "startTime"] ??
                                                                          "No Time",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          kFW500,
                                                                      color:
                                                                          KdarkText),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 80.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Close time",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KText),
                                                              ),
                                                              Text(
                                                                apiController.profileData["bloodBankTimming"]["Sunday"]["timming"]
                                                                            [
                                                                            1] ==
                                                                        ""
                                                                    ? "No Time"
                                                                    : apiController.profileData["bloodBankTimming"]["Sunday"]["timming"]
                                                                            [
                                                                            1] ??
                                                                        // apiController.profileData[
                                                                        //         "startTime"] ??
                                                                        "No Time",

                                                                //  "Male",
                                                                style: GoogleFonts.roboto(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        kFW500,
                                                                    color:
                                                                        KdarkText),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(),
                                              ],
                                            )
                                          : SizedBox(),
                                    ],
                                  ),

                        apiController.profileData["employeeType"] == "Donor"
                            ? SizedBox()
                            : SizedBox(
                                height: 10.h,
                              ),
                        /////////////////////////////////////////////////////////////////////
                        Divider(),
                        SizedBox(
                          height: 10.h,
                        ),
                        apiController.profileData["employeeType"] == "Donor"
                            ? Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date of Birth",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13.sp,
                                            fontWeight: kFW500,
                                            color: KText),
                                      ),
                                      Text(
                                        apiController
                                                .profileData["dateOfBirth"] ??
                                            "No Time",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13.sp,
                                            fontWeight: kFW500,
                                            color: KdarkText),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 150.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13.sp,
                                            fontWeight: kFW500,
                                            color: KText),
                                      ),
                                      Text(
                                        apiController.profileData["gender"] ??
                                            "No gender",

                                        //  "Male",
                                        style: GoogleFonts.roboto(
                                            fontSize: 13.sp,
                                            fontWeight: kFW500,
                                            color: KdarkText),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                            height: apiController.profileData["employeeType"] ==
                                    "Donor"
                                ? 10.h
                                : 0.h),
                        apiController.profileData["employeeType"] == "Donor"
                            ? Divider()
                            : SizedBox(),
                        apiController.profileData["employeeType"] == "Donor"
                            ? SizedBox(
                                height: 10.h,
                              )
                            : SizedBox(),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: kFW500,
                                      color: KText),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    apiController.profileData["address"] ??
                                        "No Location",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    //  "14/06/2001",
                                    style: GoogleFonts.roboto(
                                        fontSize: 13.sp,
                                        fontWeight: kFW500,
                                        color: KdarkText),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}

class DotPainter extends CustomPainter {
  final Animation<double> animation;

  DotPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint dotPaint = Paint()..color = kbloodred;

    final double radius = size.width / 2;
    final double dotRadius = 5.0;
    final double currentProgress = animation.value * 2 * pi;

    // Draw the background circle
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Calculate the position of the revolving dot
    final double dx = radius + radius * cos(currentProgress);
    final double dy = radius + radius * sin(currentProgress);

    // Draw the revolving dot
    canvas.drawCircle(Offset(dx, dy), dotRadius, dotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
