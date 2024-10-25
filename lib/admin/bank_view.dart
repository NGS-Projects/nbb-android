import 'package:nuhvinbloodbank/untils/export_file.dart';

class BankView extends StatefulWidget {
  const BankView({super.key});

  @override
  State<BankView> createState() => _BankViewState();
}

class _BankViewState extends State<BankView> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        appBar: Bankappbar(
          dontHaveBackAsLeading: false,
          title: "Bank Details",
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                apiController.bankView["profile"] == null
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
                                apiController.bankView["profile"],
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

                // Image.asset(
                //   "assets/images/blooddrop.png",
                //   height: 60.h,
                // ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    apiController.bankView["bloodBankName"]
                            .toString()
                            .capitalizeFirst! ??
                        "No name",
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
                      onTap: () async {
                        launch("tel://${apiController.bankView["mobile"]}");
                      },
                      child: Icon(
                        Icons.call,
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
                        launch(Uri(
                          scheme: 'mailto',
                          path: apiController.bankView["email"],
                          // queryParameters: {
                          //   'subject': 'HI',
                          //   'body': 'Hello',
                          // },
                        ).toString());

                        //    launch(params.toString());
                      },
                      child: Icon(
                        Icons.mail,
                        color: kbloodred.withOpacity(
                          0.5,
                        ),
                        size: 18.sp,
                      ),
                    ),
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
                        "Distance",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          apiController.bankView["distance"]
                                  .toStringAsFixed(2) +
                              "kms",
                          //  "${apiController.bankdonorsData[index]["distance"]} km",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          //"Male",
                          style: GoogleFonts.roboto(
                              fontSize: kFourteenFont,
                              color: KdarkText,
                              fontWeight: kFW500),
                        ),
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
                      apiController.bankView["employeeType"],
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
                        "Contact",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      Text(
                        apiController.bankView["mobile"],
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

                // SizedBox()
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            apiController.bankView["address"] == null
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
                        apiController.bankView["address"] ?? "",
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
