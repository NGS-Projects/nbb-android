import 'package:nuhvinbloodbank/untils/export_file.dart';

class CompatableDonors extends StatefulWidget {
  const CompatableDonors({super.key});

  @override
  State<CompatableDonors> createState() => _CompatableDonorsState();
}

class _CompatableDonorsState extends State<CompatableDonors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Compatible Blood Type Donors",
              style: GoogleFonts.roboto(
                  fontSize: kEighteenFont, color: kblack, fontWeight: kFW600),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "Blood Type",
                style: GoogleFonts.roboto(
                    fontSize: kFourteenFont, color: kblack, fontWeight: kFW500),
              ),
            ),
            Container(
              width: 105.w,
              padding: EdgeInsets.only(right: 5.w),
              child: Text(
                "Donate Blood to",
                style: GoogleFonts.roboto(
                    fontSize: kFourteenFont, color: kblack, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "Receive Blood From",
                style: GoogleFonts.roboto(
                    fontSize: kFourteenFont, color: kblack, fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "A+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "A+ AB+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "A+ A- O+ O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "O+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "O+ A+ AB+ AB+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "O+ O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "B+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "B+ AB+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "B+ B- O+ O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "AB+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "AB+",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "Every One",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "A-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "A+ A- AB+ AB-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "A- O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "Every One",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "B-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "B+ B- AB+ AB-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "B- O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105.w,
              child: Text(
                "AB-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont, color: KRed, fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "AB+ AB-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
            SizedBox(
              width: 105.w,
              child: Text(
                "AB+ AB- A- B- O-",
                style: GoogleFonts.roboto(
                    fontSize: kTwelveFont,
                    color: KdarkText,
                    fontWeight: kFW500),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
