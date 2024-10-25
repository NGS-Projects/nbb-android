import 'dart:convert';
import 'dart:io';

import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class FriendsApiController extends GetxController {
  final apiService = Get.put(ApiService());
  var slectedCategory = "".obs;
  var slectedBloodgroup = "".obs;
  var slectedState = "".obs;
  var slectedDistrict = "".obs;
  var slectedCity = "".obs;
  var selecedIndex = 1000000000000000000.obs;
  var selecedStateIndex = 1000000000000000000.obs;
  var selecedDistrictIndex = 1000000000000000000.obs;
  var selecedCityIndex = 1000000000000000000.obs;
  TextEditingController reportController = TextEditingController();
  var BloodGroup = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
    "A1+",
    "A1-",
    "A2+",
    "A2-",
    "A1B+",
    "A1B-",
    "A2B+",
    "A2B-",
    "Bombay Blood Group"
  ];
  var states = [
    "Andhra Pradesh",
    "Telangana",
  ];

  var districts = [
    {
      "name": "Anantapur",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Chittor",
      "state": "Andhra Pradesh",
    },
    {
      "name": "East Godavari",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Guntur",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Kadapa",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Krishna",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Kurnool",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Nellore",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Prakasam",
      "state": "Andhra Pradesh",
    },
    // {
    //   "name": "Prakasam",
    //   "state": "Andhra Pradesh",
    // },
    {
      "name": "Srikakulam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Vishakapatnam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Vizianagaram",
      "state": "Andhra Pradesh",
    },
    {
      "name": "West Godavari",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Adilabad",
      "state": "Telangana",
    },
    {
      "name": "Hyderabad",
      "state": "Telangana",
    },
    {
      "name": "Karimnagar",
      "state": "Telangana",
    },
    {
      "name": "Khammam",
      "state": "Telangana",
    },
    {
      "name": "Medak",
      "state": "Telangana",
    },
    {
      "name": "Mehboobnagar",
      "state": "Telangana",
    },
    {
      "name": "Nalgonda",
      "state": "Telangana",
    },
    {
      "name": "nizamabad",
      "state": "Telangana",
    },
    {
      "name": "Rangareddy",
      "state": "Telangana",
    },
    {
      "name": "Warangal",
      "state": "Telangana",
    },
    // "Andhra Pradesh",
    // "Telangana",
  ];

  var cities = [
    {
      "name": "Vijayawada",
      "district": "Krishna",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Machilipatnam",
      "district": "Krishna",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Nuzvid",
      "district": "Krishna",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Gudivada",
      "district": "Krishna",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Kakinada",
      "district": "East Godavari",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Rajahmundry",
      "district": "East Godavari",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Anakapalli",
      "district": "Vishakapatnam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Gajuwaka",
      "district": "Vishakapatnam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Narasaraopet",
      "district": "Guntur",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Amaravathi",
      "district": "Guntur",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Ongole",
      "district": "Prakasam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Chirala",
      "district": "Prakasam",
      "state": "Andhra Pradesh",
    },
    {
      "name": "Gachibowli",
      "district": "Hyderabad",
      "state": "Telangana",
    },
    // {
    //   "name": "Gachibowli",
    //   "district": "Hyderabad",
    //   "state": "Telangana",
    // },
    {
      "name": "Secunderabad",
      "district": "Hyderabad",
      "state": "Telangana",
    },
    {
      "name": "Medchal",
      "district": "Rangareddy",
      "state": "Telangana",
    },
    {
      "name": "Vikarabad",
      "district": "Rangareddy",
      "state": "Telangana",
    }
  ];
  // Get frindes donors
  var fDonorsData = [].obs;
  var selectedfDonorsIndex = 1000000000000000000.obs;
  var fDonorsDataLoading = false.obs;

  Future<void> getfdonorsList() async {
    fDonorsDataLoading(true);
    fDonorsData.value = [];
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              // "blog/news"
              "donor/${slectedBloodgroup.value}/${slectedState.value}/${slectedDistrict.value}/${slectedCity.value}");
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
        fDonorsData.value = data["donors"];
        if (fDonorsData.isEmpty) {
          Fluttertoast.showToast(
            msg: "No Records found!",
          );
        } else {
          Get.toNamed(KFriendsDonors);
        }

        print(fDonorsData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      fDonorsDataLoading(false);
    }
  }

  //sigup
  var donorRegistrationLoading = false.obs;
  var donorRegistrationData = {}.obs;
  var donorMobileEntered = "".obs;
  Future<void> friendRegistration(Map payload) async {
    donorRegistrationLoading(true);

    try {
      //
      var response = await apiService.postRequestNotoken(
          endpoint: "register",
          //"auth/registor/donor",
          payload: payload);

      var data = response;
      print(response);
      if (data["message"] == "Registration Successfully ..!") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      donorRegistrationLoading(false);
    }
  }

  // signin
  //  var mobileRegistrationLoading = false.obs;
  // var mobileRegistrationData = {}.obs;
  // var mobileMobileEntered = "".obs;
  var mobileSigninLoading = false.obs;
  Future<void> mobileRegistration(Map payload) async {
    mobileSigninLoading(true);

    try {
      var response = await apiService.postRequestNotoken(
          endpoint: "login", payload: payload);

      Map data = response;
      print(response);
      if (data["token"] != null) {
        await UserSimplePreferences.setLoginStatus(loginStatus: true);

        await UserSimplePreferences.setToken(
            token: payload["mobile"].toString());
        Fluttertoast.showToast(
          msg: "Successful",
        );
        Get.back();
        // profilecontroller.getEAProfile();
        // Get.toNamed(kDashboard);
        print("object");
        // Get.toNamed(KOtpVerification, arguments: mobileMobileEntered.value);
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
      mobileSigninLoading(false);
    }
  }

  // forgot password
  var forgotLoading = false.obs;
  Future<void> forgotPassword(Map payload) async {
    forgotLoading(true);

    try {
      var response = await apiService.patchRequestNoTken(
          endpoint: "forgot-password", payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "Password Reset Successfully..!") {
        // await UserSimplePreferences.setLoginStatus(loginStatus: true);

        // await UserSimplePreferences.setToken(token: data["token"].toString());
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.back();
        // profilecontroller.getEAProfile();
        // Get.toNamed(kDashboard);
        print("object");
        // Get.toNamed(KOtpVerification, arguments: mobileMobileEntered.value);
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
      forgotLoading(false);
    }
  }

  // forgot password
  var reportLoading = false.obs;
  Future<void> reportIssue(Map payload, String id) async {
    reportLoading(true);

    try {
      var response = await apiService.patchRequestNoTken(
          endpoint: "donor-report/${id}", payload: payload);

      Map data = response;
      print(response);
      if (data["message"] == "Report Updated Successfully..!") {
        // await UserSimplePreferences.setLoginStatus(loginStatus: true);

        // await UserSimplePreferences.setToken(token: data["token"].toString());
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.back();
        // profilecontroller.getEAProfile();
        // Get.toNamed(kDashboard);
        print("object");
        // Get.toNamed(KOtpVerification, arguments: mobileMobileEntered.value);
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
      reportLoading(false);
    }
  }

  // get profile
  var fprofileData = {}.obs;
  var fprofiledataLoading = false.obs;

  TextEditingController EAEditMobileontroller = TextEditingController();
  TextEditingController EAeditaddressController = TextEditingController();
  TextEditingController EAeditaboutController = TextEditingController();

  Future<void> getFriendprofile() async {
    fprofiledataLoading(true);
    try {
      var response = await apiService.getRequestNoTOKEn(
          //https://new-ram-blood-server.onrender.com
          endpoint: "profile/${UserSimplePreferences.getToken()}"
          //"auth/getuser/${storedloginsData["_id"]}"
          // apiController.storedloginsData["firstName"]
          //  "auth/getuser/6645df08c8658740e78b9ecf"
          // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10/A+"
          );
      // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      Map data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        fprofileData.value = data;
        print(fprofileData.value);
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
      fprofiledataLoading(false);
    }
  }

  // edit profile
  var feditLoading = false.obs;

  Future<void> feditProfileForm(Map payload) async {
    feditLoading(true);

    try {
      //
      var response = await apiService.patchRequestNoTken(
          endpoint: "edit-profile/${UserSimplePreferences.getToken()}",
          //"auth/registor/donor",
          payload: payload);

      var data = response;
      print(response);
      if (data["message"] == "Profile Edited Successfully..") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      feditLoading(false);
    }
  }

  // Add donation History
  var adddonationLoading = false.obs;

  Future<void> addDonationRecord(Map payload) async {
    adddonationLoading(true);

    try {
      //
      var response = await apiService.postRequestNotoken(
          endpoint: "last-donation/${UserSimplePreferences.getToken()}",
          //"auth/registor/donor",
          payload: payload);

      var data = response;
      print(response);
      if (data["message"] == "Last Donation Logged Successfully..") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        Get.toNamed(
          KFDonationsHistory,
        );
        // Get.back();
      } else {
        // loginData.value = data;

        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      adddonationLoading(false);
    }
  }

  // Donations history
  var fHistoryData = [].obs;
  var fHistoryMapData = {}.obs;
  // var selectedfDonorsIndex = 1000000000000000000.obs;
  var fHistoryLoading = false.obs;

  Future<void> getfHistoryList() async {
    fHistoryLoading(true);
    // fDonorsData.value = [];
    try {
      var response = await apiService.getRequestNoToken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              // "blog/news"
              "donation-list/${UserSimplePreferences.getToken()}"); // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = jsonDecode(response);
      if (data == null) {
        Fluttertoast.showToast(
          msg: "Something went wrong",
        );
      } else {
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        fHistoryData.value = data;
        // if (fDonorsData.isEmpty) {
        //   Fluttertoast.showToast(
        //     msg: "No Records found!",
        //   );
        // } else {
        //   Get.toNamed(KFriendsDonors);
        // }

        print(fHistoryData.value);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      fHistoryLoading(false);
    }
  }

  // var selectedfDonorsIndex = 1000000000000000000.obs;
  var deleteAccountLoading = false.obs;

  Future<void> deleteAccountList() async {
    deleteAccountLoading(true);
    // fDonorsData.value = [];
    try {
      var response = await apiService.deleteRequestNoTOken(
          //https://new-ram-blood-server.onrender.com
          endpoint:
              //   https://new-ram-blood-server.onrender.com/patient/get/patinet
              // "blog/news"
              "account-deleted/${UserSimplePreferences.getToken()}"); // "blood/needed/find/donor/longitude/78.4089828/latitude/17.4851206/distance/10");
      var data = response;
      if (data["message"] == "Account Deleted Successfully..") {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        UserSimplePreferences.clearAllData();
        Get.toNamed(KFriendsSignup);
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
        // Fluttertoast.showToast(
        //   msg: "Successful",
        // );
        // fHistoryData.value = data;
        // if (fDonorsData.isEmpty) {
        //   Fluttertoast.showToast(
        //     msg: "No Records found!",
        //   );
        // } else {
        //   Get.toNamed(KFriendsDonors);
        // }

        print("fHistoryData.value");
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong",
      );
    } finally {
      deleteAccountLoading(false);
    }
  }
}
