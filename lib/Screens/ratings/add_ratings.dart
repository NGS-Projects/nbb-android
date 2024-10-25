import 'package:nuhvinbloodbank/untils/export_file.dart';

class AddRating extends StatefulWidget {
  const AddRating({super.key});

  @override
  State<AddRating> createState() => _AddRatingState();
}

class _AddRatingState extends State<AddRating> {
  ApiController authentication = Get.put(ApiController());
  int _rating = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kwhite,
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Rating Screen",
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Please Give Rating..",
                style: GoogleFonts.roboto(
                    fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
              ),
              SizedBox(
                height: 130.h,
              ),
              Center(
                child: StarRating(
                  rating: _rating,
                  onRatingChanged: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 120.h,
              ),

              CustomFormFields(
                enabled: true,
                labelColor: KText,
                controller: authentication.rateExperienceController,
                obscureText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                fontSize: kFourteenFont,
                fontWeight: FontWeight.w500,
                hintText: "Enter experience",
                maxLines: 1,
                readOnly: false,
                label: 'Experience',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Experience';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 80.h,
              ),

              Obx(() => authentication.addRatingLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kbloodred,
                      ),
                    )
                  : CustomButton(
                      // margin: EdgeInsets.all(20.r),
                      borderRadius: BorderRadius.circular(10.r),
                      Color: kbloodred,
                      textColor: Kwhite,
                      height: 42.h,
                      width: double.infinity,
                      label: "Submit",
                      fontSize: kSixteenFont,
                      fontWeight: kFW500,
                      isLoading: false,
                      onTap: () {
                        var payload = {
                          "name": authentication.profileData["employeeType"] ==
                                  "Donor"
                              ? authentication.profileData["firstName"]
                                      .toString()
                                      .capitalizeFirst! ??
                                  "No name"
                              : authentication.profileData["bloodBankName"]
                                      .toString()
                                      .capitalizeFirst! ??
                                  "No name",
                          "text": authentication.rateExperienceController.text,
                          "rating": "${_rating}",
                        };
                        authentication.addRating(payload);
                        //   Get.toNamed(kRatingsList);
                        // Get.back();
                      },
                    )),
              SizedBox(
                height: 120.h,
              ),
              ///////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating;
  final int starCount;
  final Function(int) onRatingChanged;

  StarRating({
    required this.rating,
    this.starCount = 5,
    required this.onRatingChanged,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index < rating) {
      icon = Icon(
        Icons.star,
        color: Colors.amber,
        size: 40.sp,
      );
    } else {
      icon = Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 40.sp,
      );
    }
    return InkResponse(
      onTap: () => onRatingChanged(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) => buildStar(context, index)),
    );
  }
}
