import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

class BannersTwo extends StatefulWidget {
  const BannersTwo({super.key});

  @override
  State<BannersTwo> createState() => _BannersTwoState();
}

class _BannersTwoState extends State<BannersTwo> {
  int activeIndex = 0;
  final carouselcontroller = CarouselController();
  ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => apiController.bannerTwoDatadataLoading == true
        ? Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.h),
            child: CircularProgressIndicator(
              color: kbloodred,
            ),
          )
        : apiController.bannersTwoData.isEmpty ||
                apiController.bannersTwoData == null
            ? SizedBox()
            : Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: carouselcontroller,
                    itemCount: apiController.bannersTwoData.length,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        onTap: _launchURL,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            width: double.infinity,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Obx(
                                  () => PrecachedNetworkImage(
                                    url: kBaseImageUrl +
                                        apiController.bannersTwoData[index]
                                            ["image"],

                                    height: 90.h,
                                    width: 280.w,
                                    precache:
                                        true, // default is false, true for next time loading from memory in advance.
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => SizedBox(
                                      height: 80.h,
                                      width: 50.w,
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
                                        SizedBox(
                                      height: 80.h,
                                      width: 50.w,
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
                                  ),
                                )
                                // Image.asset(
                                //   "assets/images/blood_banner.jpg",
                                //   fit: BoxFit.cover,
                                // )
                                )),
                      );
                    },
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        height: 90.h,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 1,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index)),
                  ),
                  // Positioned(bottom: 10, left: 100.w, child: buildIndicator()),

                  Positioned(
                      left: 0.w,
                      right: 0.w,
                      bottom: 10.h,
                      child: Center(child: buildIndicator())),
                ],
              ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
            dotWidth: 6,
            dotColor: kbloodred.withOpacity(0.8),
            dotHeight: 6,
            activeDotColor: kbloodred),
        activeIndex: activeIndex,
        count: apiController.bannersTwoData.length,
      );

  void animateToSlide(int index) => carouselcontroller.animateToPage(index);

  _launchURL() async {
    final Uri url = Uri.parse('https://bloodbank.nuhvin.com/registor');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
