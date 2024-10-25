import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FDonorsList extends StatefulWidget {
  const FDonorsList({super.key});

  @override
  State<FDonorsList> createState() => _FDonorsListState();
}

class _FDonorsListState extends State<FDonorsList> {
  String? selectedValue;
  final List<String> bloodgroupss = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'RH+',
    'RH-'
  ];
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'ngsbusinessorg@gmail.com',
    // queryParameters: {
    //   'subject': 'HI',
    //   'body': 'Hello',
    // },
  );

  // String url = params.toString();

  FriendsApiController fapiController = Get.put(FriendsApiController());

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Blood Donors",
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => fapiController.fDonorsDataLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : fapiController.fDonorsData.isEmpty ||
                    fapiController.fDonorsData == null
                ? Text(
                    "No Donors",
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  )
                : Container(
                    margin: EdgeInsets.all(16.w),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: fapiController.fDonorsData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (fapiController
                                            .selectedfDonorsIndex.value ==
                                        index) {
                                      fapiController.selectedfDonorsIndex
                                          .value = 1000000000000000000;
                                    } else {
                                      fapiController
                                          .selectedfDonorsIndex.value = index;
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 12.h),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Ktextcolor.withOpacity(0.5),
                                        blurRadius: 5.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                    ],
                                    color: Kwhite,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/blooddrop.png",
                                        height: 60.h,
                                        width: 50.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Text(
                                              fapiController.fDonorsData[index]
                                                          ["fullName"]
                                                      .toString()
                                                      .capitalizeFirst! ??
                                                  "--",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                  letterSpacing: 0.1,
                                                  fontSize: 15.sp,
                                                  color: KdarkText,
                                                  fontWeight: kFW500),
                                            ),
                                          ),
                                          Text(
                                            "${fapiController.fDonorsData[index]["bloodGroup"]}",

                                            // "Mehar",
                                            style: GoogleFonts.roboto(
                                                fontSize: 11.sp,
                                                color: Ktextcolor,
                                                fontWeight: kFW500),
                                          ),
                                          Text(
                                            "${fapiController.fDonorsData[index]["mobile"]}",

                                            // "Mehar",
                                            style: GoogleFonts.roboto(
                                                fontSize: 11.sp,
                                                color: Ktextcolor,
                                                fontWeight: kFW500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              fapiController.selectedfDonorsIndex.value == index
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 15.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              launch(
                                                  "tel://${fapiController.fDonorsData[index]["mobile"]}");
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                    radius: 14.r,
                                                    backgroundColor: kbloodred
                                                        .withOpacity(0.5),
                                                    child: Icon(
                                                      Icons.phone,
                                                      size: 18.sp,
                                                    )),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "Call Donor",

                                                  // "Mehar",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kFourteenFont,
                                                      color: KdarkText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              launch(Uri(
                                                scheme: 'mailto',
                                                path: fapiController
                                                        .fDonorsData[index]
                                                    ["email"],
                                                // queryParameters: {
                                                //   'subject': 'HI',
                                                //   'body': 'Hello',
                                                // },
                                              ).toString());

                                              //    launch(params.toString());
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                    radius: 14.r,
                                                    backgroundColor: kbloodred
                                                        .withOpacity(0.5),
                                                    child: Icon(
                                                      Icons.mail,
                                                      size: 18.sp,
                                                    )),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "Message",

                                                  // "Mehar",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kFourteenFont,
                                                      color: KdarkText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            7,
                                                        child: CustomFormFields(
                                                          controller: fapiController
                                                              .reportController,
                                                          // controller: apiController
                                                          //     .donorHealthreasonController,
                                                          labelColor: KText,
                                                          enabled: true,
                                                          obscureText: false,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 16,
                                                                  horizontal:
                                                                      8),
                                                          fontSize:
                                                              kFourteenFont,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          hintText:
                                                              "Enter Issue",
                                                          maxLines: 1,
                                                          readOnly: false,
                                                          label: 'Issue',
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
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: Text('Cancel',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          kFW700,
                                                                      color:
                                                                          KdarkText)),
                                                        ),
                                                        TextButton(
                                                          // textColor: Color(0xFF6200EE),
                                                          onPressed: () async {
                                                            var payload = {
                                                              "report":
                                                                  fapiController
                                                                      .reportController
                                                                      .text,
                                                            };
                                                            fapiController.reportIssue(
                                                                payload,
                                                                fapiController
                                                                        .fDonorsData[
                                                                    index]["_id"]);
                                                            // Get.back();
                                                          },

                                                          // Get.back();
                                                          // Get.back();
                                                          // Get.toNamed(
                                                          //     KBottom_navigation);
                                                          // Navigator.pop(context);

                                                          child: Text('Report',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          kFW700,
                                                                      color:
                                                                          kbloodred)),
                                                        )
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                    radius: 14.r,
                                                    backgroundColor: kbloodred
                                                        .withOpacity(0.5),
                                                    child: Icon(
                                                      Icons.report,
                                                      size: 18.sp,
                                                    )),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "Report",

                                                  // "Mehar",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kFourteenFont,
                                                      color: KdarkText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Share.share(
                                                  "Name : ${fapiController.fDonorsData[index]["fullName"]}\n Mobile Number : ${fapiController.fDonorsData[index]["mobile"]}\n Blood Group : ${fapiController.fDonorsData[index]["bloodGroup"]}");
                                            },
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                    radius: 14.r,
                                                    backgroundColor: kbloodred
                                                        .withOpacity(0.5),
                                                    child: Icon(
                                                      Icons.share,
                                                      size: 18.sp,
                                                    )),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  "Share Details",

                                                  // "Mehar",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kFourteenFont,
                                                      color: KdarkText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          );
                        }),
                  ),
      )),
    );
  }
}
