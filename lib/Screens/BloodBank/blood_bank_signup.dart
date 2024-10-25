import 'dart:convert';
import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class BloodBankSignUp extends StatefulWidget {
  const BloodBankSignUp({super.key});

  @override
  State<BloodBankSignUp> createState() => _BloodBankSignUpState();
}

class _BloodBankSignUpState extends State<BloodBankSignUp> {
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

  String? selectedValue;

  final List<String> requesttype = [
    'Blood',
    'Platelets',
  ];

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
  String startTime = "";
  String closeTime = "";

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

  /////////////// openTime
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

  ////////////////////////////////
  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      // autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Register your Blood Bank ,by entering details below",
            style: GoogleFonts.roboto(
                fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
          ),
          SizedBox(
            height: 30.h,
          ),

          CustomFormFields(
            enabled: true,
            labelColor: KText,
            controller: authentication.BloodBankNameController,
            obscureText: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            fontSize: kFourteenFont,
            fontWeight: FontWeight.w500,
            hintText: "Enter Blood Bank Name",
            maxLines: 1,
            readOnly: false,
            label: 'Blood Bank Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Blood Bank Name';
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
            controller: authentication.BloodBankEmailController,
            obscureText: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
          //

          SizedBox(
            height: 20.h,
          ),

          CustomFormFields(
            ontap: () {
              Get.toNamed(kSearchPlacesBank);
            },
            enabled: true,
            labelColor: KText,
            controller: authentication.BloodBankAddressController,
            obscureText: false,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                  print(value);
                },
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(kAbokTermsutUs);
                },
                child: Text(
                  "Accept Terms and conditions",
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont.sp,
                      color: KdarkText,
                      fontWeight: kFW500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),

          Obx(() => authentication.registerBloodbankLoading == true
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
                  label: "Sign Up",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () {
                    var payload = {
                      "bloodBankName":
                          authentication.BloodBankNameController.text,
                      "mobile": authentication.enteredNumber.value,
                      "email": authentication.BloodBankEmailController.text,
                      "address": authentication.BloodBankAddressController.text,
                      "longitude": "${serviceController.position!.latitude}",
                      "latitude": "${serviceController.position!.longitude}",
                      // "startTime": startTime,
                      // "endTime": closeTime,
                      "termAndCondition": value,
                    };
                    if (serviceController.address.value == null) {
                      Fluttertoast.showToast(
                        msg: "No location",
                      );
                    } else {
                      if (_formKey.currentState!.validate()) {
                        authentication.bloodBankRegister(payload);
                      }
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
}
