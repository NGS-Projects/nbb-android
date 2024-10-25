// ignore_for_file: camel_case_types

import 'package:nuhvinbloodbank/untils/export_file.dart';

class No_Internet extends StatefulWidget {
  const No_Internet({super.key});

  @override
  State<No_Internet> createState() => _No_InternetState();
}

class _No_InternetState extends State<No_Internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/no_internet_image.png",
              ),
              SizedBox(
                height: 30.h,
              ),
              Text("No Internet  Connection",
                  style: GoogleFonts.roboto(
                      color: KdarkText, fontSize: 24.sp, fontWeight: kFW700)),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                    "No Internet Connection found, Check your Connection.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: KText, fontSize: 11.sp, fontWeight: kFW500)),
              ),
            ],
          ),
          CustomButton(
              margin: const EdgeInsets.all(15),
              height: 38.h,
              width: double.infinity,
              textColor: Kwhite,
              borderRadius: BorderRadius.circular(20.r),
              Color: kbloodred,
              fontSize: 13.sp,
              fontWeight: kFW600,
              label: "Try Again",
              isLoading: false,
              onTap: () {
                //performAction();
                // Get.offAll(Bottom_navigation());
                //   Get.offAll(KBottom_navigation);
              }),
        ],
      ),
    );
  }
}
