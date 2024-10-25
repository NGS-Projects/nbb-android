import 'package:nuhvinbloodbank/untils/export_file.dart';

class UpdateBloodStatus extends StatefulWidget {
  const UpdateBloodStatus({super.key});

  @override
  State<UpdateBloodStatus> createState() => _UpdateBloodStatusState();
}

class _UpdateBloodStatusState extends State<UpdateBloodStatus> {
  ApiController authentication = Get.put(ApiController());
  final ConversionController controller = Get.put(ConversionController());
  /////////////////////////////////////////////////////////////////////////////////////////////////////
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
  /////////////////////////////////////////////////////////////////////////////////////////
  // String _result = '';

  // // void _calculate() {
  // //   int input = int.tryParse(authentication.ApquantityController.text) ?? 0;
  // //   int units = calculateUnits(input);
  // //   setState(() {
  // //     _result = '$units units';
  // //   });
  // // }
  //   void _calculate() {
  //   int input = int.tryParse(authentication.ApquantityController.text) ?? 0;
  //   double units = calculateUnits(input);
  //   setState(() {
  //     _result = units.toStringAsFixed(2) + ' units';
  //   });
  // }

  String _result1 = '';
  String _result2 = '';
  String _result3 = '';
  String _result4 = '';
  String _result5 = '';
  String _result6 = '';
  String _result7 = '';
  String _result8 = '';
  void _calculateForFirstField() {
    int input = int.tryParse(authentication.ApquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result1 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForSecondField() {
    int input = int.tryParse(authentication.AnquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result2 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForThreeField() {
    int input = int.tryParse(authentication.bpquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result3 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForFourField() {
    int input = int.tryParse(authentication.bnquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result4 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForFiveField() {
    int input = int.tryParse(authentication.opquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result5 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForSixField() {
    int input = int.tryParse(authentication.onquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result6 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForSevenField() {
    int input = int.tryParse(authentication.abpquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result7 = units.toStringAsFixed(2) + ' U';
    });
  }

  void _calculateForEightField() {
    int input = int.tryParse(authentication.abnquantityController.text) ?? 0;
    double units = calculateUnits(input);
    setState(() {
      _result8 = units.toStringAsFixed(2) + ' U';
    });
  }

  @override
  void initState() {
    if (authentication.profileData["bloodGroups"] != null) {
      setState(() {
        unitsController1.text = authentication.profileData["bloodGroups"][0]
                ["howMuchQuatity"] ??
            "0";
        unitsController2.text = authentication.profileData["bloodGroups"][1]
                ["howMuchQuatity"] ??
            "0";
        unitsController3.text = authentication.profileData["bloodGroups"][2]
                ["howMuchQuatity"] ??
            "0";
        unitsController4.text = authentication.profileData["bloodGroups"][3]
                ["howMuchQuatity"] ??
            "0";
        unitsController5.text = authentication.profileData["bloodGroups"][7]
                ["howMuchQuatity"] ??
            "0";
        unitsController6.text = authentication.profileData["bloodGroups"][6]
                ["howMuchQuatity"] ??
            "0";
        unitsController7.text = authentication.profileData["bloodGroups"][4]
                ["howMuchQuatity"] ??
            "0";
        unitsController8.text = authentication.profileData["bloodGroups"][5]
                ["howMuchQuatity"] ??
            "0";
        ///////////////////////////
        unitsController9.text = authentication.profileData["bloodGroups"][8]
                ["howMuchQuatity"] ??
            "0";
        unitsController10.text = authentication.profileData["bloodGroups"][9]
                ["howMuchQuatity"] ??
            "0";
      });
    } else {
      setState(() {
        unitsController1.text = "0.0";
        unitsController2.text = "0.0";
        unitsController3.text = "0.0";
        unitsController4.text = "0.0";
        unitsController5.text = "0.0";
        unitsController6.text = "0.0";
        unitsController7.text = "0.0";
        unitsController8.text = "0.0";
        unitsController9.text = "0.0";
        unitsController10.text = "0.0";
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////////////

          /////////////////
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Please update Available Blood quantity..",
            style: GoogleFonts.roboto(
                fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
          ),
          SizedBox(
            height: 15.h,
          ),
          _buildRow(1, mlController1, unitsController1, "A+"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(2, mlController2, unitsController2, "A-"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(3, mlController3, unitsController3, "B+"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(4, mlController4, unitsController4, "B-"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(5, mlController5, unitsController5, "O+"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(6, mlController6, unitsController6, "O-"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(7, mlController7, unitsController7, "AB+"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(8, mlController8, unitsController8, "AB-"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(9, mlController9, unitsController9, "RH+"),
          SizedBox(
            height: 20.h,
          ),
          _buildRow(10, mlController10, unitsController10, "RH-"),

          SizedBox(
            height: 60.h,
          ),
          Obx(() => authentication.bloodQuantityLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: kbloodred,
                  ),
                )
              : CustomButton(
                  // margin: EdgeInsets.all(20.r),
                  borderRadius: BorderRadius.circular(10.r),
                  Color: kbloodred,
                  textColor: Kwhite,
                  height: 42.h,
                  width: double.infinity,
                  label: "Submit",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () {
                    var payload = [
                      {
                        "bloodGroup": "A+",
                        "howMuchQuatity": unitsController1.text
                      },
                      {
                        "bloodGroup": "A-",
                        "howMuchQuatity": unitsController2.text
                      },
                      {
                        "bloodGroup": "B+",
                        "howMuchQuatity": unitsController3.text
                      },
                      {
                        "bloodGroup": "B-",
                        "howMuchQuatity": unitsController4.text
                      },
                      {
                        "bloodGroup": "AB+",
                        "howMuchQuatity": unitsController7.text
                      },
                      {
                        "bloodGroup": "AB-",
                        "howMuchQuatity": unitsController8.text
                      },
                      {
                        "bloodGroup": "O-",
                        "howMuchQuatity": unitsController6.text
                      },
                      {
                        "bloodGroup": "O+",
                        "howMuchQuatity": unitsController5.text
                      },
                      {
                        "bloodGroup": "RH+",
                        "howMuchQuatity": unitsController9.text
                      },
                      {
                        "bloodGroup": "Rh-",
                        "howMuchQuatity": unitsController10.text
                      },
                    ];
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
                        msg: "Please fill all fields",
                      );
                    } else {
                      authentication.bloodAvailability(payload);
                    }
                  },
                )),
          SizedBox(
            height: 120.h,
          ),
          ///////////////////////////////
        ],
      ),
    );
  }

  Widget buildRow(TextEditingController mlController,
      TextEditingController unitController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mlController,
              decoration: InputDecoration(
                labelText: 'Millilitres (ml)',
              ),
              keyboardType: TextInputType.number,
              onTap: () {
                mlController.selection = TextSelection(
                    baseOffset: 0, extentOffset: mlController.text.length);
              },
              onChanged: (text) {
                if (text.isNotEmpty) {
                  final mlValue = double.tryParse(text.replaceAll(' ml', ''));
                  if (mlValue != null) {
                    final unitValue = mlValue / controller.unitToMlRatio;
                    if (unitController.text !=
                        unitValue.toStringAsFixed(2) + ' Unit(s)') {
                      unitController.text =
                          unitValue.toStringAsFixed(2) + ' Unit(s)';
                    }
                  }
                }
              },
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              controller: unitController,
              decoration: InputDecoration(
                labelText: 'Units',
              ),
              keyboardType: TextInputType.number,
              onTap: () {
                unitController.selection = TextSelection(
                    baseOffset: 0, extentOffset: unitController.text.length);
              },
              onChanged: (text) {
                if (text.isNotEmpty) {
                  final unitValue =
                      double.tryParse(text.replaceAll(' Unit(s)', ''));
                  if (unitValue != null) {
                    final mlValue = unitValue * controller.unitToMlRatio;
                    if (mlController.text !=
                        mlValue.toStringAsFixed(0) + ' ml') {
                      mlController.text = mlValue.toStringAsFixed(0) + ' ml';
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  ////////////////////////////////////////
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
          width: 150.w,
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
          width: 150.w,
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

double calculateUnits(int input) {
  const int unitSize = 450;
  return input / unitSize;
}
