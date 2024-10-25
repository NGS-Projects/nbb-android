import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class BlogsList extends StatefulWidget {
  const BlogsList({super.key});

  @override
  State<BlogsList> createState() => _BlogsListState();
}

class _BlogsListState extends State<BlogsList> {
  String? selectedValue;
  final List<String> bloodgroupss = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
    'RH+',
    'RH-'
  ];
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'ngsbusinessorg@gmail.com',
    // queryParameters: {
    //   'subject': 'HI',
    //   'body': 'Hello',
    // },
  );

  // String url = params.toString();

  ApiController apiController = Get.put(ApiController());
  @override
  void initState() {
    apiController.getBlogsList();

    ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Blogs Lists",
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => apiController.blogsDatadataLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : apiController.blogsData.isEmpty || apiController.blogsData == null
                ? Text(
                    "No Blogs",
                    style: GoogleFonts.roboto(
                        fontSize: kSixteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  )
                : Container(
                    margin: EdgeInsets.all(15.w),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: apiController.blogsData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                apiController.blogViewData.value =
                                    apiController.blogsData[index];
                              });
                              Get.toNamed(kBlogView);
                            },
                            child: Container(
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  apiController.blogsData[index]["image"] ==
                                          null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: Image.asset(
                                            "assets/images/no_blogs.jpg",
                                            // height: 150.h,
                                            height: 120.h,
                                            width: 100.w,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: CachedNetworkImage(
                                            imageUrl: kBaseImageUrl +
                                                apiController.blogsData[index]
                                                    ["image"],
                                            // apiController
                                            //     .profileData["profile"],
                                            placeholder: (context, url) =>
                                                SizedBox(
                                              height: 120.h,
                                              width: 60.w,
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.black12,
                                                highlightColor: Colors.white
                                                    .withOpacity(0.5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        Kwhite.withOpacity(0.5),
                                                  ),
                                                  height: 60.h,
                                                  width: 60.w,
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.asset(
                                                "assets/images/no_blogs.jpg",
                                                // height: 150.h,
                                                height: 120.h,
                                                width: 100.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            height: 120.h,
                                            width: 100.w,
                                            //   fit: BoxFit.cover,
                                            fit: BoxFit.cover,
                                          ),
                                          // Image.asset(
                                          //   "assets/images/profileImageStatic.png",
                                          //   // height: 150.h,
                                          //   height: 100.h,
                                          //   width: 100.w,
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  // Image.asset(
                                  //   "assets/images/blooddrop.png",
                                  //   height: 60.h,
                                  // ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                          apiController.blogsData[index]
                                                      ["title"]
                                                  .toString()
                                                  .capitalizeFirst! ??
                                              "No name",

                                          // "Mehar",
                                          style: GoogleFonts.roboto(
                                              letterSpacing: 0.1,
                                              fontSize: 15.sp,
                                              color: KdarkText,
                                              fontWeight: kFW500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              apiController.blogsData[index]
                                                      ["place"] ??
                                                  // .toString()
                                                  // .capitalizeFirst! ??
                                                  "No Location",

                                              // "Mehar",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 11.sp,
                                                  color: Ktextcolor,
                                                  fontWeight: kFW500),
                                            ),
                                            apiController.blogsData[index]
                                                        ["date"] ==
                                                    null
                                                ? Text(
                                                    "No date",

                                                    // "Mehar",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 11.sp,
                                                        color: Ktextcolor,
                                                        fontWeight: kFW500),
                                                  )
                                                : Text(
                                                    // apiController.blogsData[index]
                                                    //         ["date"] ??

                                                    //     "No date",
                                                    DateFormat.yMMMd().format(
                                                        DateTime.parse(
                                                            apiController
                                                                    .blogsData[
                                                                index]["date"])),
                                                    // "Mehar",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 11.sp,
                                                        color: Ktextcolor,
                                                        fontWeight: kFW500),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
      )),
    );
  }
}
