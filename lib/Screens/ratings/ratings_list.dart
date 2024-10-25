import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsList extends StatefulWidget {
  const RatingsList({super.key});

  @override
  State<RatingsList> createState() => _RatingsListState();
}

class _RatingsListState extends State<RatingsList> {
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
    apiController.getReviewsList();

    ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Reviews Lists",
        trailing: InkWell(
          onTap: () {
            Get.toNamed(kAddRating);
          },
          child: Text(
            "Add Review >      ",
            style: GoogleFonts.roboto(
                fontSize: kFourteenFont, color: KdarkText, fontWeight: kFW500),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => apiController.reviewsdataLoading == true
            ? Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 100.h),
                child: CircularProgressIndicator(
                  color: kbloodred,
                ),
              )
            : apiController.reviewsData.isEmpty ||
                    apiController.reviewsData == null
                ? Text(
                    "No ratings",
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
                        itemCount: apiController.reviewsData.length,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  apiController.reviewsData[index]["name"]
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
                                SizedBox(
                                  height: 8.h,
                                ),
                                apiController.reviewsData[index]["rating"] ==
                                        null
                                    ? SizedBox()
                                    : Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: StarRatingss(
                                            ratingText: apiController
                                                .reviewsData[index]["rating"]),
                                      ),
                                // StarRatings(
                                //   rating: double.parse(apiController
                                //
                                //  .reviewsData[index]["rating"]),
                                // ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  apiController.reviewsData[index]["text"]
                                          .toString()
                                          .capitalizeFirst! ??
                                      "",

                                  // "Mehar",
                                  style: GoogleFonts.roboto(
                                      fontSize: kTwelveFont,
                                      color: KlightText,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
      )),
    );
  }
}

class StarRatingss extends StatelessWidget {
  final String ratingText;

  StarRatingss({required this.ratingText});

  @override
  Widget build(BuildContext context) {
    // Convert the rating text to a double
    double rating = double.parse(ratingText);

    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 30,
      direction: Axis.horizontal,
    );
  }
}
