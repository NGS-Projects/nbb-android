import 'dart:convert';
import 'dart:io';

import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ApiController authentication = Get.put(ApiController());
  ApiController apiController = Get.put(ApiController());
  TextEditingController dOBController = TextEditingController();
  final List<String> bloodgroupss = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  final List<String> genderlist = ['Male', 'Female', 'Other'];
  String startTime = "";
  String closeTime = "";
  /////////////////////////////////////////////////////////
  Future<TimeOfDay?> getTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      startTime = formattedTime!;
    });
    return time;
  }

  //Closetime
  Future<TimeOfDay?> closedTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      closeTime = formattedTime!;
    });
    return time;
  }

  ///////////////////////////////////////////////////////
  final List<String> Genders = [
    'Male',
    'Female',
    'Others',
  ];
  String? selectedgender;
  //////////////////////////////
  bool showimagenullMessage = false;
  File? selectedImage;
  File? selectedImagetwo;
  String base64Image = "";
  // bool isLoading = false;
  Map typesData = {};
  List<String> options = [];
  int choosenTypeData = 0;
  String choosenOption = "";
  String? selectedValue;
  String description = "";
  int? totalAmount;
  String? str;
  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 10,
      );
      // .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          //.pickImage(source: ImageSource.gallery);
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
      //  .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        authentication.donorEditProfile(selectedImage!);
        print(selectedImage!.readAsBytesSync().lengthInBytes);
        final kb = selectedImage!.readAsBytesSync().lengthInBytes / 1024;
        print(kb);
        final mb = kb / 1024;
        print(mb);
        print("ram b jk dslnkv flk dlkcdslc k");
        showimagenullMessage = false;
      });
//       Future getImageSize() async {
// // final pickedImage = await picker.getImage(source: ImageSource.gallery);
//         final bytes = selectedImage!.readAsBytesSync().lengthInBytes;
//         final kb = bytes / 1024;
//         final mb = kb / 1024;
//         print("Below kilo bytes,...........................................");
//         print(kb);
//       }
      // var value = await Services.profileimage(File(image.path));
      // if (jsonDecode(value["msg"]) != null) {
      //   Fluttertoast.showToast(msg: value["msg"]);
      // } else {
      //   // Get.toNamed(Kapply_leaves);
      // }
    }
  }

  String? selectedGenderValue;

  @override
  void initState() {
    if (apiController.profileData["employeeType"] != "Donor") {
      setState(() {
        // startTime = apiController.profileData["startTime"];
        // closeTime = apiController.profileData["endTime"];
        authentication.editBloodBankNameController.text =
            apiController.profileData["bloodBankName"] ?? "No name";
        authentication.editBloodBankEmailController.text =
            apiController.profileData["email"] ?? "No Mail";
        authentication.editBloodBanklocationsController.text =
            apiController.profileData["address"] ?? "No Location";
      });

      //  "bloodBankName": .text,
      //                         "email": authentication
      //                             ..text,
      //                         "locations": authentication
      //                             ..text,
    } else {
      setState(() {
        // startTime = apiController.profileData["startTime"];
        // closeTime = apiController.profileData["endTime"];
        authentication.editDonorfirstNameController.text =
            apiController.profileData["firstName"] ?? "No name";
        authentication.editDonorLastNameController.text =
            apiController.profileData["lastName"] ?? " ";
        authentication.editBloodBankEmailController.text =
            apiController.profileData["email"] ?? "No Mail";
        authentication.editBloodBanklocationsController.text =
            apiController.profileData["address"] ?? "No Location";
        authentication.donorRegisterBloodGroup.value =
            apiController.profileData["bloodGroup"] ?? "No Location";
        selectDate.value = apiController.profileData["dateOfBirth"];
      });
      ////////////////////////////////////////

      ////////////////////////////////////
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Edit Profile",
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(15.r),
          child: Form(
            key: _formKey,
            // autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Kwhite,
                      radius: 50.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: selectedImage != null
                            ? Image.file(
                                selectedImage!,
                                height: 100.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              )
                            : authentication.profileData["profile"] == null
                                ? Image.asset(
                                    "assets/images/profileImageStatic.png",
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  )
                                : CircleAvatar(
                                    backgroundColor: Kwhite,
                                    radius: 50.r,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(200.r),
                                      child: CachedNetworkImage(
                                        imageUrl: kBaseImageUrl +
                                            authentication
                                                .profileData["profile"],
                                        placeholder: (context, url) => SizedBox(
                                          height: 100.h,
                                          width: 100.w,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor:
                                                Colors.white.withOpacity(0.5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Kwhite.withOpacity(0.5),
                                              ),
                                              height: 100.h,
                                              width: 100.w,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          backgroundColor: Kwhite,
                                          radius: 50.r,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(200.r),
                                            child: Image.asset(
                                              "assets/images/profileImageStatic.png",
                                              // height: 150.h,
                                              height: 100.h,
                                              width: 100.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        height: 100.h,
                                        width: 100.w,
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
                      ),
                    ),
                    Positioned(
                      bottom: 4.h,
                      right: 4.w,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              backgroundColor: Kbackground,
                              context: context,
                              builder: (context) {
                                return Container(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Kbackground,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    height: 100.h,
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            chooseImage("Gallery");
                                            Navigator.pop(context);
                                          },
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.image_outlined,
                                                color: kbloodred,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text('Gallery',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12.sp,
                                                      fontWeight: kFW700,
                                                      color: KdarkText)),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            chooseImage("camera");
                                            Navigator.pop(context);
                                          },
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.camera_alt_outlined,
                                                color: kbloodred,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text('camera',
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12.sp,
                                                      fontWeight: kFW700,
                                                      color: KdarkText)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/images/edit.png",
                          color: kbloodred,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                authentication.profileData["employeeType"] == "Donor"
                    ? Column(
                        children: [
                          CustomFormFields(
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editDonorfirstNameController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter First Name",
                            maxLines: 1,
                            readOnly: false,
                            label: 'First Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter First Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editDonorLastNameController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Last Name",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Last Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Last Name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editBloodBankEmailController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Email",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Email',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              Get.toNamed(kSearchPlacesBankEdit);
                            },
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editBloodBanklocationsController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Address",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Address',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Blood Group",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Kwhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kblack.withOpacity(0.2),
                                    blurRadius: 2.r,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1.r,
                                  )
                                  // BoxShadow(
                                  //   color: Color(0x3FD3D1D8),
                                  //   blurRadius: 30,
                                  //   offset: Offset(15, 15),
                                  //   spreadRadius: 2,
                                  // )
                                ]),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kbloodred, width: 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kbloodred, width: 1),
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
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: KTextgery.withOpacity(0.5),
                                ),
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
                                  return 'Please select BloodGroup.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  authentication.donorRegisterBloodGroup.value =
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
                              buttonStyleData: const ButtonStyleData(
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
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "gender",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Kwhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: kblack.withOpacity(0.2),
                                    blurRadius: 2.r,
                                    offset: Offset(1, 1),
                                    spreadRadius: 1.r,
                                  )
                                  // BoxShadow(
                                  //   color: Color(0x3FD3D1D8),
                                  //   blurRadius: 30,
                                  //   offset: Offset(15, 15),
                                  //   spreadRadius: 2,
                                  // )
                                ]),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kblack.withOpacity(0.6),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kbloodred, width: 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kbloodred, width: 1),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              hint: Text(
                                'Select Gender',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: KTextgery.withOpacity(0.5),
                                ),
                              ),
                              items: Genders.map(
                                  (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                          ),
                                        ),
                                      )).toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select Gender.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  authentication.donorRegisterGender.value =
                                      value.toString();
                                  selectedGenderValue = value.toString();
                                  print(selectedGenderValue);
                                });

                                // authentication.registerDonorBloodController.value =
                                //     selectedValue as TextEditingValue;
                                //Do something when selected item is changed.
                              },
                              onSaved: (value) {
                                selectedGenderValue = value.toString();
                                print(selectedGenderValue);
                                // authentication.registerDonorBloodController.value =
                                //     selectedValue as TextEditingValue;
                              },
                              buttonStyleData: const ButtonStyleData(
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
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            hintColor: DateFormat.yMMMd()
                                        .format(selectedDate) ==
                                    DateFormat.yMMMd().format(DateTime.now())
                                ? KTextgery.withOpacity(0.5)
                                : KdarkText,
                            labelColor: KText,
                            suffix: InkWell(
                                onTap: () async {
                                  // setState(() {
                                  //   isFormOpen.value = true;
                                  // });
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime(1924, 8),
                                    //  firstDate: DateTime(2015, 8),
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

                                  if (picked != null &&
                                      picked != selectedDate) {
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
                                          DateFormat('MM/dd/yyyy')
                                              // DateFormat.yMMMEd()
                                              .format(selectedDate);
                                    });
                                    //  }
                                    // setState(() {
                                    //   selectedDate = picked;
                                    //   choosenDate = selectedDate;
                                    // }
                                    // );
                                  }
                                },
                                child: Icon(
                                  Icons.calendar_today,
                                  color: kblack.withOpacity(0.6),
                                )),
                            enabled: true,

                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            // fontSize: kFourteenFont,
                            // fontWeight: FontWeight.w500,
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            textColor: KdarkText,
                            keyboardType: TextInputType.none,
                            textStyle: GoogleFonts.roboto(color: kblack),
                            maxLines: 1,
                            controller: authentication
                                .registerDonorDateofBirthController,
                            hintText:
                                // selectedDate == DateTime.now()
                                DateFormat.yMMMd().format(selectedDate) ==
                                        DateFormat.yMMMd()
                                            .format(DateTime.now())
                                    ? "Select Date"
                                    : DateFormat('dd/MM/yyyy')
                                        // DateFormat.yMMMEd()
                                        .format(selectedDate)
                            // DateFormat.yMMMEd().format(selectedDate)
                            ,
                            readOnly: false,
                            onChanged: (value) {},
                            label: 'Date of Birth',
                            // hintText: "Full Name",
                            // maxLines: 1,
                            // readOnly: false,
                            // label: 'Full Name',
                            validator: (value) {
                              if (DateFormat.yMMMd().format(selectedDate) ==
                                  DateFormat.yMMMd().format(DateTime.now())) {
                                return 'Please select Date of Birth';
                              }
                              return null;
                            },
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomFormFields(
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editBloodBankNameController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter BloodBank Name",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Blood Bank Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter BloodBank Mae';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editBloodBankEmailController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Email",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Email',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomFormFields(
                            ontap: () {
                              Get.toNamed(kSearchPlacesBankEdit);
                            },
                            enabled: true,
                            labelColor: KText,
                            controller:
                                authentication.editBloodBanklocationsController,
                            obscureText: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            fontSize: kFourteenFont,
                            fontWeight: FontWeight.w500,
                            hintText: "Enter Address",
                            maxLines: 1,
                            readOnly: false,
                            label: 'Address',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Address';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                SizedBox(
                  height: 80.h,
                ),
                Obx(() => authentication.editFormLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: kbloodred,
                        ),
                      )
                    : authentication.profileData["employeeType"] == "Donor"
                        ? Column(
                            children: [
                              CustomButton(
                                  borderRadius: BorderRadius.circular(10.r),
                                  Color: kbloodred,
                                  textColor: Kwhite,
                                  height: 42.h,
                                  width: double.infinity,
                                  label: "Update",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW500,
                                  isLoading: false,
                                  onTap: () {
                                    var payload = {
                                      "firstName": authentication
                                          .editDonorfirstNameController.text,
                                      "lastName": authentication
                                          .editDonorLastNameController.text,
                                      "email": authentication
                                          .editBloodBankEmailController.text,
                                      "address": authentication
                                          .editBloodBanklocationsController
                                          .text,
                                      "bloodGroup": authentication
                                          .donorRegisterBloodGroup.value,
                                      "gender": authentication
                                          .donorRegisterGender.value,
                                      "dateOfBirth": selectDate.value,
                                      //////////////////////
                                    };

                                    authentication.editProfileForm(payload);
                                  }

                                  // Fluttertoast.showToast(
                                  //   msg: "Registered Successfully",
                                  // );

                                  ),
                              authentication.profileData["profile"] == null ||
                                      authentication.profileData["profile"] ==
                                          ""
                                  ? SizedBox()
                                  : CustomButton(
                                      borderRadius: BorderRadius.circular(10.r),
                                      Color: kbloodred,
                                      margin: EdgeInsets.only(top: 25.h),
                                      textColor: Kwhite,
                                      height: 42.h,
                                      width: double.infinity,
                                      label: "Delete Profile pic",
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW500,
                                      isLoading: false,
                                      onTap: () {
                                        authentication.deleteProfilepic();
                                      })
                            ],
                          )
                        : Column(
                            children: [
                              CustomButton(
                                  borderRadius: BorderRadius.circular(10.r),
                                  Color: kbloodred,
                                  textColor: Kwhite,
                                  height: 42.h,
                                  width: double.infinity,
                                  label: "Update",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW500,
                                  isLoading: false,
                                  onTap: () {
                                    var payload = {
                                      "bloodBankName": authentication
                                          .editBloodBankNameController.text,
                                      "email": authentication
                                          .editBloodBankEmailController.text,
                                      "address": authentication
                                          .editBloodBanklocationsController
                                          .text,
                                    };

                                    authentication.editProfileForm(payload);
                                  }),
                              authentication.profileData["profile"] == null ||
                                      authentication.profileData["profile"] ==
                                          ""
                                  ? SizedBox()
                                  : CustomButton(
                                      borderRadius: BorderRadius.circular(10.r),
                                      Color: kbloodred,
                                      margin: EdgeInsets.only(top: 25.h),
                                      textColor: Kwhite,
                                      height: 42.h,
                                      width: double.infinity,
                                      label: "Delete Profile pic",
                                      fontSize: kSixteenFont,
                                      fontWeight: kFW500,
                                      isLoading: false,
                                      onTap: () {
                                        authentication.deleteProfilepic();
                                      }

                                      // Fluttertoast.showToast(
                                      //   msg: "Registered Successfully",
                                      // );

                                      )
                            ],
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
