import 'package:nuhvinbloodbank/untils/export_file.dart';

class BloodDataList extends StatefulWidget {
  const BloodDataList({super.key});

  @override
  State<BloodDataList> createState() => _BloodDataListState();
}

class _BloodDataListState extends State<BloodDataList> {
  ApiController apiController = Get.put(ApiController());
  ////////////////////////
  final TextEditingController mlController1 = TextEditingController();
  final TextEditingController mlController2 = TextEditingController();
  final TextEditingController mlController3 = TextEditingController();
  final TextEditingController mlController4 = TextEditingController();
  final TextEditingController mlController5 = TextEditingController();
  final TextEditingController mlController6 = TextEditingController();
  final TextEditingController mlController7 = TextEditingController();
  final TextEditingController mlController8 = TextEditingController();
  final TextEditingController mlController9 = TextEditingController();
  final TextEditingController mlController10 = TextEditingController();

  final TextEditingController unitsController1 = TextEditingController();
  final TextEditingController unitsController2 = TextEditingController();
  final TextEditingController unitsController3 = TextEditingController();
  final TextEditingController unitsController4 = TextEditingController();
  final TextEditingController unitsController5 = TextEditingController();
  final TextEditingController unitsController6 = TextEditingController();
  final TextEditingController unitsController7 = TextEditingController();
  final TextEditingController unitsController8 = TextEditingController();
  final TextEditingController unitsController9 = TextEditingController();
  final TextEditingController unitsController10 = TextEditingController();

  double mlToUnits(double ml) {
    // Conversion logic: 1 unit = 450 ml
    return ml / 450;
  }

  double unitsToMl(double units) {
    // Conversion logic: 1 unit = 450 ml
    return units * 450;
  }

  void updateUnitsFromMl(TextEditingController mlController,
      TextEditingController unitsController) {
    final double mlValue = double.tryParse(mlController.text) ?? 0;
    final double unitsValue = mlToUnits(mlValue);
    unitsController.text = unitsValue.toStringAsFixed(2);
  }

  void updateMlFromUnits(TextEditingController unitsController,
      TextEditingController mlController) {
    final double unitsValue = double.tryParse(unitsController.text) ?? 0;
    final double mlValue = unitsToMl(unitsValue);
    mlController.text = mlValue.toStringAsFixed(2);
  }

  ////////////////
  @override
  void initState() {
    setState(() {
      apiController.selectedBloodCardIndex.value = 0;

      apiController.isBloodCardSelected.value = false;
      print(apiController.selectedBloodCardIndex.value);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: true,
        title: "Available Blood",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.w),
          padding: EdgeInsets.only(bottom: 90.h),
          child: Obx(() => apiController.profileData["bloodGroups"] == null
              ? UpdateBloodStatus()
              // Container( //change here
              //     margin: EdgeInsets.only(top: 100.h),
              //     alignment: Alignment.center,
              //     child: Text(
              //       "No Blood Data",
              //       style: GoogleFonts.roboto(
              //           fontSize: kSixteenFont,
              //           color: KdarkText,
              //           fontWeight: kFW500),
              //     ),
              //   )
              : apiController.profileData["bloodGroups"].length == 0
                  ? Container(
                      margin: EdgeInsets.only(top: 100.h),
                      alignment: Alignment.center,
                      child: Text(
                        "No Blood Data",
                        style: GoogleFonts.roboto(
                            fontSize: kSixteenFont,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          apiController.profileData["bloodGroups"].length,
                      itemBuilder: (context, index) {
                        double units = double.parse(
                                apiController.profileData["bloodGroups"][index]
                                    ["howMuchQuatity"]) *
                            450;
                        return Obx(() => apiController.selectedBloodCardIndex ==
                                    index &&
                                apiController.isBloodCardSelected == true
                            ? Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    index == 0
                                        ? _buildRow(1, mlController1,
                                            unitsController1, "A+")
                                        : index == 1
                                            ? _buildRow(2, mlController2,
                                                unitsController2, "A-")
                                            : index == 2
                                                ? _buildRow(3, mlController3,
                                                    unitsController3, "B+")
                                                : index == 3
                                                    ? _buildRow(
                                                        4,
                                                        mlController4,
                                                        unitsController4,
                                                        "B-")
                                                    : index == 4
                                                        ? _buildRow(
                                                            7,
                                                            mlController7,
                                                            unitsController7,
                                                            "AB+")
                                                        : index == 5
                                                            ? _buildRow(
                                                                8,
                                                                mlController8,
                                                                unitsController8,
                                                                "AB-")
                                                            : index == 6
                                                                ? _buildRow(
                                                                    6,
                                                                    mlController6,
                                                                    unitsController6,
                                                                    "O-")
                                                                : index == 7
                                                                    ? _buildRow(
                                                                        5,
                                                                        mlController5,
                                                                        unitsController5,
                                                                        "O+")
                                                                    : index == 8
                                                                        ? _buildRow(
                                                                            9,
                                                                            mlController9,
                                                                            unitsController9,
                                                                            "RH+")
                                                                        : _buildRow(
                                                                            10,
                                                                            mlController10,
                                                                            unitsController10,
                                                                            "RH-"),
                                    CustomButton(
                                      // margin: EdgeInsets.all(20.r),
                                      borderRadius: BorderRadius.circular(10.r),
                                      Color: kbloodred,
                                      textColor: Kwhite,
                                      margin: EdgeInsets.only(top: 13.w),
                                      height: 32.h,
                                      width: 100.w,
                                      label: "Update",
                                      fontSize: 11.sp,
                                      fontWeight: kFW400,
                                      isLoading: false,
                                      onTap: () async {
                                        var payload = [
                                          {
                                            "bloodGroup": "A+",
                                            "howMuchQuatity":
                                                unitsController1.text
                                            //mlController1.text
                                            // authentication.ApquantityController.text
                                          },
                                          {
                                            "bloodGroup": "A-",
                                            "howMuchQuatity":
                                                unitsController2.text
                                            //mlController2.text
                                            // authentication.AnquantityController.text
                                          },
                                          {
                                            "bloodGroup": "B+",
                                            "howMuchQuatity":
                                                unitsController3.text
                                            //mlController3.text
                                            // authentication.bpquantityController.text
                                          },
                                          {
                                            "bloodGroup": "B-",
                                            "howMuchQuatity":
                                                unitsController4.text
                                            //mlController4.text
                                            // authentication.bnquantityController.text
                                          },
                                          {
                                            "bloodGroup": "AB+",
                                            "howMuchQuatity":
                                                unitsController7.text
                                            // mlController7.text
                                            // authentication.abpquantityController.text
                                          },
                                          {
                                            "bloodGroup": "AB-",
                                            "howMuchQuatity":
                                                unitsController8.text
                                            // mlController8.text
                                            // authentication.abnquantityController.text
                                          },
                                          {
                                            "bloodGroup": "O-",
                                            "howMuchQuatity":
                                                unitsController6.text
                                            //mlController6.text
                                            // mlController4.text
                                            // authentication.onquantityController.text
                                          },
                                          {
                                            "bloodGroup": "O+",
                                            "howMuchQuatity":
                                                unitsController5.text
                                            // mlController5.text
                                            // authentication.opquantityController.text
                                          },
                                          {
                                            "bloodGroup": "RH+",
                                            "howMuchQuatity":
                                                unitsController9.text
                                            //mlController6.text
                                            // mlController4.text
                                            // authentication.onquantityController.text
                                          },
                                          {
                                            "bloodGroup": "RH-",
                                            "howMuchQuatity":
                                                unitsController10.text
                                            // mlController5.text
                                            // authentication.opquantityController.text
                                          },
                                        ]

                                            // "mobile": apiController.profileData["mobile"],
                                            // "isAvailable": apiController.switchValues.value
                                            ;

                                        if (unitsController1.text == "" ||
                                            unitsController2.text == "" ||
                                            unitsController3.text == "" ||
                                            unitsController4.text == "" ||
                                            unitsController7.text == "" ||
                                            unitsController8.text == "" ||
                                            unitsController6.text == "" ||
                                            unitsController5.text == "" ||
                                            unitsController9.text == "" ||
                                            unitsController10.text == "") {
                                          Fluttertoast.showToast(
                                            msg: "Please fill fields",
                                          );
                                        } else {
                                          apiController
                                              .bloodAvailability(payload);
                                        }
                                        setState(() {
                                          apiController
                                              .selectedBloodCardIndex.value = 0;

                                          apiController.isBloodCardSelected
                                              .value = false;
                                          print(apiController
                                              .selectedBloodCardIndex.value);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          child: Text(
                                            apiController.profileData[
                                                        "bloodGroups"][index]
                                                    ["bloodGroup"] ??
                                                "No blood Group",
                                            // "Mehar",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                                fontSize: kSixteenFont,
                                                color: KdarkText,
                                                fontWeight: kFW500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        SizedBox(
                                          width: 230.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "${apiController.profileData["bloodGroups"][index]["howMuchQuatity"]}"
                                                            .split('.')[0] +
                                                        "  U",
                                                    maxLines: 1,
                                                    //??
                                                    //  "No Quantity" + "  -  " + "$units",

                                                    //"Male",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: kTwelveFont,
                                                        color: KText,
                                                        fontWeight: kFW500),
                                                  ),
                                                  Text(
                                                    "   -   ",
                                                    maxLines: 1,
                                                    //??
                                                    //  "No Quantity" + "  -  " + "$units",

                                                    //"Male",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: kTwelveFont,
                                                        color: KText,
                                                        fontWeight: kFW500),
                                                  ),
                                                  Text(
                                                    "${units}".split('.')[0] +
                                                        "  ml",
                                                    maxLines: 1,

                                                    //"Male",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: kTwelveFont,
                                                        color: KText,
                                                        fontWeight: kFW500),
                                                  ),
                                                ],
                                              ),

                                              // SizedBox(
                                              //   width: 70.w,
                                              // ),
                                              InkWell(
                                                onTap: () {
                                                  if (apiController.profileData[
                                                          "bloodGroups"] !=
                                                      null) {
                                                    setState(() {
                                                      unitsController1
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][0]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController2
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][1]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController3
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][2]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController4
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][3]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController5
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][7]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController6
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][6]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController7
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][4]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController8
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][5]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController9
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][8]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                      unitsController10
                                                          .text = apiController
                                                                      .profileData[
                                                                  "bloodGroups"][9]
                                                              [
                                                              "howMuchQuatity"] ??
                                                          "0";
                                                    });
                                                  }
                                                  ;
                                                  setState(() {
                                                    apiController
                                                        .selectedBloodCardIndex
                                                        .value = index;

                                                    apiController
                                                        .isBloodCardSelected
                                                        .value = true;
                                                    print(apiController
                                                        .selectedBloodCardIndex
                                                        .value);
                                                  });
                                                },
                                                child: Image.asset(
                                                  "assets/images/edit.png",
                                                  color: KdarkText,
                                                  height: 17.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                      })),
        ),
      ),
    );
  }

  Widget _buildRow(
    int index,
    TextEditingController mlController,
    TextEditingController unitsController,
    String label,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100.w,
          child: CustomFormFields(
            keyboardType: TextInputType.number,
            enabled: true,
            labelColor: KText,
            controller: mlController,
            obscureText: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            fontSize: kFourteenFont,
            fontWeight: FontWeight.w500,
            hintText: "Enter Quantity",
            maxLines: 1,
            readOnly: false,
            label: '$label (Milliliters)',
            onChanged: (_) => updateUnitsFromMl(mlController, unitsController),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Quantity';
              }
              return null;
            },
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        SizedBox(
          width: 100.w,
          child: CustomFormFields(
            keyboardType: TextInputType.number,
            enabled: true,
            labelColor: KText,
            controller: unitsController,
            obscureText: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            fontSize: kFourteenFont,
            fontWeight: FontWeight.w500,
            hintText: "Enter Quantity",
            maxLines: 1,
            readOnly: false,
            label: '$label (Units)',
            onChanged: (_) => updateMlFromUnits(unitsController, mlController),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Quantity';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
