import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class DonorSignUp extends StatefulWidget {
  const DonorSignUp({super.key});

  @override
  State<DonorSignUp> createState() => _DonorSignUpState();
}

class _DonorSignUpState extends State<DonorSignUp> {
  /////////////////////////////////////
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

  String? selectedValue;

  final List<String> genderlist = ['Male', 'Female', 'Other'];

  String? selectedgender;

  final List<String> countrylist = ['India', 'Pakistan', 'Iran', 'Iraq'];

  String? selecteCountry;

  final List<String> citylist = ['Hyderabad', 'Chennai', 'Pune', 'Mumbai'];

  String? selectedCity;

  final List<String> statelist = ['Andhra Pardesh', 'Tamil Nadu', 'Orissa'];

  String? selectstate;

  final List<String> alcohollist = ['No', 'Yes', 'Often'];

  String? selectedalcohol;
  ///////////////////////////////
  bool value = false;
  TextEditingController dOBController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  String selectbg = "";

  @override
  void initState() {
    // apiController.categoryData = apiController.categoryOriginaldata;

    // categoryOriginaldata.remove(categoryData[i]);
//  categoryData.remove(categoryData[i]);
//             categoryDatafilter.remove(categoryData[i]);
    // apiController.aminityData = apiController.OriginalaminityData;

    //_getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Kwhite,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: KTextdark,
            ),
          ),
        ),
        bottomNavigationBar: CustomButton(
          margin: EdgeInsets.all(20.r),
          borderRadius: BorderRadius.circular(10.r),
          Color: kbloodred,
          textColor: Kwhite,
          height: 42.h,
          width: double.infinity,
          label: "Register as Donor",
          fontSize: kSixteenFont,
          fontWeight: kFW500,
          isLoading: false,
          onTap: () async {
            Fluttertoast.showToast(
              msg: "Registered Successfully",
            );
            Get.back();
          },
        ),
        backgroundColor: Kwhite,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register as Donor",
                  style: GoogleFonts.roboto(
                      fontSize: 28.sp, color: kbloodred, fontWeight: kFW600),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomFormFieldOutilined(
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter First Name",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'First Name',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Last Name",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'Last Name',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Mobile Number",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'Mobile',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Email",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'Email',
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hint: Text(
                      'Select Blood Group',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: bloodgroupss
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormField(
                  suffix: InkWell(
                      onTap: () async {
                        // setState(() {
                        //   isFormOpen.value = true;
                        // });
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime.now(),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  // background: white,
                                  primary: kbloodred,
                                  //onPrimary: white,
                                  onSurface: Colors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                      // primary: Kbluedark,
                                      ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (picked != null && picked != selectedDate) {
                          // if (picked.isAfter(DateTime.now())) {
                          //   // date.isAfter(DateTime.now()
                          //   //  if(date.month>DateTime.now().month){
                          //   Fluttertoast.showToast(
                          //       msg: "Upcomming Months can't be selected");
                          // } else {
                          setState(() {
                            selectedDate = picked;
                            choosenDate = selectedDate;
                            selectDate.value =
                                DateFormat.yMMMEd().format(selectedDate);
                          });
                          //  }
                          // setState(() {
                          //   selectedDate = picked;
                          //   choosenDate = selectedDate;
                          // }
                          // );
                        }
                      },
                      child: Icon(Icons.calendar_today)),
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  textColor: KdarkText,
                  hintStyle: GoogleFonts.roboto(
                      color: KdarkText.withOpacity(
                        0.8,
                      ),
                      fontSize: kTwelveFont),
                  keyboardType: TextInputType.none,
                  maxLines: 1,
                  controller: dOBController,
                  hintText: selectedDate != null
                      ? DateFormat.yMMMEd().format(selectedDate)
                      : "Select Date",
                  readOnly: false,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select Gender',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: genderlist
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedgender = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Address Line 1",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'Address Line 1',
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter Address Line 2",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'Address Line 2',
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select Country',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: countrylist
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selecteCountry = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select State',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: statelist
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectstate = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select City',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: citylist
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedCity = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 60.h,
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
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kblack, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: kblack.withOpacity(0.6), width: 0.5),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kbloodred, width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Add more decoration..
                    ),
                    hint: Text(
                      'Select Alcohol Type',
                      style: GoogleFonts.roboto(fontSize: 14),
                    ),
                    items: alcohollist
                        .map((item) => DropdownMenuItem<String>(
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
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      selectedalcohol = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: KText,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomFormFieldOutilined(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  fontSize: kFourteenFont,
                  fontWeight: FontWeight.w500,
                  hintText: "Enter PinCode",
                  maxLines: 1,
                  readOnly: false,
                  onChanged: (value) {},
                  label: 'PinCode',
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Kwhite,
                      activeColor: kbloodred,
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        "I have read and agreed the Terms and services and Privacy Policy",
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                            fontSize: 13.sp,
                            fontWeight: kFW500,
                            color: kblack.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// first

// class MenuItem {
//   const MenuItem({
//     required this.text,
//   });

//   final String text;
// }

// abstract class MenuItems {
//   static const List<MenuItem> firstItems = [home, share, settings];
//   static const List<MenuItem> secondItems = [logout];

//   static const home = MenuItem(text: 'A+');
//   static const share = MenuItem(text: 'A-');
//   static const settings = MenuItem(text: 'B+');
//   static const logout = MenuItem(text: 'B-');

//   static Widget buildItem(MenuItem item) {
//     return Text(
//       item.text,
//       style: GoogleFonts.roboto(
//         color: Colors.white,
//       ),
//     );
//   }

//   static void onChanged(BuildContext context, MenuItem item) {
//     switch (item) {
//       case MenuItems.home:
//         // apiController.selectBloodGroup.value = item.text;
//         //  apiController.onInit();
//         break;
//       case MenuItems.settings:
//         // apiController.selectBloodGroup.value = item.text;
//         //  apiController.onInit();
//         break;
//       case MenuItems.share:
//         //  apiController.selectBloodGroup.value = item.text;
//         //  apiController.onInit();
//         break;
//       case MenuItems.logout:
//         //   apiController.selectBloodGroup.value = item.text;
//         //  apiController.onInit();
//         break;
//     }
//   }
// }

// // gender
// class Genders {
//   const Genders({
//     required this.text,
//   });

//   final String text;
// }

// abstract class Gender {
//   static const List<Genders> firstItems = [home, share, settings];
//   static const List<Genders> secondItems = [logout];

//   static const home = Genders(text: 'Male');
//   static const share = Genders(text: 'Female');
//   static const settings = Genders(text: 'Trans');
//   static const logout = Genders(text: 'None');

//   static Widget buildItem(Genders item) {
//     return Text(
//       item.text,
//       style: GoogleFonts.roboto(
//         color: Colors.white,
//       ),
//     );
//   }

//   static void onChanged(BuildContext context, Genders item) {
//     switch (item) {
//       case Gender.home:
//         break;
//       case Gender.settings:
//         break;
//       case Gender.share:
//         break;
//       case Gender.logout:
//         break;
//     }
//   }
// }

// Country
class Countries {
  const Countries({
    required this.text,
  });

  final String text;
}

abstract class Country {
  static const List<Countries> firstItems = [home, share, settings];
  static const List<Countries> secondItems = [logout];

  static const home = Countries(text: 'India');
  static const share = Countries(text: 'Pakistan');
  static const settings = Countries(text: 'Srilanka');
  static const logout = Countries(text: 'Japan');

  static Widget buildItem(Countries item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, Country item) {
    switch (item) {
      case Country.home:
        break;
      case Country.settings:
        break;
      case Country.share:
        break;
      case Country.logout:
        break;
    }
  }
}

// State
class SelectStates {
  const SelectStates({
    required this.text,
  });

  final String text;
}

abstract class SelectState {
  static const List<SelectStates> firstItems = [home, share, settings];
  static const List<SelectStates> secondItems = [logout];

  static const home = SelectStates(text: 'Andhrapradesh');
  static const share = SelectStates(text: 'Telangana');
  static const settings = SelectStates(text: 'Kerala');
  static const logout = SelectStates(text: 'Goa');

  static Widget buildItem(SelectStates item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, SelectStates item) {
    switch (item) {
      case SelectState.home:
        break;
      case SelectState.settings:
        break;
      case SelectState.share:
        break;
      case SelectState.logout:
        break;
    }
  }
}

// city
class Drinks {
  const Drinks({
    required this.text,
  });

  final String text;
}

abstract class Drink {
  static const List<Drinks> firstItems = [home, share, settings];
  static const List<Drinks> secondItems = [logout];

  static const home = Drinks(text: 'Yes');
  static const share = Drinks(text: 'No');
  static const settings = Drinks(text: 'Often');
  static const logout = Drinks(text: 'NOTA');

  static Widget buildItem(Drinks item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, Drinks item) {
    switch (item) {
      case Drink.home:
        break;
      case Drink.settings:
        break;
      case Drink.share:
        break;
      case Drink.logout:
        break;
    }
  }
}

// Alcohol

// city
class Cities {
  const Cities({
    required this.text,
  });

  final String text;
}

abstract class City {
  static const List<Cities> firstItems = [home, share, settings];
  static const List<Cities> secondItems = [logout];

  static const home = Cities(text: 'Kurnool');
  static const share = Cities(text: 'Kadapa');
  static const settings = Cities(text: 'Vijayawada');
  static const logout = Cities(text: 'Ananthapur');

  static Widget buildItem(Cities item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, Cities item) {
    switch (item) {
      case City.home:
        break;
      case City.settings:
        break;
      case City.share:
        break;
      case City.logout:
        break;
    }
  }
}
