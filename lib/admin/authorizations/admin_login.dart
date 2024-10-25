import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
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
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h, top: 70.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: GoogleFonts.roboto(
                    fontSize: 30.sp, color: kbloodred, fontWeight: kFW600),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Please enter your Email and Password to login into your account",
                style: GoogleFonts.roboto(
                    fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
              ),
              SizedBox(
                height: 35.h,
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
                height: 35.h,
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
                child: TextFormField(
                  obscureText: passwordVisible,
                  style: GoogleFonts.roboto(
                      fontSize: 13.sp,
                      fontWeight: kFW500,
                      color: kblack.withOpacity(0.8)),
                  decoration: InputDecoration(
                    focusColor: Kwhite.withOpacity(0.5),
                    filled: true,
                    labelText: "Password",
                    labelStyle: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: kFW600,
                        color: kblack.withOpacity(0.6),
                        letterSpacing: 1),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
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
                    hintText: "**************",
                    alignLabelWithHint: true,
                    hintStyle: GoogleFonts.roboto(
                      color: KTextgery.withOpacity(0.5),
                      fontSize: 12.sp,
                      fontWeight: kFW500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              CustomButton(
                borderRadius: BorderRadius.circular(10.r),
                Color: kbloodred,
                textColor: Kwhite,
                height: 42.h,
                width: double.infinity,
                label: "Sign In",
                fontSize: kSixteenFont,
                fontWeight: kFW500,
                isLoading: false,
                onTap: () async {
                  Fluttertoast.showToast(
                    msg: "Sign In Successfully",
                  );
                  Get.toNamed(kDonorslist);
                },
              ),
              SizedBox(
                height: 70.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
