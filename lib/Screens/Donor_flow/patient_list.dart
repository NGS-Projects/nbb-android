import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  ApiController apiController = Get.put(ApiController());
  void initState() {
    apiController.getPatients();

    ;
    // apiController.bankdonorsData = apiController.OriginalbankdonorsData;
    // apiController.bankdonorsData = apiController.bankdonorsDatafilter;
    // apiController.calculateDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Patients List",
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(15.w),
            child: Obx(
              () => apiController.patientDatadataLoading == true
                  ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 100.h),
                      child: CircularProgressIndicator(
                        color: kbloodred,
                      ),
                    )
                  : apiController.patientsData.isEmpty ||
                          apiController.patientsData == null
                      ? Text(
                          "No Patients",
                          style: GoogleFonts.roboto(
                              fontSize: kSixteenFont,
                              color: KdarkText,
                              fontWeight: kFW500),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: apiController.patientsData.length,
                          // itemCount: apiController.bankdonorsData.length,
                          itemBuilder: (context, index) {
                            if (apiController.patientsData[index]["addTime"] !=
                                    null &&
                                DateTime.now().isAfter(DateFormat("MM/dd/yyyy'")
                                    .parse(apiController.patientsData[index]
                                        ["addTime"])
                                    .add(Duration(days: 7))) &&
                                apiController.patientsData[index]["active"] ==
                                    true &&
                                apiController.patientsData[index]["active"] !=
                                    null &&
                                apiController.patientsData[index]["isDelete"] ==
                                    false) {
                              apiController.activatePatient(
                                  apiController.patientsData[index]["_id"]);
                            }

                            return apiController.patientsData[index]
                                        ["isDelete"] ==
                                    true
                                ? SizedBox()
                                : Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/blooddrop.png",
                                          height: 60.h,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 230.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    // "${apiController.distanceInKilometers}",

                                                    apiController
                                                            .patientsData[index]
                                                                [
                                                                "patientFirstName"]
                                                            .toString()
                                                            .capitalizeFirst! +
                                                        " " +
                                                        apiController
                                                                    .patientsData[
                                                                index]
                                                            ["patientLastName"],

                                                    style: GoogleFonts.roboto(
                                                        fontSize: kSixteenFont,
                                                        color: KdarkText,
                                                        fontWeight: kFW500),
                                                  ),
                                                  //["mobile"]["coordinates"]

                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          launch(
                                                              "tel://${apiController.patientsData[index]["author"]}");
                                                        },
                                                        child: Icon(
                                                          Icons.call,
                                                          color: kbloodred
                                                              .withOpacity(
                                                            0.5,
                                                          ),
                                                          size: 18.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 23.w,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          apiController.deletePatient(
                                                              apiController
                                                                      .patientsData[
                                                                  index]["_id"]);
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: kbloodred
                                                              .withOpacity(
                                                            0.5,
                                                          ),
                                                          size: 18.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            SizedBox(
                                              width: 220.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  apiController.patientsData[
                                                                  index]
                                                              ["gender"] ==
                                                          null
                                                      ? SizedBox()
                                                      : Text(
                                                          "gender : " +
                                                                  apiController
                                                                              .patientsData[
                                                                          index]
                                                                      [
                                                                      "gender"] ??
                                                              "No gender",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      kTwelveFont,
                                                                  color: KText,
                                                                  fontWeight:
                                                                      kFW500),
                                                        ),
                                                  // SizedBox(
                                                  //   width: 8.w,
                                                  // ),
                                                  // Text(
                                                  //   "| ",
                                                  //   style: GoogleFonts.roboto(
                                                  //       fontSize: kTwelveFont,
                                                  //       color: KText,
                                                  //       fontWeight: kFW500),
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 12.w,
                                                  // ),
                                                  apiController.patientsData[
                                                                  index]
                                                              ["bloodGroup"] ==
                                                          null
                                                      ? SizedBox()
                                                      : SizedBox(
                                                          width: 70.w,
                                                          child: Text(
                                                            "| group : " +
                                                                    apiController
                                                                            .patientsData[index]
                                                                        [
                                                                        "bloodGroup"] ??
                                                                "No Bloodgroup",
                                                            //  "${apiController.bankdonorsData[index]["distance"]} km",

                                                            //"Male",
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    fontSize:
                                                                        kTwelveFont,
                                                                    color:
                                                                        KText,
                                                                    fontWeight:
                                                                        kFW500),
                                                          ),
                                                        ),
                                                  // SizedBox(
                                                  //   width: 12.w,
                                                  // ),
                                                  // Text(
                                                  //   "| ",
                                                  //   style: GoogleFonts.roboto(
                                                  //       fontSize: kTwelveFont,
                                                  //       color: KText,
                                                  //       fontWeight: kFW500),
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 5.w,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "blood type : " +
                                                          apiController
                                                                      .patientsData[
                                                                  index]
                                                              ["requestType"] ??
                                                      "No type",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  width: 12.w,
                                                ),
                                                Text(
                                                  "| ",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                                Text(
                                                  apiController.patientsData[
                                                                  index]
                                                              ["active"] ==
                                                          true
                                                      ? "Active  "
                                                      : apiController.patientsData[
                                                                      index]
                                                                  ["active"] ==
                                                              false
                                                          ? "Inactive"
                                                          : "No  data",

                                                  //  "${apiController.bankdonorsData[index]["distance"]} km",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //"Male",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                                apiController.patientsData[
                                                            index]["active"] ==
                                                        false
                                                    ? CustomButton(
                                                        // margin: EdgeInsets.all(20.r),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        Color: kbloodred,
                                                        textColor: Kwhite,
                                                        margin: EdgeInsets.only(
                                                            left: 6.w),
                                                        height: 22.h,
                                                        width: 60.w,
                                                        label: "Activate",
                                                        fontSize: 11.sp,
                                                        fontWeight: kFW400,
                                                        isLoading: false,
                                                        onTap: () async {
                                                          apiController
                                                              .activatePatient(
                                                                  apiController
                                                                              .patientsData[
                                                                          index]
                                                                      ["_id"]);
                                                        },
                                                      )
                                                    : SizedBox()
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "required Date : " +
                                                          apiController
                                                                      .patientsData[
                                                                  index][
                                                              "requiredDate"] ??
                                                      "No date",
                                                  //  "${apiController.bankdonorsData[index]["distance"]} km",

                                                  //"Male",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  "| units : ",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                                Text(
                                                  apiController.patientsData[
                                                                  index]
                                                              ["quantity"] +
                                                          "  U" ??
                                                      "No Quantity",
                                                  //  "${apiController.bankdonorsData[index]["distance"]} km",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  //"Male",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: kTwelveFont,
                                                      color: KText,
                                                      fontWeight: kFW500),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            apiController.patientsData[index]
                                                        ["hospitalName"] ==
                                                    null
                                                ? SizedBox()
                                                : Row(
                                                    children: [
                                                      // Icon(
                                                      //   Icons.location_on_sharp,
                                                      //   color: Ktextcolor.withOpacity(
                                                      //     0.5,
                                                      //   ),
                                                      //   size: 18.sp,
                                                      // ),
                                                      SizedBox(
                                                        width: 200.w,
                                                        child: Text(
                                                          "hospital : " +
                                                                  apiController
                                                                              .patientsData[
                                                                          index]
                                                                      [
                                                                      "hospitalName"] ??
                                                              "No Location",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          //  "Nizamabad, Telangana, Hyderabad",
                                                          style: GoogleFonts.roboto(
                                                              fontSize:
                                                                  kTwelveFont,
                                                              color: Ktextcolor,
                                                              fontWeight:
                                                                  kFW500), // KlightText
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                          }),
            )),
      ),
    );
  }
}
