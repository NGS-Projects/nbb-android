import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FAddDonation extends StatefulWidget {
  const FAddDonation({super.key});

  @override
  State<FAddDonation> createState() => _FAddDonationState();
}

class _FAddDonationState extends State<FAddDonation> {
  final _formKey = GlobalKey<FormState>();
  String selectedgender = "";
  // location
  FriendsApiController fapiController = Get.put(FriendsApiController());
  GoogleController serviceController = Get.put(GoogleController());
  int activeIndex = 0;
  final carouselcontroller = CarouselController();
  bool value = false;
  bool agevalue = false;
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
  final List<String> bloodgroupss = ['Blood', 'Plasma'];

  //
  final List<String> Genders = [
    'Male',
    'Female',
    'Others',
  ];

  String? selectedValue;
  String? selectedGenderValue;
  String? selectedStateValue;
  String? selectedDistrictValue;
  String? selectedCityValue;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;

  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  ApiController authentication = Get.put(ApiController());
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: GoogleFonts.roboto(
                  fontSize: kEighteenFont,
                  fontWeight: kFW600,
                  color: Ktextcolor),
            ),
            content: Text(
              'Do you want to exit this App',
              style: GoogleFonts.roboto(
                  fontSize: 13.sp, fontWeight: kFW600, color: KText),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: KdarkText),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  style: GoogleFonts.roboto(
                      fontSize: kTwelveFont,
                      fontWeight: kFW600,
                      color: kbloodred),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    // fapiController.getfHistoryList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Add Donation History",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(

                    Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),

                        CustomFormFields(
                          enabled: true,
                          labelColor: KText,
                          controller:
                              authentication.lastDonationPatientNameController,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "Enter Patient",
                          maxLines: 1,
                          readOnly: false,
                          label: 'Patient Nmae',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Patient Nmae';
                            }
                            return null;
                          },
                        ),
                        ///////////

                        SizedBox(
                          height: 20.h,
                        ),
                        /////

                        CustomFormFields(
                          enabled: true,
                          labelColor: KText,
                          controller:
                              authentication.lastDonationLocationController,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "Enter Location",
                          maxLines: 1,
                          readOnly: false,
                          label: 'Location',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Location';
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 20.h,
                        ),
                        /////

                        CustomFormFields(
                          enabled: true,
                          labelColor: KText,
                          controller:
                              authentication.lastDonationHospitalController,
                          obscureText: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          fontSize: kFourteenFont,
                          fontWeight: FontWeight.w500,
                          hintText: "Enter Hospital name",
                          maxLines: 1,
                          readOnly: false,
                          label: 'Hospital',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Hospita name';
                            }
                            return null;
                          },
                        ),
                        // registerDonorPasswordController

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
                          controller:
                              authentication.registerDonorDateofBirthController,
                          hintText:
                              // selectedDate == DateTime.now()
                              // DateFormat.yMMMd().format(selectedDate) ==
                              //         DateFormat.yMMMd().format(DateTime.now())
                              //     ? "Select Date"
                              //     :
                              DateFormat('dd/MM/yyyy')
                                  // DateFormat.yMMMEd()
                                  .format(selectedDate)
                          // DateFormat.yMMMEd().format(selectedDate)
                          ,
                          readOnly: false,
                          onChanged: (value) {},
                          label: 'Date of Donation',
                          // hintText: "Full Name",
                          // maxLines: 1,
                          // readOnly: false,
                          // label: 'Full Name',
                          validator: (value) {
                            if (DateFormat.yMMMd().format(selectedDate) ==
                                DateFormat.yMMMd().format(DateTime.now())) {
                              return 'Please select Date';
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
                            "Blood Type",
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
                              'Select Blood Type',
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

                        Obx(() => fapiController.adddonationLoading == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kbloodred,
                                ),
                              )
                            : CustomButton(
                                margin: EdgeInsets.only(top: 50.h),
                                borderRadius: BorderRadius.circular(10.r),
                                Color: kbloodred,
                                textColor: Kwhite,
                                height: 42.h,
                                width: double.infinity,
                                label: "Add",
                                fontSize: kSixteenFont,
                                fontWeight: kFW500,
                                isLoading: false,
                                onTap: () {
                                  var payload = {
                                    "donationDate": selectDate.value,
                                    "patientName": authentication
                                        .lastDonationPatientNameController.text,
                                    "location": authentication
                                        .lastDonationLocationController.text,
                                    "typeOfDonation": authentication
                                        .donorRegisterBloodGroup.value,
                                    "hospitalName": authentication
                                        .lastDonationHospitalController.text
                                  };
                                  ////////////////////////////////////////////////////////////////////////////////////////////////

                                  ///////////////////////////

                                  // if (serviceController.address.value == null) {
                                  //   Fluttertoast.showToast(
                                  //     msg: "No location",
                                  //   );
                                  // } else {
                                  if (_formKey.currentState!.validate()) {
                                    fapiController.addDonationRecord(payload);
                                  }
                                  // }

                                  // "phone": authentication.loginMobileController.text,
                                  //  "8297297247"
                                }

                                // Fluttertoast.showToast(
                                //   msg: "Registered Successfully",
                                // );

                                )),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    )

                    //FindDonor()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
