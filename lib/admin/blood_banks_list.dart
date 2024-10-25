import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class BloodBanksList extends StatefulWidget {
  const BloodBanksList({super.key});

  @override
  State<BloodBanksList> createState() => _BloodBanksListState();
}

class _BloodBanksListState extends State<BloodBanksList> {
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
      apiController.getBanksListforBank();
    } else {
      apiController.getBanksList();
    }
    ;
    // apiController.bankdonorsData = apiController.OriginalbankdonorsData;
    // apiController.bankdonorsData = apiController.bankdonorsDatafilter;
    // apiController.calculateDistance();
    super.initState();
  }

  ///Distance of points
  //   double _distanceInMeters = 0.0;

  // // @override
  // // void initState() {
  // //   super.initState();
  // //   _calculateDistance();
  // // }

  // void _calculateDistance() {
  //   const double startLatitude = 37.42796133580664;
  //   const double startLongitude = -122.085749655962;
  //   const double endLatitude = 37.7749;
  //   const double endLongitude = -122.4194;

  //   _distanceInMeters = Geolocator.distanceBetween(
  //     startLatitude,
  //     startLongitude,
  //     endLatitude,
  //     endLongitude,
  //   );

  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Blood Banks Lists",
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => apiController.bankListLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : apiController.bankdonorsData.isEmpty ||
                    apiController.bankdonorsData == null
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
                                        width: 80.w,
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
                                            apiController.bankfilterbg.value,
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
                                              apiController.bankfilterbg.value =
                                                  value.toString();
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
                                        apiController.counter <= 0
                                            ? SizedBox()
                                            : InkWell(
                                                onTap: () {
                                                  apiController.decrement();
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
                                            '${apiController.counter} kms',
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
                                              apiController.increment();
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
                                  apiController.getBanksListforBank();
                                } else {
                                  apiController.getBanksList();
                                }
                                ;
                                // apiController.getBanksList();
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
                        "No Banks",
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
                                            apiController.bankfilterbg.value,
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
                                              apiController.bankfilterbg.value =
                                                  value.toString();
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
                              ],
                            ),
                            apiController.profileData["employeeType"] == "Donor"
                                ? SizedBox()
                                : InkWell(
                                    onTap: () {
                                      if (apiController
                                              .profileData["employeeType"] !=
                                          "Donor") {
                                        apiController.getBanksListforBank();
                                      } else {
                                        apiController.getBanksList();
                                      }
                                      ;
                                      // apiController.getBanksList();
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
                              apiController.bankdonorsData.value = apiController
                                  .bankdonorsDatafilter
                                  .where((element) => element["bloodBankName"]
                                      .toString()
                                      .toLowerCase()
                                      .contains(value.toString().toLowerCase()))
                                  .toList();
                            });
                            if (value == "") {
                              //  apiController.getRceiversLocationforBank();
                              setState(() {
                                apiController.bankdonorsData.value =
                                    apiController.OriginalbankdonorsData;
                              });
                            }
                            if (apiController.bankdonorsData.isEmpty &&
                                value != "") {
                              Fluttertoast.showToast(
                                  msg: "No Banks Available ,Search Again");
                              //  apiController.getRceiversLocationforBank();
                              setState(() {
                                apiController.bankdonorsData.value =
                                    apiController.bankdonorsDataCopy;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.w),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: apiController.bankdonorsData.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    apiController.bankView.value =
                                        apiController.bankdonorsData[index];
                                  });
                                  Get.toNamed(kbankView);
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
                                      apiController.bankdonorsData[index]
                                                  ["profile"] ==
                                              null
                                          ? CircleAvatar(
                                              backgroundColor: Kwhite,
                                              radius: 26.r,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        200.r),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        200.r),
                                                child: CachedNetworkImage(
                                                  imageUrl: kBaseImageUrl +
                                                      apiController
                                                              .bankdonorsData[
                                                          index]["profile"],
                                                  // apiController
                                                  //     .profileData["profile"],
                                                  placeholder: (context, url) =>
                                                      SizedBox(
                                                    height: 60.h,
                                                    width: 60.w,
                                                    child: Shimmer.fromColors(
                                                      baseColor: Colors.black12,
                                                      highlightColor: Colors
                                                          .white
                                                          .withOpacity(0.5),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Kwhite
                                                              .withOpacity(0.5),
                                                        ),
                                                        height: 60.h,
                                                        width: 60.w,
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          CircleAvatar(
                                                    backgroundColor: Kwhite,
                                                    radius: 50.r,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200.r),
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
                                      // Image.asset(
                                      //   "assets/images/blooddrop.png",
                                      //   height: 60.h,
                                      // ),
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
                                                    // "${apiController.distanceInKilometers}",

                                                    apiController
                                                            .bankdonorsData[
                                                                index][
                                                                "bloodBankName"]
                                                            .toString()
                                                            .capitalizeFirst! ??
                                                        "No name",

                                                    // "Mehar",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: kSixteenFont,
                                                        color: KdarkText,
                                                        fontWeight: kFW500),
                                                  ),
                                                ),
                                                //["mobile"]["coordinates"]
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        launch(
                                                            "tel://${apiController.bankdonorsData[index]["mobile"]}");
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
                                                      width: 20.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        launch(Uri(
                                                          scheme: 'mailto',
                                                          path: apiController
                                                                  .bankdonorsData[
                                                              index]["email"],
                                                          // queryParameters: {
                                                          //   'subject': 'HI',
                                                          //   'body': 'Hello',
                                                          // },
                                                        ).toString());

                                                        //    launch(params.toString());
                                                      },
                                                      child: Icon(
                                                        Icons.mail,
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
                                              Text(
                                                "role : ",

                                                //"Male",
                                                style: GoogleFonts.roboto(
                                                    fontSize: kTwelveFont,
                                                    color: KText,
                                                    fontWeight: kFW500),
                                              ),
                                              Text(
                                                apiController
                                                        .bankdonorsData[index]
                                                    ["employeeType"],

                                                //"Male",
                                                style: GoogleFonts.roboto(
                                                    fontSize: kTwelveFont,
                                                    color: KText,
                                                    fontWeight: kFW500),
                                              ),
                                              SizedBox(
                                                width: 150.w,
                                                child: Text(
                                                  "     | distance : " +
                                                      apiController
                                                          .bankdonorsData[index]
                                                              ["distance"]
                                                          .toStringAsFixed(2) +
                                                      "kms",
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
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //   height: 5.h,
                                          // ),
                                          // Text(
                                          //   apiController.donorsData[index]
                                          //       ["bloodGroup"],

                                          //   // "B+ve",
                                          //   style:GoogleFonts.roboto(
                                          //       fontSize: kTwelveFont,
                                          //       color: KlightText,
                                          //       fontWeight: kFW500), // KlightText
                                          // ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          apiController.bankdonorsData[index]
                                                      ["bloodGroups"] ==
                                                  null
                                              ? SizedBox()
                                              : apiController.profileData[
                                                          "employeeType"] ==
                                                      "Donor"
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          "groups : ",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          //"Male",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      kTwelveFont,
                                                                  color: KText,
                                                                  fontWeight:
                                                                      kFW500),
                                                        ),
                                                        SizedBox(
                                                          width: 190.w,
                                                          child: Wrap(
                                                            children: [
                                                              for (int i = 0;
                                                                  //  i < interests.length;
                                                                  i <
                                                                      apiController
                                                                          .bankdonorsData[
                                                                              index]
                                                                              [
                                                                              "bloodGroups"]
                                                                          .length;
                                                                  i++)
                                                                apiController.bankdonorsData[index]["bloodGroups"][i]
                                                                            [
                                                                            "bloodGroup"] ==
                                                                        apiController
                                                                            .profileData["bloodGroup"]
                                                                    ? Text(
                                                                        "| " +
                                                                            apiController.bankdonorsData[index]["bloodGroups"][i]["bloodGroup"] +
                                                                            "  _  " +
                                                                            apiController.bankdonorsData[index]["bloodGroups"][i]["howMuchQuatity"] +
                                                                            "  U  ",

                                                                        //  "${apiController.bankdonorsData[index]["distance"]} km",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        //"Male",
                                                                        style: GoogleFonts.roboto(
                                                                            fontSize:
                                                                                kTwelveFont,
                                                                            color:
                                                                                KText,
                                                                            fontWeight:
                                                                                kFW500),
                                                                      )
                                                                    : SizedBox()
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          "groups : ",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          //"Male",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize:
                                                                      kTwelveFont,
                                                                  color: KText,
                                                                  fontWeight:
                                                                      kFW500),
                                                        ),
                                                        SizedBox(
                                                          width: 190.w,
                                                          child: Wrap(
                                                            children: [
                                                              for (int i = 0;
                                                                  //  i < interests.length;
                                                                  i <
                                                                      apiController
                                                                          .bankdonorsData[
                                                                              index]
                                                                              [
                                                                              "bloodGroups"]
                                                                          .length;
                                                                  i++)
                                                                Text(
                                                                  "| " +
                                                                      apiController.bankdonorsData[index]["bloodGroups"]
                                                                              [
                                                                              i]
                                                                          [
                                                                          "bloodGroup"] +
                                                                      "  _  " +
                                                                      apiController
                                                                              .bankdonorsData[index]["bloodGroups"][i]
                                                                          [
                                                                          "howMuchQuatity"] +
                                                                      "  U  ",

                                                                  //  "${apiController.bankdonorsData[index]["distance"]} km",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  //"Male",
                                                                  style: GoogleFonts.roboto(
                                                                      fontSize:
                                                                          kTwelveFont,
                                                                      color:
                                                                          KText,
                                                                      fontWeight:
                                                                          kFW500),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          apiController.bankdonorsData[index]
                                                      ["address"] ==
                                                  null
                                              ? SizedBox()
                                              : Row(
                                                  children: [
                                                    Text(
                                                      "address : ",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      //  "Nizamabad, Telangana, Hyderabad",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: kTwelveFont,
                                                          color: Ktextcolor,
                                                          fontWeight:
                                                              kFW500), // KlightText
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        apiController.bankdonorsData[
                                                                    index]
                                                                ["address"] ??
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
