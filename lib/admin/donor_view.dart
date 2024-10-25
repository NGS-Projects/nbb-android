import 'package:nuhvinbloodbank/untils/export_file.dart';

class DonorView extends StatefulWidget {
  const DonorView({super.key});

  @override
  State<DonorView> createState() => _DonorViewState();
}

class _DonorViewState extends State<DonorView> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        appBar: Bankappbar(
          dontHaveBackAsLeading: false,
          title: "Donor Details",
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                apiController.donorView["profile"] == null
                    ? CircleAvatar(
                        backgroundColor: Kwhite,
                        radius: 26.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.r),
                          child: Image.asset(
                            "assets/images/profileImageStatic.png",
                            // height: 150.h,
                            height: 60.h,
                            width: 60.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Kwhite,
                        radius: 26.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200.r),
                          child: CachedNetworkImage(
                            imageUrl: kBaseImageUrl +
                                apiController.donorView["profile"],
                            // apiController
                            //     .profileData["profile"],
                            placeholder: (context, url) => SizedBox(
                              height: 60.h,
                              width: 60.w,
                              child: Shimmer.fromColors(
                                baseColor: Colors.black12,
                                highlightColor: Colors.white.withOpacity(0.5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Kwhite.withOpacity(0.5),
                                  ),
                                  height: 60.h,
                                  width: 60.w,
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
                                  height: 60.h,
                                  width: 60.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            height: 60.h,
                            width: 60.w,
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
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    apiController.donorView["firstName"]
                            .toString()
                            .capitalizeFirst! +
                        " " +
                        apiController.donorView["lastName"],
                    // apiController.donorView["patientFirstName"]
                    //         .toString()
                    //         .capitalizeFirst! +
                    //     " " +
                    //     apiController.donorView["patientLastName"],

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          apiController.newChatpartner.value =
                              apiController.donorView["firstName"] +
                                  " " +
                                  ["lastName"];
                          apiController.newChatpartnerBg.value =
                              apiController.donorView["bloodGroup"];
                        });
                        var payload = {
                          "receiverId": apiController.donorView[["_id"]],
                          //    "66912b20cd8503daed4fd666"
                        };
                        apiController.socketioCreateChat(payload);
                        // telephony.sendSmsByDefaultApp(
                        //     to:
                        //         "${apiController.donorsData[index]["mobile"]}",
                        //     message:
                        //         "Hi !This is test message");
                      },
                      // onTap: () async {
                      //   launch(
                      //       "tel://${apiController.donorsData[index]["mobile"]}");
                      // },
                      child: Icon(
                        Icons.chat,
                        color: kbloodred.withOpacity(
                          0.5,
                        ),
                        size: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    GestureDetector(
                      onTap: () async {
                        launch("tel://${apiController.donorView["mobile"]}");
                      },
                      child: Icon(
                        Icons.call,
                        color: kbloodred.withOpacity(
                          0.5,
                        ),
                        size: 18.sp,
                      ),
                    )
                    // GestureDetector(
                    //   onTap: () async {
                    //     launch(Uri(
                    //       scheme: 'mailto',
                    //       path: apiController
                    //               .donorsData[
                    //           index]["email"],
                    //       // queryParameters: {
                    //       //   'subject': 'HI',
                    //       //   'body': 'Hello',
                    //       // },
                    //     ).toString());

                    //     //    launch(params.toString());
                    //   },
                    //   child: Icon(
                    //     Icons.mail,
                    //     color: kbloodred
                    //         .withOpacity(
                    //       0.5,
                    //     ),
                    //     size: 18.sp,
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      Text(
                        apiController.donorView["mobile"] ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 11.sp, color: KText, fontWeight: kFW500),
                    ),
                    Text(
                      apiController.donorView["gender"] ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: kFourteenFont,
                          color: KdarkText,
                          fontWeight: kFW500),
                    ),
                  ],
                ),
                SizedBox()
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Blood Group",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      Text(
                        apiController.donorView["bloodGroup"],
                        // apiController.receiverView["bloodGroup"] ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Role",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 11.sp, color: KText, fontWeight: kFW500),
                    ),
                    Text(
                      apiController.donorView["employeeType"],
                      // apiController.donor["requestType"] ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: kFourteenFont,
                          color: KdarkText,
                          fontWeight: kFW500),
                    ),
                  ],
                ),
                // SizedBox()
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            apiController.donorView["address"] == null
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      Text(
                        // apiController.receiverView["requestType"],

                        // apiController.donorView["address"]
                        apiController.donorView["address"]
                                .toString()
                                .capitalizeFirst! ??
                            "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
          ]),
        ));
  }
}
