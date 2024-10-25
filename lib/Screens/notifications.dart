import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'ngsbusinessorg@gmail.com',
    // queryParameters: {
    //   'subject': 'HI',
    //   'body': 'Hello',
    // },
  );

  // String url = params.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        titleSpacing: 0,
        title: Text(
          "Notifications",
          style: GoogleFonts.roboto(
              fontSize: 22.sp, color: KdarkText, fontWeight: kFW600),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.w),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
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
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome to Ram Nayak",
                            style: GoogleFonts.roboto(
                                fontSize: kSixteenFont,
                                color: KdarkText,
                                fontWeight: kFW500),
                          ),
                          Icon(
                            Icons.delete_rounded,
                            color: kbloodred.withOpacity(
                              0.5,
                            ),
                            size: 18.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "3 days ago",
                        style: GoogleFonts.roboto(
                            fontSize: kTwelveFont,
                            color: KlightText,
                            fontWeight: kFW500), // KlightText
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
