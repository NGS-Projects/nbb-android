import 'dart:convert';
import 'dart:io';

import 'package:another_telephony/telephony.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class DonorsList extends StatefulWidget {
  const DonorsList({super.key});

  @override
  State<DonorsList> createState() => _DonorsListState();
}

class _DonorsListState extends State<DonorsList> {
  // Sms
  final Telephony telephony = Telephony.instance;
  ///////////////Add
  final List<String> Genders = [
    'Male',
    'Female',
    'Others',
  ];

  String? selectedGenderValue;
  ////Current Location
  // location
  GoogleController serviceController = Get.put(GoogleController());
  int activeIndex = 0;
  final carouselcontroller = CarouselController();
  final _formKey = GlobalKey<FormState>();
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  // GoogleMapController? _controller;

  double lat = 37.42796133580664;
  double lon = -122.085749655962;

  String? _currentAddress;
  String? _currentAddresspincode;
  String? _destination;

  var isLoading = "none";
  void _getCurrentLocation() async {
    setState(() {
      isLoading = "started";
    });
    Position position = await _determinePosition();
    setState(() {
      serviceController.position = position;
      serviceController.latittude = serviceController.position!.latitude;
      serviceController.longitude = serviceController.position!.longitude;

      _getAddressFromLatLng(position);
      //getPolyLines();
    });
  }

  var sourceLocation = "Your Location".obs;
  void _getMyLocation() async {
    setState(() {
      isLoading = "started";
    });
    Position position = await _determinePosition();
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        sourceLocation.value =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    setState(() {
      isLoading = "ended";
    });

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(serviceController.position!.latitude,
            serviceController.position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}${place.postalCode}';
        _currentAddresspincode = '${place.postalCode}';

        serviceController.address.value = _currentAddress.toString();
        serviceController.pincode.value = _currentAddresspincode.toString();
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  /////////////////////////////
  ////////////////////////
  ApiController authentication = Get.put(ApiController());
  ApiController apicontroller = Get.put(ApiController());
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

  final List<String> requesttype = ['Blood', 'Platelets', 'Plasma'];

  String? selectedrequest;

  //////////////
  final List<String> locations = ['Malakpet', 'AmeerPet', 'KPHB', 'Hitec city'];

  String? selectedLocation;
  //////////////////////
  bool value = false;
  bool valuetwo = false;
  TextEditingController dOBController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;
  bool showimagenullMessage = false;
  //////////////////////////////
  File? selectedImage;
  File? selectedImagetwo;
  String base64Image = "";
  // bool isLoading = false;
  Map typesData = {};
  List<String> options = [];
  int choosenTypeData = 0;
  String choosenOption = "";

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

////////////////////
  final TextEditingController mlController1 = TextEditingController();
  final TextEditingController mlController2 = TextEditingController();
  final TextEditingController mlController3 = TextEditingController();
  final TextEditingController mlController4 = TextEditingController();
  final TextEditingController mlController5 = TextEditingController();
  final TextEditingController mlController6 = TextEditingController();
  final TextEditingController mlController7 = TextEditingController();
  final TextEditingController mlController8 = TextEditingController();

  final TextEditingController unitsController1 = TextEditingController();
  final TextEditingController unitsController2 = TextEditingController();
  final TextEditingController unitsController3 = TextEditingController();
  final TextEditingController unitsController4 = TextEditingController();
  final TextEditingController unitsController5 = TextEditingController();
  final TextEditingController unitsController6 = TextEditingController();
  final TextEditingController unitsController7 = TextEditingController();
  final TextEditingController unitsController8 = TextEditingController();

  double mlToUnits(double ml) {
    // Conversion logic: 1 unit = 450 ml
    return ml / 450;
  }

  double unitsToMl(double units) {
    // Conversion logic: 1 unit = 450 ml
    return units * 450;
  }

  /////////////////////////////
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

  /////////////////
  Future<void> chooseImagetwo(type) async {
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
        selectedImagetwo = File(image.path);
        base64Image = base64Encode(selectedImagetwo!.readAsBytesSync());
        print(selectedImagetwo!.readAsBytesSync().lengthInBytes);
        final kb = selectedImagetwo!.readAsBytesSync().lengthInBytes / 1024;
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
//sms

  void sendSMS(String phoneNumber, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': message,
      },
    );

    if (await canLaunch(smsUri.toString())) {
      await launch(smsUri.toString());
    } else {
      throw 'Could not launch $smsUri';
    }
  }

  ////////////////////////////////
  // @override
  // void initState() {
  //   _getCurrentLocation();

  //   super.initState();
  // }
  ////////////////
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
    apiController.getPatients();
    _getCurrentLocation();
    if (apiController.profileData["employeeType"] != "Donor") {
      apiController.getCurrentLocationforBank();
    } else {
      apiController.getCurrentLocation();
    }
    ;
    apiController.donorsData = apiController.OriginaldonorsData;
    apiController.donorsData = apiController.donorsDatafilter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        titleSpacing: 18.w,
        backgroundColor: Kwhite,
        title: Obx(() => Text(
              DateTime.now().isBefore(DateFormat("dd-MM-yyyy")
                          .parse(apiController.profileData["signupTime"])
                          .add(Duration(days: 7))) &&
                      apiController.profileData["isAddPatinet"] == false
                  ? "Add patient"
                  : "Donors List",
              style: GoogleFonts.roboto(
                  fontSize: 20.sp, color: KdarkText, fontWeight: kFW600),
            )),
      ),
      // Bankappbar(
      //   dontHaveBackAsLeading: true,
      //   title:
      //   apiController.profileData["employeeType"]
      //    "Donors List",
      // ),
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
      //     "Donors List",
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
        () => DateTime.now().isBefore(DateFormat("dd-MM-yyyy")
                    .parse(apiController.profileData["signupTime"])
                    .add(Duration(days: 7))) &&
                apiController.profileData["isAddPatinet"] == false
            ? Container(
                margin: EdgeInsets.all(20.r),
                child: Form(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: 40.h,
                      // ),

                      SizedBox(
                        height: 10.h,
                      ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorpatientFirstNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Patient First Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Patient First Name',
                      // ),
                      CustomFormFields(
                        enabled: true,
                        labelColor: KText,
                        controller:
                            authentication.findDonorpatientFirstNameController,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Patient First Name",
                        maxLines: 1,
                        readOnly: false,
                        label: 'Patient First Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Patient First Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorpatientLastNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Patient Last Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Patient Last Name',
                      // ),
                      CustomFormFields(
                        enabled: true,
                        labelColor: KText,
                        controller:
                            authentication.findDonorpatientLastNameController,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Patient Last Name",
                        maxLines: 1,
                        readOnly: false,
                        label: 'Patient Last Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Patient Last Name';
                          }
                          return null;
                        },
                      ),
                      //

                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorattendeeFirstNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Attendee First Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Attendee First Name',
                      // ),
                      // CustomFormFields(
                      //   enabled: true,
                      //   labelColor: KText,
                      //   controller:
                      //       authentication.findDonorattendeeFirstNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Attendee First Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   label: 'Attendee First Name',
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please enter Attendee First Name';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorattendeeLastNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Attendee Last Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Attendee Last Name',
                      // ),
                      //
                      // CustomFormFields(
                      //   enabled: true,
                      //   labelColor: KText,
                      //   controller:
                      //       authentication.findDonorattendeeLastNameController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Attendee Last Name",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   label: 'Attendee Last Name',
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please enter Attendee Last Name';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorattendeeMobileController,
                      //   keyboardType: TextInputType.number,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Mobile Number",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Mobile',
                      // ),
                      CustomFormFields(
                        controller:
                            authentication.findDonorattendeeMobileController,
                        keyboardType: TextInputType.number,
                        enabled: true,
                        labelColor: KText,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Mobile Number",
                        maxLines: 1,
                        readOnly: false,
                        label: 'Enter Mobile Number',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Enter Mobile Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorquantityController,
                      //   keyboardType: TextInputType.number,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Quantity (ml)",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Quantity',
                      // ),
                      _buildRow(1, mlController1, unitsController1, "Quantity"),
                      // CustomFormFields(
                      //   enabled: true,
                      //   labelColor: KText,
                      //   controller: authentication.findDonorquantityController,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Quantity (ml)",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   label: 'Quantity',
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please enter Quantity';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // CustomFormFieldOutilined(
                      //   controller: authentication.findDonorquantityController,
                      //   keyboardType: TextInputType.number,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Quantity (ml)",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Quantity',
                      // ),
                      CustomFormFields(
                        enabled: true,
                        labelColor: KText,
                        controller: authentication.findDonorHospitalController,
                        obscureText: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        fontSize: kFourteenFont,
                        fontWeight: FontWeight.w500,
                        hintText: "Enter Hosptal name",
                        maxLines: 1,
                        readOnly: false,
                        label: 'Hospital',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Hospital name';
                          }
                          return null;
                        },
                      ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   keyboardType: TextInputType.number,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Patient weight",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Patient weight',
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   keyboardType: TextInputType.number,
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Patient height",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Patient height',
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Email",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Email',
                      // ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Blood Group",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            //  letterSpacing: 1,
                            color: KText,
                            fontWeight: FontWeight.w500),
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
                                  color: kblack.withOpacity(0.6), width: 0.5),
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
                              authentication.findDonorBloodGroup.value =
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
                        height: 20.h,
                      ),
                      // CustomFormField(
                      //   suffix: InkWell(
                      //       onTap: () async {
                      //         // setState(() {
                      //         //   isFormOpen.value = true;
                      //         // });
                      //         final DateTime? picked = await showDatePicker(
                      //           context: context,
                      //           initialDate: selectedDate,
                      //           firstDate: DateTime(1924, 8),
                      //           //  firstDate: DateTime(2015, 8),
                      //           lastDate: DateTime.now(),
                      //           builder: (context, child) {
                      //             return Theme(
                      //               data: Theme.of(context).copyWith(
                      //                 colorScheme: const ColorScheme.light(
                      //                   // background: white,
                      //                   primary: kbloodred,
                      //                   //onPrimary: white,
                      //                   onSurface: Colors.black,
                      //                 ),
                      //                 textButtonTheme: TextButtonThemeData(
                      //                   style: TextButton.styleFrom(
                      //                       // primary: Kbluedark,
                      //                       ),
                      //                 ),
                      //               ),
                      //               child: child!,
                      //             );
                      //           },
                      //         );

                      //         if (picked != null && picked != selectedDate) {
                      //           // if (picked.isAfter(DateTime.now())) {
                      //           //   // date.isAfter(DateTime.now()
                      //           //   //  if(date.month>DateTime.now().month){
                      //           //   Fluttertoast.showToast(
                      //           //       msg: "Upcomming Months can't be selected");
                      //           // } else {
                      //           setState(() {
                      //             selectedDate = picked;
                      //             choosenDate = selectedDate;
                      //             selectDate.value = DateFormat('MM/dd/yyyy')
                      //                 // DateFormat.yMMMEd()
                      //                 .format(selectedDate);
                      //           });
                      //           //  }
                      //           // setState(() {
                      //           //   selectedDate = picked;
                      //           //   choosenDate = selectedDate;
                      //           // }
                      //           // );
                      //         }
                      //       },
                      //       child: Icon(Icons.calendar_today)),
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   textColor: KdarkText,
                      //   hintStyle: GoogleFonts.roboto(
                      //       color: KdarkText.withOpacity(
                      //         0.8,
                      //       ),
                      //       fontSize: kTwelveFont),
                      //   keyboardType: TextInputType.none,
                      //   maxLines: 1,
                      //   controller: dOBController,
                      //   hintText: selectedDate != null
                      //       ? DateFormat('dd/MM/yyyy')
                      //           // DateFormat.yMMMEd()
                      //           .format(selectedDate)
                      //       // DateFormat.yMMMEd().format(selectedDate)
                      //       : "Select Date",
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      // ),
                      CustomFormFields(
                        hintColor:
                            //  DateFormat.yMMMd().format(selectedDate) ==
                            //         DateFormat.yMMMd().format(DateTime.now())
                            //     ? KTextgery.withOpacity(0.5)
                            //     :
                            KdarkText,
                        labelColor: KText,
                        suffix: InkWell(
                            onTap: () async {
                              // setState(() {
                              //   isFormOpen.value = true;
                              // });
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime.now(),
                                // firstDate: DateTime(1924, 8),
                                //  firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2030, 8),
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
                                  selectDate.value = DateFormat('MM/dd/yyyy')
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
                        controller: dOBController,
                        hintText:
                            // selectedDate == DateTime.now()
                            // DateFormat.yMMMd().format(selectedDate) ==
                            //         DateFormat.yMMMd().format(DateTime.now())
                            //     ? "Select Date"
                            //     : DateFormat('dd/MM/yyyy')
                            //         // DateFormat.yMMMEd()
                            //         .format(selectedDate)
                            DateFormat('dd/MM/yyyy').format(selectedDate),
                        // DateFormat.yMMMEd().format(selectedDate)

                        readOnly: false,
                        onChanged: (value) {}, label: 'Required Date',
                        // hintText: "Full Name",
                        // maxLines: 1,
                        // readOnly: false,
                        // label: 'Full Name',
                        validator: (value) {
                          // if (DateFormat.yMMMd().format(selectedDate) ==
                          //     DateFormat.yMMMd().format(DateTime.now())) {
                          //   return 'Please select Required Date';
                          // }
                          // return null;
                        },
                        // validator: (value) {
                        //   if (DateFormat.yMMMd().format(selectedDate) ==
                        //       DateFormat.yMMMd().format(DateTime.now())) {
                        //     return 'Please select Required Date';
                        //   }
                        //   return null;
                        // },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Request Type",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            fontSize: kFourteenFont,
                            //  letterSpacing: 1,
                            color: KText,
                            fontWeight: FontWeight.w500),
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
                                  color: kblack.withOpacity(0.6), width: 0.5),
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
                            'Select Request',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: KTextgery.withOpacity(0.5),
                            ),
                          ),
                          items: requesttype
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
                              authentication.findDonorRequesttype.value =
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
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Gender",
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
                                  color: kblack.withOpacity(0.6), width: 0.5),
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
                          items: Genders.map((item) => DropdownMenuItem<String>(
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
                              authentication.donorRegistersGender.value =
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

                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Address Line 1",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Address Line 1',
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //   obscureText: false,
                      //   contentPadding:
                      //       const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Address Line 2",
                      //   maxLines: 1,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Address Line 2',
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // Container(
                      //   height: 60.h,
                      //   width: double.infinity,
                      //   padding: EdgeInsets.all(10.r),
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Ktextcolor.withOpacity(0.5),
                      //         blurRadius: 5.r,
                      //         offset: Offset(1, 1),
                      //         spreadRadius: 1.r,
                      //       )
                      //     ],
                      //     color: Kwhite,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: DropdownButtonFormField2<String>(
                      //     isExpanded: true,
                      //     decoration: InputDecoration(
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kblack, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       errorBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: kblack.withOpacity(0.6), width: 0.5),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       disabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: kblack.withOpacity(0.6), width: 0.5),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       focusedErrorBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kbloodred, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kbloodred, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       contentPadding:
                      //           const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       // Add more decoration..
                      //     ),
                      //     hint: const Text(
                      //       'Select Location',
                      //       style: GoogleFonts.roboto(fontSize: 14),
                      //     ),
                      //     items: locations
                      //         .map((item) => DropdownMenuItem<String>(
                      //               value: item,
                      //               child: Text(
                      //                 item,
                      //                 style: const GoogleFonts.roboto(
                      //                   fontSize: 14,
                      //                 ),
                      //               ),
                      //             ))
                      //         .toList(),
                      //     validator: (value) {
                      //       if (value == null) {
                      //         return 'Please select gender.';
                      //       }
                      //       return null;
                      //     },
                      //     onChanged: (value) {
                      //       //Do something when selected item is changed.
                      //     },
                      //     onSaved: (value) {
                      //       selectedLocation = value.toString();
                      //     },
                      //     buttonStyleData: const ButtonStyleData(
                      //       padding: EdgeInsets.only(right: 8),
                      //     ),
                      //     iconStyleData: const IconStyleData(
                      //       icon: Icon(
                      //         Icons.arrow_drop_down,
                      //         color: KText,
                      //       ),
                      //       iconSize: 24,
                      //     ),
                      //     dropdownStyleData: DropdownStyleData(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //     ),
                      //     menuItemStyleData: const MenuItemStyleData(
                      //       padding: EdgeInsets.symmetric(horizontal: 16),
                      //     ),
                      //   ),
                      // ),

                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // Container(
                      //   width: double.infinity,
                      //   padding: EdgeInsets.all(10.r),
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Ktextcolor.withOpacity(0.5),
                      //         blurRadius: 5.r,
                      //         offset: Offset(1, 1),
                      //         spreadRadius: 1.r,
                      //       )
                      //     ],
                      //     color: Kwhite,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: TextFormField(
                      //     obscureText: false,
                      //     cursorColor: kbloodred,
                      //     maxLines: 10,
                      //     minLines: 5,
                      //     style: GoogleFonts.roboto(
                      //         fontSize: 13.sp,
                      //         fontWeight: kFW500,
                      //         color: kblack.withOpacity(0.8)),
                      //     decoration: InputDecoration(
                      //       focusColor: Kwhite.withOpacity(0.5),
                      //       filled: true,
                      //       labelText: "Enter Additional Notes",
                      //       labelStyle:GoogleFonts.roboto(
                      //           fontSize: 12.sp,
                      //           fontWeight: kFW600,
                      //           color: kblack.withOpacity(0.6),
                      //           letterSpacing: 1),
                      //       contentPadding:
                      //           EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(50.r),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kblack, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       errorBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: kblack.withOpacity(0.6), width: 0.5),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       disabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: kblack.withOpacity(0.6), width: 0.5),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       focusedErrorBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kbloodred, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: kbloodred, width: 1),
                      //         borderRadius: BorderRadius.circular(10.r),
                      //       ),
                      //       fillColor: Kwhite,
                      //       alignLabelWithHint: true,
                      //       hintStyle: GoogleFonts.roboto(
                      //         color: KTextgery.withOpacity(0.5),
                      //         fontSize: 12.sp,
                      //         fontWeight: kFW500,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // CustomFormFieldOutilined(
                      //
                      //   contentPadding:
                      //
                      //   fontSize: kFourteenFont,
                      //   fontWeight: FontWeight.w500,
                      //   hintText: "Enter Additional Note",
                      //   maxLines: 10,
                      //   readOnly: false,
                      //   onChanged: (value) {},
                      //   label: 'Additional Note',
                      // ),
                      // Container(
                      //   height: 60.h,
                      //   width: double.infinity,
                      //   padding: EdgeInsets.all(10.r),
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Ktextcolor.withOpacity(0.5),
                      //         blurRadius: 5.r,
                      //         offset: Offset(1, 1),
                      //         spreadRadius: 1.r,
                      //       )
                      //     ],
                      //     color: Kwhite,
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Alcohol",
                      //         style:GoogleFonts.roboto(
                      //             fontSize: 13.sp,
                      //             fontWeight: kFW500,
                      //             color: kblack.withOpacity(0.8)),
                      //       ),
                      //       DropdownButtonHideUnderline(
                      //         child: DropdownButton2(
                      //           customButton: Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             size: 28.sp,
                      //             color: KTextgery,
                      //           ),
                      //           items: [
                      //             ...Drink.firstItems.map(
                      //               (item) => DropdownMenuItem<Drinks>(
                      //                 value: item,
                      //                 child: Drink.buildItem(item),
                      //               ),
                      //             ),
                      //             const DropdownMenuItem<Divider>(
                      //                 enabled: false, child: SizedBox()),
                      //             ...Drink.secondItems.map(
                      //               (item) => DropdownMenuItem<Drinks>(
                      //                 value: item,
                      //                 child: Drink.buildItem(item),
                      //               ),
                      //             ),
                      //           ],
                      //           onChanged: (value) {
                      //             Drink.onChanged(context, value! as Drinks);
                      //           },
                      //           dropdownStyleData: DropdownStyleData(
                      //             width: 200.w,
                      //             padding: const EdgeInsets.symmetric(vertical: 6),
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(4),
                      //               color: KTextgery,
                      //             ),
                      //           ),
                      //           menuItemStyleData: MenuItemStyleData(
                      //             customHeights: [
                      //               ...List<double>.filled(
                      //                   MenuItems.firstItems.length, 48),
                      //               0,
                      //               ...List<double>.filled(
                      //                   MenuItems.secondItems.length, 0),
                      //             ],
                      //             padding: const EdgeInsets.only(left: 16, right: 16),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      SizedBox(
                        height: 20.h,
                      ),
                      ////////////////////////////////////////////
                      // Container(
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Ktextcolor.withOpacity(0.3),
                      //         blurRadius: 5,
                      //         offset: const Offset(0, 0),
                      //         spreadRadius: 1,
                      //       )
                      //     ],
                      //   ),
                      //   child: selectedImagetwo != null
                      //       ? Image.file(
                      //           selectedImagetwo!,
                      //           fit: BoxFit.cover,
                      //           height: 130.h,
                      //           width: double.infinity,
                      //         )
                      //       : const Text(
                      //           "",
                      //           textAlign: TextAlign.center,
                      //         ),
                      // ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showModalBottomSheet(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.only(
                      //               topRight: Radius.circular(20),
                      //               topLeft: Radius.circular(20)),
                      //         ),
                      //         backgroundColor: Kbackground,
                      //         context: context,
                      //         builder: (context) {
                      //           return Container(
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                   color: Kbackground,
                      //                   borderRadius: BorderRadius.only(
                      //                       topLeft: Radius.circular(20),
                      //                       topRight: Radius.circular(20))),
                      //               height: 100.h,
                      //               padding: EdgeInsets.only(top: 20.h),
                      //               child: Row(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                 children: [
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       chooseImagetwo("Gallery");
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Column(
                      //                       children: [
                      //                         Icon(
                      //                           Icons.image_outlined,
                      //                           color: kbloodred,
                      //                         ),
                      //                         SizedBox(
                      //                           height: 5.h,
                      //                         ),
                      //                         Text('Gallery',
                      //                             maxLines: 2,
                      //                             overflow: TextOverflow.ellipsis,
                      //                             style: GoogleFonts.roboto(
                      //                                 fontSize: 12.sp,
                      //                                 fontWeight: kFW700,
                      //                                 color: KdarkText)),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       chooseImagetwo("camera");
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Column(
                      //                       children: [
                      //                         Icon(
                      //                           Icons.camera_alt_outlined,
                      //                           color: kbloodred,
                      //                         ),
                      //                         SizedBox(
                      //                           height: 5.h,
                      //                         ),
                      //                         Text('camera',
                      //                             maxLines: 2,
                      //                             overflow: TextOverflow.ellipsis,
                      //                             style: GoogleFonts.roboto(
                      //                                 fontSize: 12.sp,
                      //                                 fontWeight: kFW700,
                      //                                 color: KdarkText)),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         });
                      //   },
                      //   child: DottedBorder(
                      //       dashPattern: [8, 2],
                      //       strokeWidth: 1,
                      //       color: kbloodred,
                      //       child: Container(
                      //         height: 35.h,
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30.r),
                      //           color: Kwhite,
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "Upload Patient Prescribtion",
                      //               style: GoogleFonts.roboto(
                      //                   fontSize: 12.sp,
                      //                   color: kbloodred,
                      //                   fontWeight: kFW600),
                      //             )
                      //           ],
                      //         ),
                      //       )),
                      // ),
                      // SizedBox(
                      //   height: 30.h,
                      // ),
                      // //////////////////////////////////////
                      // Container(
                      //   decoration: BoxDecoration(
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Ktextcolor.withOpacity(0.3),
                      //         blurRadius: 5,
                      //         offset: const Offset(0, 0),
                      //         spreadRadius: 1,
                      //       )
                      //     ],
                      //   ),
                      //   child: selectedImage != null
                      //       ? Image.file(
                      //           selectedImage!,
                      //           fit: BoxFit.cover,
                      //           height: 130.h,
                      //           width: double.infinity,
                      //         )
                      //       : const Text(
                      //           "",
                      //           textAlign: TextAlign.center,
                      //         ),
                      // ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     showModalBottomSheet(
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.only(
                      //               topRight: Radius.circular(20),
                      //               topLeft: Radius.circular(20)),
                      //         ),
                      //         backgroundColor: Kbackground,
                      //         context: context,
                      //         builder: (context) {
                      //           return Container(
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                   color: Kbackground,
                      //                   borderRadius: BorderRadius.only(
                      //                       topLeft: Radius.circular(20),
                      //                       topRight: Radius.circular(20))),
                      //               height: 100.h,
                      //               padding: EdgeInsets.only(top: 20.h),
                      //               child: Row(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                 children: [
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       chooseImage("Gallery");
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Column(
                      //                       children: [
                      //                         Icon(
                      //                           Icons.image_outlined,
                      //                           color: kbloodred,
                      //                         ),
                      //                         SizedBox(
                      //                           height: 5.h,
                      //                         ),
                      //                         Text('Gallery',
                      //                             maxLines: 2,
                      //                             overflow: TextOverflow.ellipsis,
                      //                             style: GoogleFonts.roboto(
                      //                                 fontSize: 12.sp,
                      //                                 fontWeight: kFW700,
                      //                                 color: KdarkText)),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       chooseImage("camera");
                      //                       Navigator.pop(context);
                      //                     },
                      //                     child: Column(
                      //                       children: [
                      //                         Icon(
                      //                           Icons.camera_alt_outlined,
                      //                           color: kbloodred,
                      //                         ),
                      //                         SizedBox(
                      //                           height: 5.h,
                      //                         ),
                      //                         Text('camera',
                      //                             maxLines: 2,
                      //                             overflow: TextOverflow.ellipsis,
                      //                             style: GoogleFonts.roboto(
                      //                                 fontSize: 12.sp,
                      //                                 fontWeight: kFW700,
                      //                                 color: KdarkText)),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           );
                      //         });
                      //   },
                      //   child: DottedBorder(
                      //       dashPattern: [8, 2],
                      //       strokeWidth: 1,
                      //       color: kbloodred,
                      //       child: Container(
                      //         height: 35.h,
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(30.r),
                      //           color: Kwhite,
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             Text(
                      //               "Upload Patient Admit Card",
                      //               style: GoogleFonts.roboto(
                      //                   fontSize: 12.sp,
                      //                   color: kbloodred,
                      //                   fontWeight: kFW600),
                      //             )
                      //           ],
                      //         ),
                      //       )),
                      // ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       checkColor: Kwhite,
                      //       activeColor: kbloodred,
                      //       value: this.value,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           this.value = value!;
                      //         });
                      //       },
                      //     ),
                      //     SizedBox(
                      //       width: 200.w,
                      //       child: Text(
                      //         "It's Critical Emergency",
                      //         maxLines: 2,
                      //         style:GoogleFonts.roboto(
                      //             fontSize: 13.sp,
                      //             fontWeight: kFW500,
                      //             color: kblack.withOpacity(0.8)),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   children: [
                      //     Checkbox(
                      //       checkColor: Kwhite,
                      //       activeColor: kbloodred,
                      //       value: this.valuetwo,
                      //       onChanged: (valuetwo) {
                      //         setState(() {
                      //           this.valuetwo = valuetwo!;
                      //         });
                      //       },
                      //     ),
                      //     SizedBox(
                      //       width: 200.w,
                      //       child: Text(
                      //         "I agree Terms and Conditions",
                      //         maxLines: 2,
                      //         style:GoogleFonts.roboto(
                      //             fontSize: 13.sp,
                      //             fontWeight: kFW500,
                      //             color: kblack.withOpacity(0.8)),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20.h,
                      //     )
                      //     ///////////////////////////////
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: kbloodred,
                            checkColor: Kwhite,
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                          Text(
                            "Is Emergency",
                            style: GoogleFonts.roboto(
                                fontSize: kTwelveFont.sp,
                                color: KdarkText,
                                fontWeight: kFW500),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 60.h,
                      ),
                      Obx(() => authentication.finddonorRegistrationLoading ==
                              true
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
                                var payload = {
                                  "patientFirstName": authentication
                                      .findDonorpatientFirstNameController.text,

                                  "patientLastName": authentication
                                      .findDonorpatientLastNameController.text,

                                  // "attendeeFirstName": authentication
                                  //     .findDonorattendeeFirstNameController.text,
                                  // // "Jalayyaa",
                                  // "attendeeLastName": authentication
                                  //     .findDonorattendeeLastNameController.text,
                                  //"manapathijj",
                                  // "attendeeMobile": authentication
                                  //     .findDonorattendeeMobileController.text,
                                  //"8998569678",
                                  "emergency": value,
                                  "AttendePhone": authentication
                                      .findDonorattendeeMobileController.text,

                                  //"8998569678",
                                  "bloodGroup":
                                      authentication.findDonorBloodGroup.value,
                                  "gender":
                                      authentication.donorRegistersGender.value,
                                  //"B+",
                                  "requestType":
                                      authentication.findDonorRequesttype.value,
                                  // "Blood",
                                  "quantity": unitsController1.text,
                                  // mlController1.text,
                                  //   authentication.findDonorquantityController.text,
                                  // "200ml",
                                  "requiredDate": selectDate.value,
                                  "hospitalName": authentication
                                      .findDonorHospitalController.text,
                                  "longitude":
                                      "${serviceController.position!.longitude}",
                                  "latitude":
                                      "${serviceController.position!.latitude}",
                                  "addTime": formattedDate,
                                  //"1/12/23",
                                  // "nameOfLocation":
                                  //     "${serviceController.address.value}",
                                  // //"Kukatpally",
                                  // "longitude":
                                  //     "${serviceController.position!.latitude}",
                                  // // 81.4749409,
                                  // "latitude":
                                  //     "${serviceController.position!.longitude}"
                                  //16.5433508
                                };
                                if (serviceController.address.value == null) {
                                  Fluttertoast.showToast(
                                    msg: "No location",
                                  );
                                } else {
                                  if (_formKey.currentState!.validate()) {
                                    authentication.findDonor(payload);
                                  }
                                }
                                // authentication.findDonor(payload);
                                // Fluttertoast.showToast(
                                //   msg: "Submitted Successfully",
                                // );
                                // Get.toNamed(kDonorslist);
                                //     Get.back();
                              },
                            )),

                      SizedBox(
                        height: 120.h,
                      ),
                      ///////////////////////////////
                    ],
                  ),
                ),
              )
            :
            // here
            apiController.donorsdataLoading == true
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 100.h),
                    child: CircularProgressIndicator(
                      color: kbloodred,
                    ),
                  )
                : apiController.donorsData.isEmpty ||
                        apiController.donorsData == null
                    ? Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
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
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
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
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        hint: Text(
                                          apiController.donorfilterbg.value,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: KdarkText,
                                          ),
                                        ),
                                        items: apiController.listB
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
                                            apiController.donorfilterbg.value =
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
                                                color: Ktextcolor.withOpacity(
                                                    0.4)),
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
                                            apiController.donorcounter <= 0
                                                ? SizedBox()
                                                : InkWell(
                                                    onTap: () {
                                                      apiController
                                                          .donordecrement();
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
                                                '${apiController.donorcounter} kms',
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
                                                  apiController
                                                      .donorincrement();
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
                                    if (apiController
                                            .profileData["employeeType"] !=
                                        "Donor") {
                                      apiController.getCurrentLocationforBank();
                                    } else {
                                      apiController.getCurrentLocation();
                                    }
                                    // apiController.getCurrentLocation();
                                  },
                                  child: Container(
                                    //  height: 50.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kbloodred.withOpacity(0.4)),
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
                          Text(
                            "No Donors",
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
                                    Container(
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
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kblack.withOpacity(0.6),
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
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        hint: Text(
                                          apiController.donorfilterbg.value,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: KdarkText,
                                          ),
                                        ),
                                        items: apiController.listB
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
                                            apiController.donorfilterbg.value =
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
                                InkWell(
                                  onTap: () {
                                    if (apiController
                                            .profileData["employeeType"] !=
                                        "Donor") {
                                      apiController.getCurrentLocationforBank();
                                    } else {
                                      apiController.getCurrentLocation();
                                    }
                                    // apiController.getCurrentLocation();
                                  },
                                  child: Container(
                                    //  height: 50.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kbloodred.withOpacity(0.4)),
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
                            height: orientation == Orientation.portrait
                                ? 45.h
                                : 20.h,
                            // height: 45.h,
                            alignment: Alignment.center,
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
                                      color: Ktextcolor.withOpacity(0.3),
                                      width: 1),
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
                                      color: Ktextcolor.withOpacity(0.3),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Ktextcolor.withOpacity(0.3),
                                      width: 1),
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
                                  apiController.donorsData.value = apiController
                                      .donorsDatafilter
                                      .where((element) => element["firstName"]
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              value.toString().toLowerCase()))
                                      .toList();
                                });
                                if (value == "") {
                                  //  apiController.getRceiversLocationforBank();
                                  setState(() {
                                    apiController.donorsData.value =
                                        apiController.OriginaldonorsData;
                                  });
                                }
                                if (apiController.donorsData.isEmpty &&
                                    value != "") {
                                  Fluttertoast.showToast(
                                      msg: "No Donors Available ,Search Again");
                                  //  apiController.
                                  // getRceiversLocationforBank();
                                  setState(() {
                                    apiController.donorsData.value =
                                        apiController.donorsDataCopy;
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
                                itemCount: apiController.donorsData.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        apiController.donorView.value =
                                            apiController.donorsData[index];
                                      });
                                      Get.toNamed(kDonorView);
                                    },
                                    // kDonorView
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          apiController.donorsData[index]
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
                                                                  .donorsData[
                                                              index]["profile"],
                                                      // apiController
                                                      //     .profileData["profile"],
                                                      placeholder:
                                                          (context, url) =>
                                                              SizedBox(
                                                        height: 60.h,
                                                        width: 60.w,
                                                        child:
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.black12,
                                                          highlightColor: Colors
                                                              .white
                                                              .withOpacity(0.5),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Kwhite
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            height: 60.h,
                                                            width: 60.w,
                                                          ),
                                                        ),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          CircleAvatar(
                                                        backgroundColor: Kwhite,
                                                        radius: 50.r,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                          SizedBox(width: 10.w),
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
                                                      width: 160.w,
                                                      child: Text(
                                                        apiController
                                                                .donorsData[
                                                                    index][
                                                                    "firstName"]
                                                                .toString()
                                                                .capitalizeFirst! +
                                                            " " +
                                                            apiController
                                                                    .donorsData[
                                                                index]["lastName"],
                                                        // "Mehar",
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize:
                                                                    kSixteenFont,
                                                                color:
                                                                    KdarkText,
                                                                fontWeight:
                                                                    kFW500),
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
                                                                              .donorsData[
                                                                          index]
                                                                      [
                                                                      "firstName"] +
                                                                  " " +
                                                                  apiController
                                                                              .donorsData[
                                                                          index]
                                                                      [
                                                                      "lastName"];
                                                              apicontroller
                                                                  .newChatpartnerBg
                                                                  .value = apiController
                                                                          .donorsData[
                                                                      index][
                                                                  "bloodGroup"];
                                                            });
                                                            var payload = {
                                                              "receiverId":
                                                                  apiController
                                                                          .donorsData[
                                                                      index]["_id"]
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
                                                          width: 20.w,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            launch(
                                                                "tel://${apiController.donorsData[index]["mobile"]}");
                                                          },
                                                          child: Icon(
                                                            Icons.call,
                                                            color: kbloodred
                                                                .withOpacity(
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
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "role : " +
                                                    apiController
                                                            .donorsData[index]
                                                        ["employeeType"],

                                                //"Male",
                                                style: GoogleFonts.roboto(
                                                    fontSize: kTwelveFont,
                                                    color: KText,
                                                    fontWeight: kFW500),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                "group : " +
                                                    apiController
                                                            .donorsData[index]
                                                        ["bloodGroup"],

                                                // "B+ve",
                                                style: GoogleFonts.roboto(
                                                    fontSize: kTwelveFont,
                                                    color: KText,
                                                    fontWeight:
                                                        kFW500), // KlightText
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              apiController.donorsData[index]
                                                          ["address"] ==
                                                      null
                                                  ? SizedBox()
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          "address : ",
                                                          //  "Nizamabad, Telangana, Hyderabad",
                                                          maxLines: 1,
                                                          style: GoogleFonts.roboto(
                                                              fontSize:
                                                                  kTwelveFont,
                                                              color: Ktextcolor,
                                                              fontWeight:
                                                                  kFW500), // KlightText
                                                        ),
                                                        SizedBox(
                                                          width: 170.w,
                                                          child: Text(
                                                            apiController.donorsData[
                                                                        index][
                                                                    "address"] ??
                                                                "",
                                                            maxLines: 1,
                                                            //  "Nizamabad, Telangana, Hyderabad",
                                                            style: GoogleFonts.roboto(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                color:
                                                                    Ktextcolor,
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
                          SizedBox(
                            height: 90.h,
                          )
                        ],
                      ),
      )),
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

        // TextFormField(
        //   controller: mlController,
        //   keyboardType: TextInputType.number,
        //   onChanged: (_) => updateUnitsFromMl(mlController, unitsController),
        //   decoration: InputDecoration(labelText: 'Milliliters Row $index'),
        // ),
        // TextFormField(
        //   controller: unitsController,
        //   keyboardType: TextInputType.number,
        //   onChanged: (_) => updateMlFromUnits(unitsController, mlController),
        //   decoration: InputDecoration(labelText: 'Units Row $index'),
        // ),
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
