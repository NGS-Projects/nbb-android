import 'package:nuhvinbloodbank/untils/export_file.dart';
import 'package:intl/intl.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  apiController.feedView["image"]
                apiController.feedView["image"] == null
                    ? Image.asset(
                        "assets/images/no_blogs.jpg",
                        // height: 150.h,
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl:
                            kBaseImageUrl + apiController.feedView["image"],

                        placeholder: (context, url) => SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          child: Shimmer.fromColors(
                            baseColor: Colors.black12,
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              decoration: BoxDecoration(
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

                Divider(),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    apiController.feedView["title"]
                            .toString()
                            .capitalizeFirst! ??
                        "",
                    textAlign: TextAlign.left,
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
                    apiController.feedView["content"]
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
