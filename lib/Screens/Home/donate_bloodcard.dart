import 'package:nuhvinbloodbank/untils/export_file.dart';

class DonatebloodCard extends StatefulWidget {
  const DonatebloodCard({super.key});

  @override
  State<DonatebloodCard> createState() => _DonatebloodCardState();
}

class _DonatebloodCardState extends State<DonatebloodCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Donate",
          style: GoogleFonts.roboto(
              fontSize: kEighteenFont, color: kblack, fontWeight: kFW600),
        ),
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          "assets/images/heart_card.jpg",
          // height: 150.h,
          height: 180.h,
          // width: dou,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Learn About Donation",
          style: GoogleFonts.roboto(
              fontSize: kEighteenFont, color: KRed, fontWeight: kFW600),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "After donating blood the body works to replenish the blood loss. This stimulates the production of new blood cells and in turn, helps in maintaining good health.",
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
          label: "Explore About Donation",
          fontSize: kSixteenFont,
          fontWeight: kFW500,
          isLoading: false,
          onTap: () async {
            Get.toNamed(kAboutUs);
          },
        )
      ],
    );
  }
}
