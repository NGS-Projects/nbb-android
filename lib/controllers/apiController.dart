import 'dart:convert';
import 'dart:io';

import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiController extends GetxController {
  final apiService = Get.put(ApiService());

  ///////////Counter
  var counter = 10.obs;
  var bankfilterbg = "A+".obs;
  var receiverfilterbg = "A+".obs;
  var donorfilterbg = "A+".obs;

  void increment() {
    counter.value += 5;
  }

  void decrement() {
    counter.value -= 5;
  }

  ///DonorsCounter
  var donorcounter = 10.obs;

  void donorincrement() {
    donorcounter.value += 5;
  }

  void donordecrement() {
    donorcounter.value -= 5;
  }

  //ReceiversCounter
  var receivercounter = 10.obs;

  void receiverincrement() {
    receivercounter.value += 5;
  }

  void receiverdecrement() {
    receivercounter.value -= 5;
  }

  ///////////
  ///
  TextEditingController donorHealthreasonController = TextEditingController();

  ///Blood Bank fields
  TextEditingController BloodBankNameController = TextEditingController();
  TextEditingController BloodBankMobileController = TextEditingController();
  TextEditingController BloodBankEmailController = TextEditingController();
  TextEditingController BloodBankLongitudeController = TextEditingController();
  TextEditingController BloodBankLatitudeController = TextEditingController();
  TextEditingController BloodBankAddressController = TextEditingController();

  ///Review
  TextEditingController rateExperienceController = TextEditingController();

  TextEditingController loginMobileController = TextEditingController();

  // Edit Profile
  TextEditingController editDonorfirstNameController = TextEditingController();
  TextEditingController editDonorLastNameController = TextEditingController();
  TextEditingController editBloodBankNameController = TextEditingController();
  TextEditingController editBloodBankEmailController = TextEditingController();
  TextEditingController editBloodBanklocationsController =
      TextEditingController();
  TextEditingController editBloodBankstartTimeController =
      TextEditingController();
  TextEditingController editBloodBankendTimeController =
      TextEditingController();

  ///
  //Forgot password
  TextEditingController forgotPhonenumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final address = ''.obs;

  void updateAddress(String newAddress) {
    address.value = newAddress;
  }

  TextEditingController lastDonationPatientNameController =
      TextEditingController();
  TextEditingController lastDonationLocationController =
      TextEditingController();
  TextEditingController lastDonationHospitalController =
      TextEditingController();
  //////////////////////
//  {
//   "firstName" : "Prem",
  TextEditingController registerDonorfirstNameController =
      TextEditingController();
  TextEditingController fregisterDonorfirstNameController =
      TextEditingController();
//   "lastName" : "RRR",
  TextEditingController registerDonorlastNameController =
      TextEditingController();
//   "mobile" : "3131313131",
  TextEditingController registerDonorMobileController = TextEditingController();
  TextEditingController fregisterDonorMobileController =
      TextEditingController();
  TextEditingController registerDonorPasswordController =
      TextEditingController();
//   "email" : "vamsidigamarthi03@gmail.com",
  TextEditingController registerDonorEmailController = TextEditingController();
  TextEditingController fregisterDonorEmailController = TextEditingController();
//   "bloodGroup" : "B+",
  TextEditingController registerDonorBloodController = TextEditingController();
  TextEditingController registerDonorAddressController =
      TextEditingController();
  var donorRegisterBloodGroup = "".obs;
  var donorRegisterGender = "".obs;
  var donorRegistersGender = "".obs;
  var findDonorBloodGroup = "".obs;
  var findDonorRequesttype = "".obs;
  var todayName = "Monday".obs;

  ///////////////////////////////////////////
  var isBloodCardSelected = false.obs;
  var selectedBloodCardIndex = 0.obs;
  TextEditingController mobileSigninController = TextEditingController();
  TextEditingController passwordSigninController = TextEditingController();
//   "dateOfBirth" : "08/05/1999",
  TextEditingController registerDonorDateofBirthController =
      TextEditingController();
//   "location" : "Palakollu",
  TextEditingController registerDonorDateofLocationController =
      TextEditingController();
//   "longitude" :81.6497616,
  TextEditingController registerDonorlongitudeLocationController =
      TextEditingController();
//   "latitude" : 16.5196953
  TextEditingController registerDonorlatitudeLocationController =
      TextEditingController();
// }
  ////////////////////
  ///
  ///find donor
//   {
//   "patientFirstName" : "Maniraj",
  TextEditingController findDonorpatientFirstNameController =
      TextEditingController();
//   "patientLastName" : "Mamamma amma",
  TextEditingController findDonorpatientLastNameController =
      TextEditingController();
//   "attendeeFirstName" : "Jalayyaa",
  TextEditingController findDonorattendeeFirstNameController =
      TextEditingController();
//   "attendeeLastName" : "manapathijj",
  TextEditingController findDonorattendeeLastNameController =
      TextEditingController();
//   "attendeeMobile" : "2121219821",
  TextEditingController findDonorattendeeMobileController =
      TextEditingController();
//   "bloodGroup" : "B+",
  TextEditingController findDonorBloodController = TextEditingController();
//   "requestType" : "Blood",
  TextEditingController findDonorRequestTypeMobileController =
      TextEditingController();
//   "quantity" : "200ml",
  TextEditingController findDonorquantityController = TextEditingController();
  TextEditingController ApquantityController = TextEditingController();
  TextEditingController AnquantityController = TextEditingController();
  TextEditingController bpquantityController = TextEditingController();
  TextEditingController bnquantityController = TextEditingController();
  TextEditingController opquantityController = TextEditingController();
  TextEditingController onquantityController = TextEditingController();
  TextEditingController abpquantityController = TextEditingController();
  TextEditingController abnquantityController = TextEditingController();
  TextEditingController findDonorHospitalController = TextEditingController();

//   "requiredDate" : "1/12/23",
  TextEditingController findDonorrequiredDateController =
      TextEditingController();

  ///

  TextEditingController fullnameProfileController = TextEditingController();
  TextEditingController mobileProfileController = TextEditingController();
  TextEditingController emailProfileController = TextEditingController();
  var gender = "".obs;
  var selectedRegister = "donor".obs;
  var enSearch = false.obs;
  var timerOn = false.obs;
  var fcmToken = "".obs;
  var dropdownvalue = "Select Region".obs;
  var isLanguage = "Telugu".obs;
  var acceptSignupCondition = false.obs;
  enableSearch(bool value) {
    enSearch(value);
  }

////////////////////////////////////////////////////////////////////////////////////////////
  GoogleController serviceController = Get.put(GoogleController());

  double lat = 37.42796133580664;
  double lon = -122.085749655962;

  String? _currentAddress;
  String? _currentAddresspincode;
  var isLoadings = false.obs;
  var isLoading = "none";
  var otpLoading = false.obs;
  var resortsloading = false.obs;
  var resortsData = [].obs;
  var originalresortsList = [].obs;
  var dynamicresortsList = [].obs;
  var userCurrentLocationLatitude = "".obs;
  var userCurrentLocationLongitude = "".obs;
  var range = 10.obs;

  var phoneVerification = 0.obs;
  Future<void> getCurrentLocation() async {
    donorsdataLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    // donorfilterbg.value = profileData["bloodGroup"];
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };

    // donorsdataLoading(true);
    try {
      var response = await apiService.getRequest(
          endpoint:
              // "blood/needed/find/donor/longitude//latitude//distance/${donorcounter.value}/${storedloginsData["bloodGroup"]}");
              "blood/find/donor/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${donorcounter.value}/${donorfilterbg.value}");

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        donorsData.value = data;
        donorsDatafilter.value = data;
        donorsDataCopy.value = data;

        OriginaldonorsData.value = data;
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorsdataLoading(false);
    }
  }

  Future<void> getCurrentLocationforBank() async {
    donorsdataLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };

    // donorsdataLoading(true);
    try {
      var response = await apiService.getRequest(
          endpoint:
              // "blood/needed/find/donor/longitude//latitude//distance/${donorcounter.value}/${storedloginsData["bloodGroup"]}");
              "blood/find/donor/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${donorcounter.value}/A+");

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        donorsData.value = data;
        donorsDatafilter.value = data;
        donorsDataCopy.value = data;

        OriginaldonorsData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorsdataLoading(false);
    }
  }

  //GetReciversList
  var receiversdataLoading = false.obs;
  Future<void> getRceiversLocation() async {
    receiversdataLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };

    // donorsdataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          endpoint:
              "blood/find/recevire/list/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${receivercounter.value}/bloodGroup/${profileData["bloodGroup"]}"); // apiController.profileData["bloodGroup"]

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        reciversData.value = data;
        reciversDatafilter.value = data;
        reciversDataCopy.value = data;

        OriginalreciversData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      receiversdataLoading(false);
    }
  }

///////////////
  var assetsData = [].obs;
  var reciversDatafilter = [].obs;

  var OriginalreciversData = [].obs;
///////////////
  Future<void> getRceiversLocationforBank() async {
    receiversdataLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };

    // donorsdataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          endpoint:
              "blood/find/recevire/list/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${receivercounter.value}/bloodGroup/${receiverfilterbg.value}"); // apiController.profileData["bloodGroup"]

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        reciversData.value = data;
        reciversDatafilter.value = data;
        reciversDataCopy.value = data;

        OriginalreciversData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      receiversdataLoading(false);
    }
  }

  ////////////Distance of Banks
  var distanceInKilometers = 0.0.obs;

  void calculateDistance(double lat, double longi) {
    double startLatitude = serviceController.latittude;

    // double.parse(serviceController.latittude as String);
    double startLongitude = serviceController.longitude;
    double endLatitude = lat;
    double endLongitude = longi;
    // double endLatitude = 17.438819837071353;
    // double endLongitude = 78.34050178467211;

    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );

    // Convert meters to kilometers
    distanceInKilometers.value = distanceInMeters / 1000;
    print(distanceInKilometers);
    print(distanceInKilometers.value);
  }
  ///////////////////////////////////////////

  ////  Get Banks List
  var bankListLoading = false.obs;
  Future<void> getBanksList() async {
    bankListLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };
    bankdonorsData.value = [];
    bankdonorsDatafilter.value = [];
    bankdonorsDataCopy.value = [];

    OriginalbankdonorsData.value = [];
    // donorsdataLoading(true);
    try {
      var response = await apiService.getRequest(
          endpoint:
              // "blood/needed/find/blood/bank/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${counter.value}"
              "blood/find/blood/bank/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${counter.value}/bloodGroup/${profileData["bloodGroup"]}/quantity/200"
          //  "blood/needed/find/donor/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${range.value}/${storedloginsData["bloodGroup"]}"
          );

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        bankdonorsData.value = data;
        // bankdonorsDatafilter.value = data;
        // bankdonorsDataCopy.value = data;

        // OriginalbankdonorsData.value = data;
        //////////////////////////////////////////////////////////////// add distance
        for (int i = 0; i < bankdonorsData.length; i++) {
          calculateDistance(bankdonorsData[i]["location"]["coordinates"][1],
              bankdonorsData[i]["location"]["coordinates"][0]);
          bankdonorsData[i]['distance'] = distanceInKilometers.value;
          print(bankdonorsData[i]);
          //   if(int.parse(kitchen[i]["delivery_time"])<=time.value){
          //   lesstimeKitchen.add(kitchen[i]);
          // }
        }

        print(bankdonorsData.value);
        bankdonorsData.value
            .sort((a, b) => a['distance'].compareTo(b['distance']));
        print(bankdonorsData.value);
        bankdonorsDatafilter.value = bankdonorsData.value;
        bankdonorsDataCopy.value = bankdonorsData.value;

        OriginalbankdonorsData.value = bankdonorsData.value;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      bankListLoading(false);
    }
  }

// ramworkv2
///////////////////////blogsList
  var blogsData = [].obs;
  var blogViewData = {}.obs;
  var blogsDatadataLoading = false.obs;

  Future<void> getBlogsList() async {
    blogsDatadataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "blog/news");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        blogsData.value = data;
        print(blogsData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      blogsDatadataLoading(false);
    }
  }
  //////////////get Annoucements

  var announcedData = {}.obs;
  var announceddataLoading = false.obs;

  Future<void> getAnnouncedData() async {
    announceddataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "blog/announcements");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        announcedData.value = data;
        print(announcedData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
      // Get.snackbar(
      //   "E-MLA",
      //   "Something Went Wrong!!",
      //   icon: const Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      announceddataLoading(false);
    }
  }

////////////////////////////////////////Reviews List
  var reviewsData = [].obs;

  var reviewsdataLoading = false.obs;

  Future<void> getReviewsList() async {
    reviewsdataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "blog/reviews");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        reviewsData.value = data;
        print(reviewsData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      reviewsdataLoading(false);
    }
  }

//////////////////////////////////////////////////////////////////////

  ///////////////////////////// //
  Future<void> getBanksListforBank() async {
    bankListLoading(true);
    isLoading = "started";
    Position position = await _determinePosition();
    serviceController.position = position;
    serviceController.latittude = serviceController.position!.latitude;
    serviceController.longitude = serviceController.position!.longitude;

    resortsloading(true);
    var payload = {
      "latitude": serviceController.latittude.toString(),
      "longitude": serviceController.longitude.toString(),
      "radius": "155"
    };

    // donorsdataLoading(true);
    bankdonorsData.value = [];
    bankdonorsDatafilter.value = [];
    bankdonorsDataCopy.value = [];

    OriginalbankdonorsData.value = [];
    try {
      var response = await apiService.getRequest(
          endpoint:
              // "blood/needed/find/blood/bank/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${counter.value}"
              "blood/find/blood/bank/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${counter.value}/bloodGroup/${bankfilterbg.value}/quantity/200"
          //  "blood/needed/find/donor/longitude/${serviceController.longitude}/latitude/${serviceController.latittude}/distance/${range.value}/${storedloginsData["bloodGroup"]}"
          );

      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        bankdonorsData.value = data;

        //////////////////////////////////////////////////////////////// add distance
        for (int i = 0; i < bankdonorsData.length; i++) {
          calculateDistance(bankdonorsData[i]["location"]["coordinates"][1],
              bankdonorsData[i]["location"]["coordinates"][0]);
          bankdonorsData[i]['distance'] = distanceInKilometers.value;
          print(bankdonorsData[i]);
          //   if(int.parse(kitchen[i]["delivery_time"])<=time.value){
          //   lesstimeKitchen.add(kitchen[i]);
          // }
        }

        print(bankdonorsData.value);
        bankdonorsData.value
            .sort((a, b) => a['distance'].compareTo(b['distance']));
        print(bankdonorsData.value);
        bankdonorsDatafilter.value = bankdonorsData.value;
        bankdonorsDataCopy.value = bankdonorsData.value;

        OriginalbankdonorsData.value = bankdonorsData.value;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      bankListLoading(false);
    }
  }
  /////////////////////////////

  // Future<Position> _determinePosition() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error(
  //           'Location permissions are permanently denied, we cannot request permissions.');
  //     } else {
  //       if (isPermissionGiven != true) {
  //         permission = await Geolocator.requestPermission();
  //         if (permission == LocationPermission.denied) {
  //           return Future.error('Location permissions are denied');
  //         }
  //       } else {
  //         Fluttertoast.showToast(
  //           msg: "Denined Location Will Failed To Upload Attendance",
  //         );
  //       }
  //     }
  //   } else {
  //     isPermissionGiven = true;
  //   }
  //   isLoading = "ended";

  //   return await Geolocator.getCurrentPosition();
  // }

  // bool isPermissionGiven = false;
  var isPermissionGiven = false.obs; // RxBool for reactive state management
  var isLoadingg = "loading".obs;
  Future<Position> _determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      } else {
        if (!isPermissionGiven.value) {
          await _showMyDialog(); // Show custom dialog here

          if (!isPermissionGiven.value) {
            // User has canceled the custom dialog
            return Future.error('Location permissions are denied');
          }

          // User accepted in the custom dialog
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          }
        } else {
          // Use Get.snackbar or any other GetX method for showing messages
          Get.snackbar(
              'Info', 'Denied Location Will Fail To Upload Attendance');
        }
      }
    } else {
      isPermissionGiven.value = true;
    }
    isLoadingg.value = "ended";

    return await Geolocator.getCurrentPosition();
  }

  ///////////////////////////////////////////////////////////////////////////////////
  Future<void> _showMyDialog() async {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: 350,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Text('Location Permission',
                  style: TextStyle(
                      color: KdarkText,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                "NBB APP collects Your Location Info to get receivers list,donors list and blood banks list around you.",
                //  'NBB APP collects Your Location Info to MarkUp your Attendance',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: KdarkText,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Image.asset(
                "assets/images/location.png",
                width: 150,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    borderRadius: BorderRadius.circular(15),
                    margin: EdgeInsets.all(10),
                    width: 110,
                    height: 35,
                    Color: Kwhite,
                    textColor: kbloodred,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    label: "Cancel",
                    isLoading: false,
                    onTap: () {
                      isPermissionGiven.value = false;
                      Get.back();
                    },
                  ),
                  CustomButton(
                    borderRadius: BorderRadius.circular(15),
                    margin: EdgeInsets.all(10),
                    width: 110,
                    height: 35,
                    Color: kbloodred,
                    textColor: Kwhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    label: "Accept",
                    isLoading: false,
                    onTap: () {
                      isPermissionGiven.value = true;
                      Get.back();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
  //////////////////////////////////////////////////////////////////////////////

  static const kEmbedMapApiKey = "AIzaSyBBqQ4qmiRZD_z_MSSzS_rJ7K4TbRral68";
  ////////////////////////////////////////////////////////////////////////////////////////////////////for image
  var assetImagePath = "assets/images/sunraylogo.png".obs;
  var activeassetLoading = false.obs;

////Blood Apis////////////////////// Blood donor
////////////////////////////////
  ///BloodBankRegister
  var registerBloodbankLoading = false.obs;

  var registerBloodbankMobileEntered = "".obs;
  Future<void> bloodBankRegister(Map payload) async {
    registerBloodbankLoading(true);
    registerBloodbankMobileEntered.value = payload["mobile"];

    try {
      var response = await apiService.postRequestNotoken(
          //   var response = await apiService.postAuthRequest(

          endpoint: "auth/blood/bank",
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] != "Registration Successfully ..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: "Registered Successfully",
        );
        var bloodbankpayloads = {
          "mobile": registerBloodbankMobileEntered.value,
          //  "8297297247"
        };

        logins(bloodbankpayloads);
        //  Get.toNamed(kSignInScreen)
        //   Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      registerBloodbankLoading(false);
    }
  }

  //////// Add Rating
  var addRatingLoading = false.obs;

  Future<void> addRating(Map payload) async {
    addRatingLoading(true);

    try {
      var response = await apiService.postRequestNotoken(
          //   var response = await apiService.postAuthRequest(

          endpoint: "blog/reviews",
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] != "uploaded successfully..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        // getReviewsList();
        // Get.back();
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getReviewsList();
        Get.back();
        // loginData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      addRatingLoading(false);
    }
  }

  /////////////BloodBank Register With Image

  Future<void> bloodBankRegisterwithImage(Map payload, File file) async {
    registerBloodbankLoading(true);
    registerBloodbankMobileEntered.value = payload["mobile"];

    try {
      //
      var response = await apiService.postRequestDonorSignupFormDatabloodBank(
          //   var response = await apiService.postAuthRequest(

          endpoint: "auth/blood/bank",
          image: file,
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);
      Map data = jsonDecode(response);
      // Map data = response;
      print(response);
      if (data["message"] == "User already exists") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else if (data["message"] != "Registration Successfully ..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else {
        Fluttertoast.showToast(
          msg: "Registered Successfully",
        );
        var bloodbankpayloads = {
          "mobile": registerBloodbankMobileEntered.value,
          //  "8297297247"
        };

        logins(bloodbankpayloads);
        //  Get.toNamed(kSignInScreen)
        //   Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      registerBloodbankLoading(false);
    }
  }

// Find Donor
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
  var finddonorRegistrationLoading = false.obs;
  var finddonorRegistrationData = {}.obs;
  var finddonorMobileEntered = "".obs;
  Future<void> findDonor(Map payload) async {
    finddonorRegistrationLoading(true);
    // finddonorMobileEntered.value = payload["attendeeMobile"];

    try {
      //
      var response = await apiService.postRequestToken(
          //   var response = await apiService.postAuthRequest(

          endpoint: "patient/add/patient",
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "Updated Patient Details..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        Get.toNamed(kPatientsScreen);
        // Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      finddonorRegistrationLoading(false);
    }
  }

// Update Schedule of Blood bank timings
  var scheduleLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> updateBloodBankTimings(Map payload) async {
    scheduleLoading(true);
    try {
      var response = await apiService.patchRequest(
          endpoint: "bloodbank/add/bloodbank/timmings",
          // http://183.82.10.109/bloodbank/add/bloodbank/timmings
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "updated") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        Get.back();
        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      scheduleLoading(false);
    }
  }

  // DeletePatient

  var deletePatientLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> deletePatient(String id) async {
    deletePatientLoading(true);
    try {
      var response = await apiService.patchRequestNopayload(
        endpoint: "patient/isdelete/${id}",
      );

      Map data = response;
      print(response);
      if (data["message"] == "updated successfully ....!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getPatients();

        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      deletePatientLoading(false);
    }
  }

  // delete profilepic
  var deleteProfilepicLoading = false.obs;
  Future<void> deleteProfilepic() async {
    deleteProfilepicLoading(true);
    try {
      var response = await apiService.patchRequestNopayload(
        endpoint: "auth/profile",
      );

      Map data = response;
      print(response);
      if (data["message"] == "Upload profile successfully...!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        Get.back();

        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      deleteProfilepicLoading(false);
    }
  }
  //

  // activat patient

  var activatePatientLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> activatePatient(String id) async {
    activatePatientLoading(true);
    try {
      var response = await apiService.patchRequestNopayload(
        endpoint: "patient/isActive/${id}",
        // patient/isActive/66593165e2a7dea31c8f1a39
      );

      Map data = response;
      print(response);
      if (data["message"] == "updated successfully ....!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getPatients();

        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      activatePatientLoading(false);
    }
  }

  // ActivatPatient with Del Option
  var activatePatientwithDeleteLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> activatePatientWithDeleteOption(String id) async {
    activatePatientwithDeleteLoading(true);
    try {
      var response = await apiService.patchRequestNopayload(
        endpoint: "patient/isActive/${id}",
        // patient/isActive/66593165e2a7dea31c8f1a39
      );

      Map data = response;
      print(response);
      if (data["message"] == "updated successfully ....!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        // deletePatient(id);
        getPatients();

        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      activatePatientwithDeleteLoading(false);
    }
  }

  /////////////////

  // Update available blood quantity
  var bloodQuantityLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> bloodAvailability(List payload) async {
    bloodQuantityLoading(true);
    try {
      var response = await apiService.patchRequestList(
          endpoint: "bloodbank/add/bloods",
          //"bloodbank/update/bloodbank/details",
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "updated") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      bloodQuantityLoading(false);
    }
  }

//Available Api
//
  var donorAvailableLoading = false.obs;
  var switchValues = false.obs;
  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> donorAvailability(Map payload) async {
    donorAvailableLoading(true);
    try {
      //
      var response = await apiService.patchRequest(
          //   var response = await apiService.postAuthRequest(
          // https://blood-server-us7o.onrender.com/auth/registor/donor
          //https://blood-server-us7o.onrender.com/auth/update/user/available
          endpoint: "auth/update/user/available",
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "Updated Successfully...!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        switchValues.value = profileData["isAvailable"];
        print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorAvailableLoading(false);
    }
  }

  //   Edit profile form
  var editFormLoading = false.obs;

  // bool _switchValue = false;
  //var donorRegistrationData = {}.obs;
  Future<void> editProfileForm(Map payload) async {
    editFormLoading(true);
    try {
      //
      var response = await apiService.patchRequest(
          endpoint: "auth/edit/profile", payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "Upload profile successfully...!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        Get.back();
        // switchValues.value = profileData["isAvailable"];
        // print(switchValues.value);
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        //  Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      editFormLoading(false);
    }
  }

  /////////////////
// DonorEditProfile
  var donorEditLoading = false.obs;
  // var donorRegistrationData = {}.obs;
  // var donorMobileEntered = "".obs;
  Future<void> donorEditProfile(File file) async {
    donorEditLoading(true);

    //  donorMobileEntered.value = payload["mobile"];
    try {
      var response = await apiService.patchRequestEditProfile(
          endpoint: "auth/edit/pic",
          // "auth/edit/profile/${storedloginsData["_id"]}",

          //"auth/registor/donor",

          profilePic: file);

      Map data = jsonDecode(response);
      print(response);
      if (data["message"] == "Upload profile successfully...!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        // Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );

        // logins(payload[""])
        // Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorEditLoading(false);
    }
  }

  Future<void> donorEditProfileBank(Map payload, File file) async {
    donorEditLoading(true);

    //  donorMobileEntered.value = payload["mobile"];
    try {
      var response = await apiService.patchRequestEditProfilebank(
          //   var response = await apiService.postAuthRequest(
          // https://blood-server-us7o.onrender.com/auth/registor/donor
          endpoint: "auth/edit/profile",
          // "auth/edit/profile/${storedloginsData["_id"]}",

          //"auth/registor/donor",
          payload: payload,
          profilePic: file);

      Map data = jsonDecode(response);
      print(data);
      if (data["message"] == "Upload profile successfully...!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        getProfile();
        Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );

        // logins(payload[""])
        // Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorEditLoading(false);
    }
  }

  /////////MobileNumberOtpRegister

  var mobileRegistrationLoading = false.obs;
  var mobileRegistrationData = {}.obs;
  var mobileMobileEntered = "".obs;
  Future<void> mobileRegistration(Map payload) async {
    mobileRegistrationLoading(true);
    mobileMobileEntered.value = payload["mobile"];
    try {
      var response = await apiService.postRequestNotoken(
          //   var response = await apiService.postAuthRequest(
          // https://blood-server-us7o.onrender.com/auth/registor/donor
          endpoint: "auth/send-otp",
          //"auth/registor/donor",
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "otp send updated db" ||
          data["message"] == "otp send & updated db") {
        Get.toNamed(kOtpScreen, arguments: mobileMobileEntered.value);
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
        // var payloads = {
        //   "mobile": donorMobileEntered.value,

        // };

        // logins(payloads);

        // Get.toNamed(kOtpScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      mobileRegistrationLoading(false);
    }
  }

  //OTP verification

  var otpRegistrationLoading = false.obs;
  var otpRegistrationData = {}.obs;
  var otpMobileEntered = "".obs;
  Future<void> otpRegistration(Map payload) async {
    otpRegistrationLoading(true);
    otpMobileEntered.value = payload["mobile"];
    enteredNumber.value = payload["mobile"];
    try {
      var response = await apiService.postRequestNotoken(
          //   var response = await apiService.postAuthRequest(
          // https://blood-server-us7o.onrender.com/auth/registor/donor
          endpoint: "auth/verify-otp",
          //"auth/registor/donor",
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "User Does't exist") {
        Get.toNamed(kSignUpScreen);
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else if (data["token"] == null) {
        Fluttertoast.showToast(
          msg: response["message"],
        );
      } else {
        loginsData.value = data;
        await UserSimplePreferences.setLoginStatus(loginStatus: true);

        UserSimplePreferences.setToken(token: data["token"].toString());
        await getProfile();

        profileData["employeeType"] == "Donor"
            ? Get.toNamed(kDonorBottomNavigation)
            : Get.toNamed(kNavigation);
        // print(UserSimplePreferences.getUserdata());
        Fluttertoast.showToast(
          msg: "Login Successfully",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      otpRegistrationLoading(false);
    }
  }

////////////////////////////////
  // Donor registration
  var donorRegistrationLoading = false.obs;
  var donorRegistrationData = {}.obs;
  var donorMobileEntered = "".obs;
  Future<void> donorRegistration(Map payload) async {
    donorRegistrationLoading(true);
    donorMobileEntered.value = payload["mobile"];
    try {
      //
      var response = await apiService.postRequestNotoken(
          endpoint: "auth/donor",
          //"auth/registor/donor",
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "User already exists") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        var payloads = {
          "mobile": donorMobileEntered.value,
          //  "8297297247"
        };

        logins(payloads);
        // logins(payload[""])
        // Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorRegistrationLoading(false);
    }
  }

  //RegistorImageDOnor
  // postRequestDonorSignupFormData
  //   var donorRegistrationLoading = false.obs;
  // var donorRegistrationData = {}.obs;
  // var donorMobileEntered = "".obs;
  Future<void> donorRegistrationwithImage(Map payload, File file) async {
    //vvip
    donorRegistrationLoading(true);
    donorMobileEntered.value = payload["mobile"];
    try {
      //
      var response = await apiService.postRequestDonorSignupFormData(
          endpoint: "auth/donor",
          //"auth/registor/donor",
          payload: payload,
          image: file);
      Map data = jsonDecode(response);
      // Map data = response;
      print(response);
      if (data["message"] == "User already exists") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else if (data["message"] != "Registration Successfully ..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
        var payloads = {
          "mobile": donorMobileEntered.value,
          //  "8297297247"
        };

        logins(payloads);
        // logins(payload[""])
        // Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorRegistrationLoading(false);
    }
  }

  ///SignIn
  ///
  //LoginAPI

  var loginsLoading = false.obs;
  var loginsData = {}.obs;
  var enteredNumber = "".obs;
  var storedloginsData = {}.obs;
  Future<void> logins(Map payload) async {
    loginsLoading(true);
    enteredNumber.value = payload["mobile"];
    try {
      var response = await apiService.postAuthRequest(
          endpoint: "auth/login", payload: payload);

      Map data = jsonDecode(response);
      print(response);
      // "User Does't exist"
      if (data["message"] == "User Does't exist") {
        Get.toNamed(kSignUpScreen);
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else if (data["token"] == null) {
        Fluttertoast.showToast(
          msg: response["message"],
        );
      } else {
        loginsData.value = data;
        await UserSimplePreferences.setLoginStatus(loginStatus: true);

        //await UserSimplePreferences.setUserid(userId: loginsData["_id"]);
        // await UserSimplePreferences.setUserdata(
        //     userData: json.encode(loginsData.value));
        UserSimplePreferences.setToken(token: data["token"].toString());
        await getProfile();
        // apiController.storedloginsData["employeeType"] == "Blood Needed"
        //     ? Get.toNamed(kNavigation)
        //     : Get.toNamed(kDonorBottomNavigation);
        profileData["employeeType"] == "Donor"
            ? Get.toNamed(kDonorBottomNavigation)
            : Get.toNamed(kNavigation);
        // print(UserSimplePreferences.getUserdata());
        Fluttertoast.showToast(
          msg: "Login Successfully",
        );
        //  Get.toNamed(kNavigation);
        // loginsData["employeeType"] == "Blood Needed"
        //     ? Get.toNamed(kNavigation)
        //     : Get.toNamed(kDonorBottomNavigation);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      loginsLoading(false);
    }
  }

  //
  Future<void> loginSignin(Map payload) async {
    loginsLoading(true);

    try {
      var response = await apiService.postAuthRequest(
          endpoint: "auth/login", payload: payload);

      Map data = jsonDecode(response);
      print(response);
      if (data["message"] == "User Does't exist") {
        Get.toNamed(kSignUpScreen);
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else if (data["token"] == null) {
        Fluttertoast.showToast(
          msg: response["message"],
        );
      } else {
        loginsData.value = data;
        await UserSimplePreferences.setLoginStatus(loginStatus: true);

        //await UserSimplePreferences.setUserid(userId: loginsData["_id"]);
        // await UserSimplePreferences.setUserdata(
        //     userData: json.encode(loginsData.value));
        UserSimplePreferences.setToken(token: data["token"].toString());
        await getProfile();
        // apiController.storedloginsData["employeeType"] == "Blood Needed"
        //     ? Get.toNamed(kNavigation)
        //     : Get.toNamed(kDonorBottomNavigation);
        profileData["employeeType"] == "Donor"
            ? Get.toNamed(kDonorBottomNavigation)
            : Get.toNamed(kNavigation);
        // print(UserSimplePreferences.getUserdata());
        Fluttertoast.showToast(
          msg: "Login Successfully",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      loginsLoading(false);
    }
  }

/////
  Future<void> otplogins(Map payload) async {
    loginsLoading(true);
    try {
      var response = await apiService.postAuthRequest(
          endpoint: "auth/login/", payload: payload);

      Map data = jsonDecode(response);
      print(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: response["message"],
        );
      } else {
        loginsData.value = data;
        await UserSimplePreferences.setLoginStatus(loginStatus: true);
        //await UserSimplePreferences.setUserid(userId: loginsData["_id"]);
        await UserSimplePreferences.setUserdata(
            userData: json.encode(loginsData.value));
        // print(UserSimplePreferences.getUserdata());
        Fluttertoast.showToast(
          msg: "Login Successfully",
        );
        loginsData["employeeType"] == "Blood Needed"
            ? Get.toNamed(kNavigation)
            : Get.toNamed(kDonorBottomNavigation);
      }
    } catch (e) {
      Get.toNamed(kSignUpScreen);
      Fluttertoast.showToast(
        msg: "Account Not Created",
      );
    } finally {
      loginsLoading(false);
    }
  }

////////
// Blood donors list
  var newChatpartner = "".obs;
  var newChatpartnerBg = "".obs;
  var donorsData = [].obs;
  var donorView = {}.obs;
  var donorsDatafilter = [].obs;
  var donorsDataCopy = [].obs;
  var OriginaldonorsData = [].obs;
  var reciversData = [].obs;
  var receiverView = {}.obs;
  var bankdonorsData = [].obs;
  var bankView = {}.obs;
  var bankdonorsDatafilter = [].obs;
  var bankdonorsDataCopy = [].obs;
  var OriginalbankdonorsData = [].obs;
  var reciversDataCopy = [].obs;
  var donorsdatas = {}.obs;
  var OriginalassetsData = [].obs;
  // var filteraminityData = [].obs;
//  get profile API
  var profileData = {}.obs;
  var profiledataLoading = false.obs;
  var donorsdataLoading = false.obs;
  Future<void> getProfile() async {
    profiledataLoading(true);
    try {
      var response = await apiService.getRequest(
          //https://new-ram-blood-server.onrender.com
          endpoint: "auth/getUser");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        profileData.value = data;
        switchValues.value = profileData["isAvailable"];
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      profiledataLoading(false);
    }
  }

  ///////////////

  // Get Patients list
  var patientsData = [].obs;
  var patientDatadataLoading = false.obs;
  var listB = <String>[].obs;
  Future<void> getPatients() async {
    patientDatadataLoading(true);
    try {
      var response = await apiService.getRequest(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "patient/get/patinet");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        patientsData.value = data;
        for (var item in patientsData) {
          listB.add(item["bloodGroup"]);
        }
        listB.value = listB.toSet().toList();
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
      // Get.snackbar(
      //   "E-MLA",
      //   "Something Went Wrong!!",
      //   icon: const Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      patientDatadataLoading(false);
    }
  }

  //////////////////
  var bannersData = [].obs;
  var bannerDatadataLoading = false.obs;

  Future<void> getBannersOne() async {
    bannerDatadataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "auth/banners");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        bannersData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      bannerDatadataLoading(false);
    }
  }

  // Banners two
  var bannersTwoData = [].obs;
  var bannerTwoDatadataLoading = false.obs;

  Future<void> getBannersTwo() async {
    bannerTwoDatadataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "auth/bannersTwo");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        bannersTwoData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      bannerTwoDatadataLoading(false);
    }
  }
  //////////////////////////////////////Sockeetio integration

  //// Socket io List
  var socketioData = [].obs;
  var socketioReceiverID = "".obs;
  var socketioChatID = "".obs;
  var socketiodataLoading = false.obs;
  var contains = false.obs;
  Future<void> getSocketiochat(String crosscheckRecID) async {
    socketiodataLoading(true);
    try {
      var response = await apiService.getter(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "chat/own-all-chats");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = response;
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        socketioData.value = data;
        socketioChatID.value = "";
        socketioReceiverID.value = "";
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        for (int i = 0; i < socketioData.length; i++) {
          if (socketioData[i]["members"].contains(crosscheckRecID)) {
            for (int j = 0; j < socketioData[i]["members"].length; j++) {
              if (socketioData[i]["members"][j] != profileData["_id"]) {
                socketioReceiverID.value = socketioData[i]["members"][j];
                socketioChatID.value = socketioData[i]["_id"];
                //socketioData[i]["members"][j];
              }

              print(socketioData[i]["members"][j]);
              print(socketioReceiverID.value);
              print(socketioChatID.value);
            }
          }
        }

        Get.toNamed(kChatScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      socketiodataLoading(false);
    }
  }

  //////////////////Socket Apis
  // 1 Create Chat
  // Method – POST
  // Path  -- rootUrl/chat/
  // Body – {
  // 	receiverId
  // }
  ///////Create Chat///
  var createChatLoading = false.obs;
  var crosscheckReceiverId = "".obs;
  Future<void> socketioCreateChat(Map payload) async {
    createChatLoading(true);
    // finddonorMobileEntered.value = payload["attendeeMobile"];

    try {
      //
      var response = await apiService.postRequestToken(
          //   var response = await apiService.postAuthRequest(

          endpoint: "chat/",
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);

      var data = response;
      print(response);
// Chat already exists
      //  if (response.statusCode == 200 || response.statusCode == 201) {
      if (data == "Chat created" || data == "Chat already exists") {
        Fluttertoast.showToast(
          msg: data,
        );
        crosscheckReceiverId.value = payload["receiverId"];
        getSocketiochat(crosscheckReceiverId.value);
        // Get.toNamed(kChatTestScreen);
        // getProfile();
        // Get.toNamed(kPatientsScreen);
        // Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: "Something went wrong",
        );

        // var payloads = {
        //   "phone": finddonorMobileEntered.value,
        //   //  "8297297247"
        // };

        // logins(payloads);
        //  Get.toNamed(kSignInScreen)
        //   Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      createChatLoading(false);
    }
  }

  // 4. Creating Message//////////////////////
// 3, Creating message
// 	Method – POST
// 	Path – rootUrl/message/
// 	Body – {
// 		chartId,
// 		message
// 	}

  var createMessageLoading = false.obs;

  Future<void> socketioCreateMessaage(Map payload) async {
    createMessageLoading(true);
    // finddonorMobileEntered.value = payload["attendeeMobile"];

    try {
      //
      var response = await apiService.postRequestToken(
          endpoint: "message/",
// https://blood-server-us7o.onrender.com/auth/registor/blood/need/user
          payload: payload);

      Map data = response;
      print(response);
      if (data["message"] != null) {
        // Fluttertoast.showToast(
        //   msg: data["message"],
        // );
        previousChatData.add(data);
        print(previousChatData.value);
        // getProfile();
        // Get.toNamed(kPatientsScreen);
        // Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: "Something went wrong",
        );

        // var payloads = {
        //   "phone": finddonorMobileEntered.value,
        //   //  "8297297247"
        // };

        // logins(payloads);
        //  Get.toNamed(kSignInScreen)
        //   Get.toNamed(kSignInScreen);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      createMessageLoading(false);
    }
  }

  /////////////update on Message received
  void updateMessage(Map data) {
    previousChatData.add(data);
    //  print("Hi");
  }

/////////////////////////////////////////////////

  ///////////////Get own Chat
  // 2, Get Own Chat
  // Method – GET
  // Path – rootUrl/chat/own-all-chats
  // RESPONSE  -- Array of single Object
  ////////////////////////////////////////////////////////////////////
  var ownChatData = [].obs;
  var ownChatdataLoading = false.obs;

  Future<void> socketioGetownChat() async {
    ownChatdataLoading(true);
    try {
      var response = await apiService.getter(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "chat/own-all-chats");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = response;
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        ownChatData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
      // Get.snackbar(
      //   "E-MLA",
      //   "Something Went Wrong!!",
      //   icon: const Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      ownChatdataLoading(false);
    }
  }

  //////////////// FetchPreviousMessages
  // 3, First Fetch previous message
  // Method—GET
  // Path – rootUrl/message/:chartId
  // RESPONSE – ARRAY of Messages
  var previousChatData = [].obs;
  var previousChatdataLoading = false.obs;

  Future<void> socketioGetpreviousChat(String id) async {
    previousChatdataLoading(true);
    try {
      var response = await apiService.getter(
          //https://new-ram-blood-server.onrender.com
          endpoint: "message/${id}");
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = response;
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        previousChatData.value = data;
        print(previousChatData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
      // Get.snackbar(
      //   "E-MLA",
      //   "Something Went Wrong!!",
      //   icon: const Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      previousChatdataLoading(false);
    }
  }

  ////////////////////////

  /////
  /////Get feeds
  var feedsData = [].obs;
  var feedDatadataLoading = false.obs;
  var feedView = {}.obs;
  Future<void> getFeedsData() async {
    feedDatadataLoading(true);
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              "auth/feeds");
      // auth/feeds
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        feedsData.value = data;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
      // Get.snackbar(
      //   "E-MLA",
      //   "Something Went Wrong!!",
      //   icon: const Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    } finally {
      feedDatadataLoading(false);
    }
  }
}
