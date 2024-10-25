import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
// import 'package:image_picker/image_picker.dart';

class FindDonor extends StatefulWidget {
  const FindDonor({super.key});

  @override
  State<FindDonor> createState() => _FindDonorState();
}

class _FindDonorState extends State<FindDonor> {
  //////////////////////////////////////////////////
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

  ////////////////////////
  ApiController authentication = Get.put(ApiController());
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
    }
  }

  ////////////////////////////////
  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Add Patient",
      ),
      backgroundColor: Kwhite,
      body: SingleChildScrollView(
        child: Container(
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

                CustomFormFields(
                  enabled: true,
                  labelColor: KText,
                  controller:
                      authentication.findDonorpatientFirstNameController,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

                CustomFormFields(
                  enabled: true,
                  labelColor: KText,
                  controller: authentication.findDonorpatientLastNameController,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

                SizedBox(
                  height: 20.h,
                ),

                CustomFormFields(
                  controller: authentication.findDonorattendeeMobileController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  labelColor: KText,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

                _buildRow(1, mlController1, unitsController1, "Quantity"),

                SizedBox(
                  height: 20.h,
                ),

                CustomFormFields(
                  enabled: true,
                  labelColor: KText,
                  controller: authentication.findDonorHospitalController,
                  obscureText: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

                CustomFormFields(
                  hintColor: KdarkText,
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

                      // DateFormat.yMMMd().format(selectedDate) ==
                      //         DateFormat.yMMMd().format(DateTime.now())
                      //     ? "Select Date"
                      //     : DateFormat('dd/MM/yyyy')

                      //         .format(selectedDate)
                      DateFormat('dd/MM/yyyy').format(selectedDate),
                  readOnly: false,
                  onChanged: (value) {}, label: 'Required Date',

                  validator: (value) {
                    // if (DateFormat.yMMMd().format(selectedDate) ==
                    //     DateFormat.yMMMd().format(DateTime.now())) {
                    //   return 'Please select Required Date';
                    // }
                    // return null;
                  },
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

                SizedBox(
                  height: 20.h,
                ),
                ////////////////////////////////////////////

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
                Obx(() => authentication.finddonorRegistrationLoading == true
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

                            "emergency": value,
                            "AttendePhone": authentication
                                .findDonorattendeeMobileController.text,

                            //"8998569678",
                            "bloodGroup":
                                authentication.findDonorBloodGroup.value,
                            "gender": authentication.donorRegistersGender.value,
                            //"B+",
                            "requestType":
                                authentication.findDonorRequesttype.value,
                            // "Blood",
                            "quantity": unitsController1.text,
                            // mlController1.text,
                            //   authentication.findDonorquantityController.text,
                            // "200ml",
                            "requiredDate": selectDate.value,
                            "hospitalName":
                                authentication.findDonorHospitalController.text,
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

// // gender

class Requests {
  const Requests({
    required this.text,
  });

  final String text;
}

abstract class Request {
  static const List<Requests> firstItems = [home, share, settings];
  static const List<Requests> secondItems = [logout];

  static const home = Requests(text: 'Urgent');
  static const share = Requests(text: 'Ordinary');
  static const settings = Requests(text: 'Very Urgent');
  static const logout = Requests(text: 'None');

  static Widget buildItem(Requests item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, Requests item) {
    switch (item) {
      case Request.home:
        break;
      case Request.settings:
        break;
      case Request.share:
        break;
      case Request.logout:
        break;
    }
  }
}

// // Country
class Locations {
  const Locations({
    required this.text,
  });

  final String text;
}

abstract class Location {
  static const List<Locations> firstItems = [home, share, settings];
  static const List<Locations> secondItems = [logout];

  static const home = Locations(text: 'Begumpet');
  static const share = Locations(text: 'Hyderguda');
  static const settings = Locations(text: 'Shamshabad');
  static const logout = Locations(text: 'Ameerpet');

  static Widget buildItem(Locations item) {
    return Text(
      item.text,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
    );
  }

  static void onChanged(BuildContext context, Location item) {
    switch (item) {
      case Location.home:
        break;
      case Location.settings:
        break;
      case Location.share:
        break;
      case Location.logout:
        break;
    }
  }
}
