import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FDOnordHistory extends StatefulWidget {
  const FDOnordHistory({super.key});

  @override
  State<FDOnordHistory> createState() => _FDOnordHistoryState();
}

class _FDOnordHistoryState extends State<FDOnordHistory> {
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
  void initState() {
    fapiController.getfHistoryList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Donations History",
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => fapiController.fHistoryLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : fapiController.fHistoryData.isEmpty ||
                    fapiController.fHistoryData == null
                ? Text(
                    "No Donations",
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
                        itemCount: fapiController.fHistoryData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    // fHistoryMapData
                                    fapiController.fHistoryMapData.value =
                                        fapiController.fHistoryData[index];
                                  });
                                  showModalBottomSheet<dynamic>(
                                      enableDrag: true,
                                      elevation: 0,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            margin: EdgeInsets.all(5.r),
                                            padding: EdgeInsets.all(10.r),
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.r),
                                              color: Kwhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Ktextcolor.withOpacity(
                                                      0.15),
                                                  blurRadius: 5,
                                                  offset: const Offset(0, 0),
                                                  spreadRadius: 4,
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  fapiController
                                                          .fHistoryMapData[
                                                              "patientName"]
                                                          .toString()
                                                          .capitalizeFirst! ??
                                                      "--",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight: kFW700,
                                                      color: kbloodred),
                                                ),

                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Text(
                                                  "Details",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontWeight: kFW700,
                                                      color: KdarkText),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Donation Date",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: kbloodred
                                                                  .withOpacity(
                                                                      0.7)),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Text(
                                                          fapiController
                                                                  .fHistoryMapData[
                                                              "donationDate"],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: KdarkText),
                                                        ),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Text(
                                                          "Donation Type",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: kbloodred
                                                                  .withOpacity(
                                                                      0.7)),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Text(
                                                          fapiController
                                                                      .fHistoryMapData[
                                                                  "typeOfDonation"] ??
                                                              // dashboardController
                                                              //             .selectedEmployee[
                                                              //         "dateOfJoining"] ??
                                                              "",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: KdarkText),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Mobile No:",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: kbloodred
                                                                  .withOpacity(
                                                                      0.7)),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: Text(
                                                            "${fapiController.fHistoryMapData["mobile"]}"
                                                            // dashboardController
                                                            //             .selectedEmployee[
                                                            //         "dateOfBirth"] ??
                                                            ,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                fontWeight:
                                                                    kFW700,
                                                                color:
                                                                    KdarkText),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Text(
                                                          "Hospital Name:",
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: kbloodred
                                                                  .withOpacity(
                                                                      0.7)),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        Text(
                                                          fapiController
                                                                      .fHistoryMapData[
                                                                  "hospitalName"] ??
                                                              // dashboardController
                                                              //             .selectedEmployee[
                                                              //         "gender"] ??
                                                              "",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  kFW700,
                                                              color: KdarkText),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox()
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Address:",
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          fontWeight: kFW700,
                                                          color: kbloodred
                                                              .withOpacity(
                                                                  0.7)),
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(Icons.location_on),
                                                        SizedBox(
                                                          width: 250.w,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5.0),
                                                            child: Text(
                                                              fapiController
                                                                          .fHistoryMapData[
                                                                      "location"] ??
                                                                  // dashboardController
                                                                  //         .selectedEmployee["address"] ??
                                                                  "",
                                                              maxLines: 10,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      kFW700,
                                                                  color:
                                                                      KdarkText),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                //////////////////////Role

                                                ///////////////
                                                ///////Mangers Tream
                                                SizedBox(
                                                  height: 15.h,
                                                ),

                                                // Text(
                                                //   "Interests",
                                                //   style: TextStyle(
                                                //       fontSize: 15.sp,
                                                //       fontWeight: kFW700,
                                                //       color: KdarkText),
                                                // ),
                                                // Container(
                                                //   alignment: Alignment.center,
                                                //   //height: MediaQuery.of(context).size.height * 0.0,
                                                //   child: Wrap(
                                                //       children: interests
                                                //           .map((interest) => Container(
                                                //                 margin: EdgeInsets.only(
                                                //                     right: 10.w, top: 10.h),
                                                //                 decoration: BoxDecoration(
                                                //                     borderRadius:
                                                //                         BorderRadius.circular(12.r),
                                                //                     border: Border.all(
                                                //                         color:
                                                //                             Kgreen.withOpacity(0.2))),
                                                //                 padding: EdgeInsets.symmetric(
                                                //                     horizontal: MediaQuery.of(context)
                                                //                             .size
                                                //                             .width *
                                                //                         0.040,
                                                //                     vertical: MediaQuery.of(context)
                                                //                             .size
                                                //                             .height *
                                                //                         0.0035),
                                                //                 child: Text(interest,
                                                //                     style: TextStyle(
                                                //                         fontSize: 11.5.sp,
                                                //                         fontWeight: kFW600,
                                                //                         color: Klightblack.withOpacity(
                                                //                             0.9))),
                                                //               ))
                                                //           .toList()),
                                                // ),
                                              ],
                                            ));
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
                                              fapiController.fHistoryData[index]
                                                          ["patientName"]
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
                                            // "${fapiController.fDonorsData[index]["bloodGroup"]}",
                                            fapiController.fHistoryData[index]
                                                ["location"],
                                            // "Mehar",
                                            style: GoogleFonts.roboto(
                                                fontSize: 11.sp,
                                                color: Ktextcolor,
                                                fontWeight: kFW500),
                                          ),
                                          Text(
                                            "${fapiController.fHistoryData[index]["hospitalName"]}",

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
                            ],
                          );
                        }),
                  ),
      )),
    );
  }
}
