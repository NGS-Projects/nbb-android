import 'package:nuhvinbloodbank/untils/export_file.dart';

class ExploreCard extends StatefulWidget {
  const ExploreCard({super.key});

  @override
  State<ExploreCard> createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore",
          style: GoogleFonts.roboto(
              fontSize: kEighteenFont, color: kblack, fontWeight: kFW600),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          "assets/images/essentials_image.png",
          // height: 150.h,
          height: 180.h,
          // width: dou,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Blood is Essential for Life",
          style: GoogleFonts.roboto(
              fontSize: kEighteenFont, color: KRed, fontWeight: kFW600),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Life cannot exist without blood. It transports oxygen and nutrients into cells, eliminates waste products, regulates temperature, and protects against infections. Without it, the body cannot operate, emphasizing its crucial relevance for survival.",
          style: GoogleFonts.roboto(
              fontSize: kTwelveFont, color: KTextgery, fontWeight: kFW500),
        ),
        CustomButton(
          margin: EdgeInsets.only(top: 25.h),
          borderRadius: BorderRadius.circular(10.r),
          Color: kbloodred,
          textColor: Kwhite,
          height: 42.h,
          width: double.infinity,
          label: "Explore Now",
          fontSize: kSixteenFont,
          fontWeight: kFW500,
          isLoading: false,
          onTap: () async {
            Get.toNamed(kExploreScreen);
          },
        )
      ],
    );
  }
}
