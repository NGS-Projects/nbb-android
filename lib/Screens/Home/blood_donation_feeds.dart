import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  ApiController apiController = Get.put(ApiController());
  List Feeds = [
    {
      "title": "JUNE 14 - WORLD BLOOD DONATION DAY",
      "subtitle":
          "World Blood Donor Day is held on June 14 each year. The event was organised for the first time in 2004, by four core international organizations: the World Health Organization,",
      "image": "assets/images/feeds1.jpg",
    },
    {
      "title": "Benefits of Donating Blood:",
      "subtitle":
          "reduce stress ,improve your emotional well-being ,help get rid of negative feelings",
      "image": "assets/images/feeds2.jpg",
    },
    {
      "title": "Donating blood is healthy as",
      "subtitle":
          "Donating blood is healthy as it allows your body to renew the blood within a few weeks",
      "image": "assets/images/feeds3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Obx(() => apiController.feedDatadataLoading == true
        ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100.h),
            child: CircularProgressIndicator(
              color: kbloodred,
            ),
          )
        : apiController.feedsData.isEmpty || apiController.feedsData == null
            ? SizedBox()
            : SizedBox(
                height: orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height / 2.3
                    : MediaQuery.of(context).size.height / 0.7,
                child: ListView.builder(
                    itemCount: apiController.feedsData.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            apiController.feedView.value =
                                apiController.feedsData[index];
                          });
                          Get.toNamed(kFeedView);
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                right: 15.w, left: 2.w, top: 2.h, bottom: 2.h),
                            width: MediaQuery.of(context).size.width / 1.5,
                            //
                            decoration: BoxDecoration(
                              color: Kwhite,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1.5,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                  color: Ktextcolor.withOpacity(0.25),
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.r),
                                      topRight: Radius.circular(15.r)),
                                  child: Obx(() => PrecachedNetworkImage(
                                        url: kBaseImageUrl +
                                            apiController.feedsData[index]
                                                ["image"],

                                        height: 150.h,
                                        width: 290.w,
                                        precache: true,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => SizedBox(
                                          height: 80.h,
                                          width: 290.w,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.black12,
                                            highlightColor:
                                                Colors.white.withOpacity(0.5),
                                            child: Container(
                                              height: 80.h,
                                              color: Kwhite.withOpacity(0.5),
                                            ),
                                          ),
                                        ),

                                        // placeholder: (context, url) => const Icon(Icons.person),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          "assets/images/no_images.png",
                                          height: 150.h,
                                          // "assets/images/blood_banner.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          apiController.feedsData[index]
                                                      ["title"]
                                                  .toString()
                                                  .capitalizeFirst
                                              // Feeds[index]["title"]

                                              ??
                                              "No title",
                                          //    "Please enter your Email and Password to login into your accountbkljns;aknw;",
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              fontSize: 17.sp,
                                              color: KdarkText,
                                              fontWeight: kFW600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          apiController.feedsData[index]
                                                  ["content"]
                                              //  Feeds[index]["subtitle"]
                                              ??
                                              "No Content",
                                          //  "Please enter your Email and Password to login into your accountbkljns;aknw;n;cdbkaj; j k;jknjmkjnkjnlknk;klm;klmjknjknnknjknknk nk ",
                                          maxLines: 5,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              fontSize: kTwelveFont,
                                              color: KdarkText.withOpacity(0.5),
                                              fontWeight: kFW600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
              ));
  }
}
