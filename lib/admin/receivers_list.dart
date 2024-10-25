import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class ReceiversList extends StatefulWidget {
  const ReceiversList({super.key});

  @override
  State<ReceiversList> createState() => _ReceiversListState();
}

class _ReceiversListState extends State<ReceiversList> {
  ApiController apicontroller = Get.put(ApiController());
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

  ApiController apiController = Get.put(ApiController());
  @override
  void initState() {
    if (apiController.profileData["employeeType"] != "Donor") {
      apiController.getRceiversLocationforBank();
    } else {
      apiController.getRceiversLocation();
    }
    ;
    apiController.reciversData = apiController.OriginalreciversData;
    apiController.reciversData = apiController.reciversDatafilter;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: true,
        title: "Receivers List",
      ),
      // AppBar(
      //   backgroundColor: Kwhite,
      //   automaticallyImplyLeading: false,
      //   // leading: GestureDetector(
      //   //   onTap: () {
      //   //     Get.back();
      //   //   },
      //   //   child: Icon(
      //   //     Icons.arrow_back_ios,
      //   //     color: KTextdark,
      //   //   ),
      //   // ),
      //   titleSpacing: 20.w,
      //   title: Text(
      //     "Receivers List",
      //     style: GoogleFonts.roboto(
      //         fontSize: 22.sp, color: KdarkText, fontWeight: kFW600),
      //   ),
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         Get.toNamed(kNotificationsScreen);
      //       },
      //       child: Icon(
      //         Icons.notifications,
      //         color: KdarkText,
      //       ),
      //     ),
      //     SizedBox(
      //       width: 10.w,
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
          child: Obx(
        () => apiController.receiversdataLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : apiController.reciversData.isEmpty ||
                    apiController.reciversData == null
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                apiController.profileData["employeeType"] ==
                                        "Donor"
                                    ? SizedBox()
                                    : Container(
                                        width: 85.w,
                                        // width: 50.w,
                                        height: 37.h,
                                        margin: EdgeInsets.only(
                                            right: 10.w,
                                            top: orientation ==
                                                    Orientation.portrait
                                                ? 0
                                                : 12.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: DropdownButtonFormField2<String>(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kbloodred, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kbloodred, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          hint: Text(
                                            apiController
                                                .receiverfilterbg.value,
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: KdarkText,
                                            ),
                                          ),
                                          items: bloodgroupss
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select BloodGroup.';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              apiController.receiverfilterbg
                                                  .value = value.toString();
                                              selectedValue = value.toString();
                                              print(selectedValue);
                                            });

                                            // authentication.registerDonorBloodController.value =
                                            //     selectedValue as TextEditingValue;
                                            //Do something when selected item is changed.
                                          },
                                          onSaved: (value) {
                                            selectedValue = value.toString();
                                            print(selectedValue);
                                            // authentication.registerDonorBloodController.value =
                                            //     selectedValue as TextEditingValue;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.only(right: 8),
                                          ),
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: kblack.withOpacity(0.6),
                                            ),
                                            iconSize: 24,
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                        ),
                                      ),

                                // Container(
                                //     width: 50.w,
                                //     height: 37.h,
                                //     margin: EdgeInsets.only(right: 10.w),
                                //     decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadius.circular(10.0),
                                //     ),
                                //     child: DropdownButtonFormField2<String>(
                                //       isExpanded: true,
                                //       decoration: InputDecoration(
                                //         enabledBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color:
                                //                   kblack.withOpacity(0.6),
                                //               width: 0.5),
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //         errorBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color:
                                //                   kblack.withOpacity(0.6),
                                //               width: 0.5),
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //         disabledBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color:
                                //                   kblack.withOpacity(0.6),
                                //               width: 0.5),
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //         focusedErrorBorder:
                                //             OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color: kbloodred, width: 1),
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //         focusedBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //               color: kbloodred, width: 1),
                                //           borderRadius:
                                //               BorderRadius.circular(10.r),
                                //         ),
                                //         contentPadding:
                                //             const EdgeInsets.symmetric(
                                //                 vertical: 10,
                                //                 horizontal: 8),
                                //         border: OutlineInputBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //         ),
                                //       ),
                                //       hint: Text(
                                //         'Select Blood Group',
                                //         style: GoogleFonts.roboto(
                                //           fontSize: 14,
                                //           color: KTextgery.withOpacity(0.5),
                                //         ),
                                //       ),
                                //       items: bloodgroupss
                                //           .map((item) =>
                                //               DropdownMenuItem<String>(
                                //                 value: item,
                                //                 child: Text(
                                //                   item,
                                //                   style: const GoogleFonts.roboto(
                                //                     fontSize: 14,
                                //                   ),
                                //                 ),
                                //               ))
                                //           .toList(),
                                //       validator: (value) {
                                //         if (value == null) {
                                //           return 'Please select BloodGroup.';
                                //         }
                                //         return null;
                                //       },
                                //       onChanged: (value) {
                                //         setState(() {
                                //           apiController.receiverfilterbg
                                //               .value = value.toString();
                                //           selectedValue = value.toString();
                                //           print(selectedValue);
                                //         });

                                //         // authentication.registerDonorBloodController.value =
                                //         //     selectedValue as TextEditingValue;
                                //         //Do something when selected item is changed.
                                //       },
                                //       onSaved: (value) {
                                //         selectedValue = value.toString();
                                //         print(selectedValue);
                                //         // authentication.registerDonorBloodController.value =
                                //         //     selectedValue as TextEditingValue;
                                //       },
                                //       buttonStyleData:
                                //           const ButtonStyleData(
                                //         padding: EdgeInsets.only(right: 8),
                                //       ),
                                //       iconStyleData: IconStyleData(
                                //         icon: Icon(
                                //           Icons.arrow_drop_down,
                                //           color: kblack.withOpacity(0.6),
                                //         ),
                                //         iconSize: 24,
                                //       ),
                                //       dropdownStyleData: DropdownStyleData(
                                //         decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(15),
                                //         ),
                                //       ),
                                //       menuItemStyleData:
                                //           const MenuItemStyleData(
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 16),
                                //       ),
                                //     ),
                                //   ),

                                Container(
                                    //  height: 50.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Ktextcolor.withOpacity(0.4)),
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    padding: EdgeInsets.only(
                                        left: 7.w,
                                        right: 7.w,
                                        top: 6.h,
                                        bottom: 6.h),
                                    child: Row(
                                      children: <Widget>[
                                        // _itemCount !=
                                        //         0
                                        //     ?
                                        apiController.receivercounter <= 0
                                            ? SizedBox()
                                            : InkWell(
                                                onTap: () {
                                                  apiController
                                                      .receiverdecrement();
                                                },
                                                // onTap: () {
                                                //   setState(
                                                //       () => apiController.range--);

                                                // setState(() {
                                                //   apiController.range.value =
                                                //       apiController.range-- as int;
                                                // });
                                                // if (cartapicontroller.cartidData[0]["CartItems"][index]["quantity"] >= 2) {
                                                //   cartapicontroller.cartidData[0]["CartItems"][index]["quantity"]--;
                                                // } else {
                                                //   await orderController.deletecart(cartapicontroller.cartidData[0]["CartItems"][index]["cart_item_id"]);
                                                // }

                                                // setState(() {});
                                                //  },
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: KdarkText,
                                                )),
                                        //     : InkWell(onTap: () {}, child: const Icon(Icons.remove, color: Kgreen)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Obx(
                                          () => Text(
                                            //   apiController.range.toString() +
                                            '${apiController.receivercounter} kms',
                                            //   " kms",
                                            // "${cartapicontroller.cartidData[0]["CartItems"][index]["quantity"]}",
                                            style: GoogleFonts.roboto(
                                                color: KdarkText,
                                                fontWeight: kFW700),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              apiController.receiverincrement();
                                            },
                                            // onTap: () {
                                            //   setState(
                                            //       () => apiController.range++);
                                            // },
                                            child: const Icon(
                                              Icons.add,
                                              color: KdarkText,
                                            )),
                                      ],
                                    )),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if (apiController.profileData["employeeType"] !=
                                    "Donor") {
                                  apiController.getRceiversLocationforBank();
                                } else {
                                  apiController.getRceiversLocation();
                                }
                                ;
                                //   apiController.getRceiversLocation();
                              },
                              child: Container(
                                //  height: 50.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: kbloodred.withOpacity(0.4)),
                                    borderRadius: BorderRadius.circular(10.r)),
                                padding: EdgeInsets.only(
                                    left: 7.w,
                                    right: 7.w,
                                    top: 3.h,
                                    bottom: 3.h),
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.roboto(
                                      fontSize: kSixteenFont,
                                      color: kbloodred,
                                      fontWeight: kFW500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "No Receivers",
                        style: GoogleFonts.roboto(
                            fontSize: kSixteenFont,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                apiController.profileData["employeeType"] ==
                                        "Donor"
                                    ? SizedBox()
                                    : Container(
                                        width: 85.w,
                                        // width: 50.w,
                                        height: 37.h,
                                        margin: EdgeInsets.only(right: 10.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: DropdownButtonFormField2<String>(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      kblack.withOpacity(0.6),
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kbloodred, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: kbloodred, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          hint: Text(
                                            apiController
                                                .receiverfilterbg.value,
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: KdarkText,
                                            ),
                                          ),
                                          items: bloodgroupss
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return 'Please select BloodGroup.';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              apiController.receiverfilterbg
                                                  .value = value.toString();
                                              selectedValue = value.toString();
                                              print(selectedValue);
                                            });

                                            // authentication.registerDonorBloodController.value =
                                            //     selectedValue as TextEditingValue;
                                            //Do something when selected item is changed.
                                          },
                                          onSaved: (value) {
                                            selectedValue = value.toString();
                                            print(selectedValue);
                                            // authentication.registerDonorBloodController.value =
                                            //     selectedValue as TextEditingValue;
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.only(right: 8),
                                          ),
                                          iconStyleData: IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: kblack.withOpacity(0.6),
                                            ),
                                            iconSize: 24,
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                        ),
                                      ),
                                // Container(
                                //     //  height: 50.h,
                                //     decoration: BoxDecoration(
                                //         border: Border.all(
                                //             color: Ktextcolor.withOpacity(0.4)),
                                //         borderRadius:
                                //             BorderRadius.circular(10.r)),
                                //     padding: EdgeInsets.only(
                                //         left: 7.w,
                                //         right: 7.w,
                                //         top: 6.h,
                                //         bottom: 6.h),
                                //     child: Row(
                                //       children: <Widget>[
                                //         // _itemCount !=
                                //         //         0
                                //         //     ?
                                //         apiController.receivercounter <= 0
                                //             ? SizedBox()
                                //             : InkWell(
                                //                 onTap: () {
                                //                   apiController
                                //                       .receiverdecrement();
                                //                 },
                                //                 // onTap: () {
                                //                 //   setState(
                                //                 //       () => apiController.range--);

                                //                 // setState(() {
                                //                 //   apiController.range.value =
                                //                 //       apiController.range-- as int;
                                //                 // });
                                //                 // if (cartapicontroller.cartidData[0]["CartItems"][index]["quantity"] >= 2) {
                                //                 //   cartapicontroller.cartidData[0]["CartItems"][index]["quantity"]--;
                                //                 // } else {
                                //                 //   await orderController.deletecart(cartapicontroller.cartidData[0]["CartItems"][index]["cart_item_id"]);
                                //                 // }

                                //                 // setState(() {});
                                //                 //  },
                                //                 child: const Icon(
                                //                   Icons.remove,
                                //                   color: KdarkText,
                                //                 )),
                                //         //     : InkWell(onTap: () {}, child: const Icon(Icons.remove, color: Kgreen)),
                                //         SizedBox(
                                //           width: 10.w,
                                //         ),
                                //         Obx(
                                //           () => Text(
                                //             //   apiController.range.toString() +
                                //             '${apiController.receivercounter} kms',
                                //             //   " kms",
                                //             // "${cartapicontroller.cartidData[0]["CartItems"][index]["quantity"]}",
                                //             style: GoogleFonts.roboto(
                                //                 color: KdarkText,
                                //                 fontWeight: kFW700),
                                //           ),
                                //         ),
                                //         SizedBox(
                                //           width: 10.w,
                                //         ),
                                //         InkWell(
                                //             onTap: () {
                                //               apiController.receiverincrement();
                                //             },
                                //             // onTap: () {
                                //             //   setState(
                                //             //       () => apiController.range++);
                                //             // },
                                //             child: const Icon(
                                //               Icons.add,
                                //               color: KdarkText,
                                //             )),
                                //       ],
                                //     )),
                              ],
                            ),
                            apiController.profileData["employeeType"] == "Donor"
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      if (apiController
                                              .profileData["employeeType"] !=
                                          "Donor") {
                                        apiController
                                            .getRceiversLocationforBank();
                                      } else {
                                        apiController.getRceiversLocation();
                                      }
                                      ;
                                      // apiController.getRceiversLocation();
                                    },
                                    child: Container(
                                      //  height: 50.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  kbloodred.withOpacity(0.4)),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      padding: EdgeInsets.only(
                                          left: 7.w,
                                          right: 7.w,
                                          top: 3.h,
                                          bottom: 3.h),
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.roboto(
                                            fontSize: kSixteenFont,
                                            color: kbloodred,
                                            fontWeight: kFW500),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        height:
                            orientation == Orientation.portrait ? 45.h : 20.h,
                        margin: EdgeInsets.all(15.w),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Ktextcolor.withOpacity(0.3),
                              blurRadius: 0.5.r,
                              spreadRadius: 0.5.r,
                            )
                          ],
                          color: Kwhite,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: TextFormField(
                          style: GoogleFonts.roboto(
                              fontSize: 13.sp,
                              fontWeight: kFW500,
                              color: kblack.withOpacity(0.8)),
                          decoration: InputDecoration(
                            // prefixIcon: Icon(
                            //   Icons.search,
                            //   color: Ktextcolor.withOpacity(0.7),
                            // ),
                            focusColor: Kwhite.withOpacity(0.5),
                            filled: true,
                            hintText: " Search  ",
                            //"Search Categories"

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Ktextcolor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Ktextcolor.withOpacity(0.3),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Ktextcolor.withOpacity(0.3),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Ktextcolor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Ktextcolor.withOpacity(0.3), width: 1),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            fillColor: Kwhite,
                            // suffixIcon: suffix,
                            // prefixIcon: prefix,
                            // hintText: hintText,

                            //make hint text
                            hintStyle: GoogleFonts.roboto(
                              color: KTextgery.withOpacity(0.5),
                              fontSize: 12.sp,
                              fontWeight: kFW500,
                            ),

                            //create lable
                          ),
                          onChanged: (value) {
                            setState(() {
                              //                                   apiController.assetsData = apiController.OriginalassetsData;
                              // apiController.assetsData = apiController.assetsDatafilter;
                              apiController.reciversData.value = apiController
                                  .reciversDatafilter
                                  .where((element) =>
                                      element["patientFirstName"]
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              value.toString().toLowerCase()) ||
                                      element["patientLastName"]
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              value.toString().toLowerCase()) ||
                                      element["requestType"]
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              value.toString().toLowerCase()))
                                  .toList();
                            });
                            if (value == "") {
                              //  apiController.getRceiversLocationforBank();
                              setState(() {
                                apiController.reciversData.value =
                                    apiController.OriginalreciversData;
                              });
                            }
                            if (apiController.reciversData.isEmpty &&
                                value != "") {
                              Fluttertoast.showToast(
                                  msg: "No Receivers Available ,Search Again");
                              //  apiController.getRceiversLocationforBank();
                              setState(() {
                                apiController.reciversData.value =
                                    apiController.reciversDataCopy;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.w),
                        padding: EdgeInsets.only(bottom: 90.h),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: apiController.reciversData.length,
                            itemBuilder: (context, index) {
                              return
                                  //receiverview
                                  InkWell(
                                onTap: () {
                                  // Get.toNamed(kRceiverView);
                                  setState(() {
                                    apicontroller.receiverView.value =
                                        apiController.reciversData[index];
                                  });
                                  print(apicontroller.receiverView.value);
                                  Get.toNamed(kRceiverView);
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                SizedBox(
                                                  width: 150.w,
                                                  child: Text(
                                                    apiController
                                                            .reciversData[index]
                                                                [
                                                                "patientFirstName"]
                                                            .toString()
                                                            .capitalizeFirst! +
                                                        " " +
                                                        apiController
                                                                    .reciversData[
                                                                index]
                                                            ["patientLastName"],
                                                    // "Mehar",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: kSixteenFont,
                                                        color: KdarkText,
                                                        fontWeight: kFW500),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          apicontroller
                                                                  .newChatpartner
                                                                  .value = apiController
                                                                              .reciversData[
                                                                          index]
                                                                      [
                                                                      "patientFirstName"]
                                                                  // apiController
                                                                  //             .donorsData[
                                                                  //         index][
                                                                  //     "firstName"]
                                                                  +
                                                                  " " +
                                                                  apiController
                                                                              .reciversData[
                                                                          index]
                                                                      [
                                                                      "patientLastName"]
                                                              // apiController
                                                              //             .donorsData[
                                                              //         index][
                                                              //     "lastName"]
                                                              ;
                                                          apicontroller
                                                                  .newChatpartnerBg
                                                                  .value = apiController
                                                                          .reciversData[
                                                                      index]
                                                                  ["bloodGroup"]
                                                              // apiController
                                                              //         .donorsData[
                                                              //     index]
                                                              // ["bloodGroup"]
                                                              ;
                                                        });
                                                        var payload = {
                                                          "receiverId":
                                                              apiController
                                                                      .reciversData[
                                                                  index]["_id"]
                                                          // apiController
                                                          //         .donorsData[
                                                          //     index]["_id"]
                                                          //    "66912b20cd8503daed4fd666"
                                                        };
                                                        apicontroller
                                                            .socketioCreateChat(
                                                                payload);
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
                                                        color: kbloodred
                                                            .withOpacity(
                                                          0.5,
                                                        ),
                                                        size: 18.sp,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 12.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        launch(
                                                            "tel://${apiController.reciversData[index]["author"]}");
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
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              apiController.reciversData[index]
                                                          ["gender"] ==
                                                      null
                                                  ? SizedBox()
                                                  : Text(
                                                      "gender : " +
                                                              apiController
                                                                          .reciversData[
                                                                      index]
                                                                  ["gender"] ??
                                                          "No gender",

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
                                          Text(
                                            // apiController.donorsData[index]
                                            "group : " +
                                                apiController
                                                        .reciversData[index]
                                                    ["bloodGroup"] +
                                                "  | " +
                                                "request type : " +
                                                apiController
                                                        .reciversData[index]
                                                    ["requestType"],

                                            // "B+ve",
                                            style: GoogleFonts.roboto(
                                                fontSize: kTwelveFont,
                                                color: KlightText,
                                                fontWeight:
                                                    kFW500), // KlightText
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              // Icon(
                                              //   Icons.location_on_sharp,
                                              //   color: Ktextcolor.withOpacity(
                                              //     0.5,
                                              //   ),
                                              //   size: 18.sp,
                                              // ),
                                              apiController.reciversData[index]
                                                          ["hospitalName"] ==
                                                      null
                                                  ? SizedBox()
                                                  : Text(
                                                      "Hospital : " +
                                                              apiController
                                                                  .reciversData[
                                                                      index][
                                                                      "hospitalName"]
                                                                  .toString()
                                                                  .capitalizeFirst! ??
                                                          "No Hospital Name",
                                                      //  "Nizamabad, Telangana, Hyderabad",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: kTwelveFont,
                                                          color: Ktextcolor,
                                                          fontWeight:
                                                              kFW500), // KlightText
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
      )),
    );
  }
}
