import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FSignIn extends StatefulWidget {
  const FSignIn({super.key});

  @override
  State<FSignIn> createState() => _FSignInState();
}

class _FSignInState extends State<FSignIn> {
  FriendsApiController fapiController = Get.put(FriendsApiController());
  ApiController authentication = Get.put(ApiController());
  final _formKey = GlobalKey<FormState>();
  String selectedgender = "";
  // location

  int activeIndex = 0;

  bool value = false;
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  // GoogleMapController? _controller;

  double lat = 37.42796133580664;
  double lon = -122.085749655962;

  String? _currentAddress;
  String? _currentAddresspincode;
  String? _destination;

  var isLoading = "none";

  var sourceLocation = "Your Location".obs;

  /////////////////////////////

  //
  final List<String> Genders = [
    'Male',
    'Female',
    'Others',
  ];

  String? selectedValue;
  String? selectedGenderValue;
  DateTime selectedDate = DateTime.now();
  DateTime choosenDate = DateTime.now();
  var selectDate = "Select Date".obs;

  bool passwordVisible = true;
  bool confirmpasswordVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 20.w, right: 20.w, bottom: 20.h, top: 18.h),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios,
                          size: 25.w, color: KdarkText),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Sign In",
                      style: GoogleFonts.roboto(
                          fontSize: 30.sp,
                          color: kbloodred,
                          fontWeight: kFW600),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    // SizedBox(

                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Enter your Credentials to Login into your account",
                          style: GoogleFonts.roboto(
                              fontSize: kSixteenFont,
                              color: KText,
                              fontWeight: kFW400),
                        ),

                        ///////////

                        SizedBox(
                          height: 20.h,
                        ),
                        CustomFormFields(
                          controller: authentication.mobileSigninController,
                          ontap: () {
                            //  Get.toNamed(kSearchPlaces);
                          },
                          keyboardType: TextInputType.phone,
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
                          label: 'Mobile Number',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Mobile Number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Password",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              //  letterSpacing: 1,
                              color: KTextgery,
                              fontSize: kFourteenFont,
                              fontWeight: FontWeight.w500,
                            ),
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
                          child: TextFormField(
                            controller: authentication.passwordSigninController,
                            // controller: EASigninEMPIDController,
                            onTap: () {},
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: kFW500,
                                color: kblack),
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            obscuringCharacter: '●',
                            // style: TextStyle(fontSize: 20),
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              focusColor: Kwhite,
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              // const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.r),
                              ),
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
                              fillColor: Kwhite,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),

                              hintText: "Enter Password",
                              alignLabelWithHint: true,
                              //make hint text
                              hintStyle: GoogleFonts.roboto(
                                color: KTextgery.withOpacity(0.5),
                                fontSize: 14.sp,
                                fontWeight: kFW500,
                              ),
                            ),
                            // decoration: InputDecoration(
                            //   focusColor: Colors.white,

                            //   contentPadding: const EdgeInsets.only(
                            //       left: 20.0, bottom: 6.0, top: 8.0),

                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(20.r),
                            //   ),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //         color: Ktextcolor, width: 0.5),
                            //     borderRadius: BorderRadius.circular(30.r),
                            //   ),
                            //   errorBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //         color: Ktextcolor, width: 0.5),
                            //     borderRadius: BorderRadius.circular(30.r),
                            //   ),
                            //   disabledBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //         color: Ktextcolor, width: 0.5),
                            //     borderRadius: BorderRadius.circular(30.r),
                            //   ),
                            //   focusedErrorBorder: OutlineInputBorder(
                            //     borderSide:
                            //         const BorderSide(color: Ktextcolor, width: 1),
                            //     borderRadius: BorderRadius.circular(30.r),
                            //   ),
                            //   focusedBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //         color: Ktextcolor, width: 0.5),
                            //     borderRadius: BorderRadius.circular(30.r),
                            //   ),
                            //   fillColor: Colors.grey,

                            //   hintText: "**************",

                            //   //make hint text
                            //   hintStyle: TextStyle(
                            //     color: selectedTheme == "Lighttheme"
                            //         ? Klightgray.withOpacity(0.5)
                            //         : Kwhite,
                            //     fontSize: kTwelveFont,
                            //     fontWeight: FontWeight.w700,
                            //   ),

                            //   suffixIcon: IconButton(
                            //     icon: Icon(
                            //       passwordVisible
                            //           ? Icons.visibility
                            //           : Icons.visibility_off,
                            //       size: 20.sp,
                            //     ),
                            //     onPressed: () {
                            //       setState(
                            //         () {
                            //           passwordVisible = !passwordVisible;
                            //         },
                            //       );
                            //     },
                            //   ),

                            //   //create lable
                            //   labelText: 'Password',
                            //   //lable style
                            //   labelStyle: TextStyle(
                            //     color: selectedTheme == "Lighttheme"
                            //         ? Klightgray
                            //         : Kwhite,
                            //     fontSize: kTwelveFont,
                            //     fontWeight: FontWeight.w800,
                            //   ),
                            // ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            onChanged: (String value) {},
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(KFriendsForgot);
                            },
                            child: Text(
                              "Forgot password ?",
                              style: GoogleFonts.roboto(
                                color: KText,
                                fontSize: 14.sp,
                                fontWeight: kFW500,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => fapiController.mobileSigninLoading == true
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
                                  label: "Sign In",
                                  fontSize: kSixteenFont,
                                  fontWeight: kFW500,
                                  isLoading: false,
                                  onTap: () {
                                    var payload = {
                                      "mobile": authentication
                                          .mobileSigninController.text,
                                      "password": authentication
                                          .passwordSigninController.text
                                    };

                                    if (_formKey.currentState!.validate()) {
                                      fapiController
                                          .mobileRegistration(payload);
                                    }
                                  }),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(KFriendsSignup);
                            },
                            child: RichText(
                              textScaleFactor: 1,
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: "Don't Have an accout ",
                                style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500,
                                  color: KText,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Sign Up",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        color: KText,
                                        fontWeight: kFW600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45.h,
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
