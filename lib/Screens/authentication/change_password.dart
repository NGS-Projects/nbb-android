import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool passwordVisible = true;
  bool newpasswordVisible = true;
  bool confirmpasswordVisible = true;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  FocusNode _focustwoNode = FocusNode();
  FocusNode _focusthreeNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _showKeyboard(node) {
    FocusScope.of(context).requestFocus(node);
  }

  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  void _handleTapOutside() {
    _hideKeyboard();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapOutside,
      child: Scaffold(
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
            margin: EdgeInsets.only(
                left: 20.w, right: 20.w, bottom: 20.h, top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change Password",
                  style: GoogleFonts.roboto(
                      fontSize: 30.sp, color: kbloodred, fontWeight: kFW600),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "Set Your New password,It must be different from Previously used password",
                  style: GoogleFonts.roboto(
                      fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
                ),
                SizedBox(
                  height: 50.h,
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
                    focusNode: _focusNode,
                    onTap: () {
                      _showKeyboard(_focusNode);
                    },
                    //_showKeyboard(_focusNode),
                    style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: kFW500,
                        color: kblack.withOpacity(0.8)),
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,

                    obscuringCharacter: '●',
                    // style: GoogleFonts.roboto(fontSize: 20),
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      focusColor: Kwhite.withOpacity(0.5),
                      filled: true,
                      labelText: "Old Password",
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: kFW600,
                          color: kblack.withOpacity(0.6),
                          letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
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
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     passwordVisible
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //     size: 20.sp,
                      //   ),
                      //   onPressed: () {
                      //     setState(
                      //       () {
                      //         passwordVisible = !passwordVisible;
                      //       },
                      //     );
                      //   },
                      // ),
                      hintText: "**************",
                      alignLabelWithHint: true,
                      hintStyle: GoogleFonts.roboto(
                        color: KTextgery.withOpacity(0.5),
                        fontSize: 12.sp,
                        fontWeight: kFW500,
                      ),
                    ),

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
                  child: TextFormField(
                    focusNode: _focustwoNode,
                    onTap: () {
                      _showKeyboard(_focustwoNode);
                    },
                    style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: kFW500,
                        color: kblack.withOpacity(0.8)),
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,

                    obscuringCharacter: '●',
                    // style: GoogleFonts.roboto(fontSize: 20),
                    obscureText: newpasswordVisible,
                    decoration: InputDecoration(
                      focusColor: Kwhite.withOpacity(0.5),
                      filled: true,
                      labelText: "New Password",
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: kFW600,
                          color: kblack.withOpacity(0.6),
                          letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
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
                          newpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              newpasswordVisible = !newpasswordVisible;
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

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter New password';
                      } else if (value.length < 5) {
                        return 'This value is too short. It should have 5 characters or more';
                      } else {
                        return null;
                      }
                      //  return null;
                    },
                    onChanged: (String value) {},
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
                  child: TextFormField(
                    focusNode: _focusthreeNode,

                    onTap: () {
                      _showKeyboard(_focusthreeNode);
                    },
                    style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: kFW500,
                        color: kblack.withOpacity(0.8)),
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.start,

                    obscuringCharacter: '●',
                    // style: GoogleFonts.roboto(fontSize: 20),
                    obscureText: confirmpasswordVisible,
                    decoration: InputDecoration(
                      focusColor: Kwhite.withOpacity(0.5),
                      filled: true,
                      labelText: 'Confirm New Password',
                      labelStyle: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: kFW600,
                          color: kblack.withOpacity(0.6),
                          letterSpacing: 1),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
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
                          confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              confirmpasswordVisible = !confirmpasswordVisible;
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

                    validator: (value) {},
                    onChanged: (String value) {},
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(10.r),
                  Color: kbloodred,
                  textColor: Kwhite,
                  height: 42.h,
                  width: double.infinity,
                  label: "Change Password",
                  fontSize: kSixteenFont,
                  fontWeight: kFW500,
                  isLoading: false,
                  onTap: () async {
                    Fluttertoast.showToast(
                      msg: "Password Changed Successfully",
                    );
                    Get.back();
                    // Get.toNamed(kDonorslist);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
