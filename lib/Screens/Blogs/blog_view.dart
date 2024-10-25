import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                apiController.blogViewData["image"] == null
                    ? Image.asset(
                        "assets/images/no_blogs.jpg",
                        // height: 150.h,
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            kBaseImageUrl + apiController.blogViewData["image"],
                        // apiController
                        //     .profileData["profile"],
                        placeholder: (context, url) => SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Kwhite.withOpacity(0.5),
                              ),
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            "assets/images/no_blogs.jpg",
                            // height: 150.h,
                            height: 120.h,
                            width: 100.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        //   fit: BoxFit.cover,
                        fit: BoxFit.cover,
                      ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        apiController.blogViewData["place"] ??
                            // .toString()
                            // .capitalizeFirst! ??
                            "No Location",

                        // "Mehar",
                        style: GoogleFonts.roboto(
                            fontSize: 11.sp,
                            color: KdarkText,
                            fontWeight: kFW500),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      apiController.blogViewData["date"] == null
                          ? Text(
                              "No date",

                              // "Mehar",
                              style: GoogleFonts.roboto(
                                  fontSize: 11.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            )
                          : Text(
                              // apiController.blogsData[index]
                              //         ["date"] ??

                              //     "No date",
                              DateFormat.yMMMd().format(DateTime.parse(
                                  apiController.blogViewData["date"])),
                              // "Mehar",
                              style: GoogleFonts.roboto(
                                  fontSize: 11.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    apiController.blogViewData["title"]
                            .toString()
                            .capitalizeFirst! ??
                        "No name",

                    // "Mehar",
                    style: GoogleFonts.roboto(
                        letterSpacing: 0.1,
                        fontSize: kSixteenFont,
                        color: KdarkText,
                        fontWeight: kFW500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Text(
                    apiController.blogViewData["content"]
                            .toString()
                            .capitalizeFirst! ??
                        "No name",

                    // "Mehar",
                    style: GoogleFonts.roboto(
                        fontSize: kTwelveFont,
                        color: KTextgery,
                        fontWeight: kFW500),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50.h,
              left: 10.w,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios, size: 30.w, color: KdarkText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
