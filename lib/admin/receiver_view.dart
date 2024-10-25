import 'package:nuhvinbloodbank/untils/export_file.dart';

class ReceiverView extends StatefulWidget {
  const ReceiverView({super.key});

  @override
  State<ReceiverView> createState() => _ReceiverViewState();
}

class _ReceiverViewState extends State<ReceiverView> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Kwhite,
        appBar: Bankappbar(
          dontHaveBackAsLeading: false,
          title: "Receiver Details",
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/blooddrop.png",
                  height: 60.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  width: 180.w,
                  child: Text(
                    apiController.receiverView["patientFirstName"]
                            .toString()
                            .capitalizeFirst! +
                        " " +
                        apiController.receiverView["patientLastName"],
                    // "Mehar",
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
                          apiController.newChatpartner.value = apiController
                                      .receiverView["patientFirstName"]
                                  // apiController
                                  //             .donorsData[
                                  //         index][
                                  //     "firstName"]
                                  +
                                  " " +
                                  apiController.receiverView["patientLastName"]
                              // apiController
                              //             .donorsData[
                              //         index][
                              //     "lastName"]
                              ;
                          apiController.newChatpartnerBg.value =
                                  apiController.receiverView["bloodGroup"]
                              // apiController
                              //         .donorsData[
                              //     index]
                              // ["bloodGroup"]
                              ;
                        });
                        var payload = {
                          "receiverId": apiController.receiverView["_id"]
                          // apiController
                          //         .donorsData[
                          //     index]["_id"]
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
                        launch("tel://${apiController.receiverView["author"]}");
                      },
                      child: Icon(
                        Icons.call,
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
                        "Contact",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp, color: KText, fontWeight: kFW500),
                      ),
                      Text(
                        apiController.receiverView["author"],
                        // apiController.receiverView["patientFirstName"]
                        //         .toString()
                        //         .capitalizeFirst! +
                        //     " " +
                        //     apiController.receiverView["patientLastName"],
                        // // "Mehar",
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
                      apiController.receiverView["gender"],
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
                        apiController.receiverView["bloodGroup"],
                        // apiController.receiverView["patientFirstName"]
                        //         .toString()
                        //         .capitalizeFirst! +
                        //     " " +
                        //     apiController.receiverView["patientLastName"],
                        // // "Mehar",
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
                      "Request type",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                          fontSize: 11.sp, color: KText, fontWeight: kFW500),
                    ),
                    Text(
                      apiController.receiverView["requestType"],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hospital",
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      fontSize: 11.sp, color: KText, fontWeight: kFW500),
                ),
                Text(
                  // apiController.receiverView["requestType"],

                  apiController.receiverView["hospitalName"]
                          .toString()
                          .capitalizeFirst! ??
                      "No Hospital Name",
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
