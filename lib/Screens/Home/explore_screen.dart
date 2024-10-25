import 'package:nuhvinbloodbank/untils/export_file.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Explore",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "What is BLOOD?",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Text(
                                "Blood donation is an important and altruistic gesture that can save a patient's life. Donors help to maintain a consistent and healthy blood supply, which is necessary for a variety of medical operations such as surgeries, cancer and chronic illness treatments, and emergency care. Individuals who donate blood play an important role in saving lives and supporting the health and well-being of those in their communities.",
                                //  "Approved Annual Leaves",
                                style: TextStyle(
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500,
                                  color: Kwhite,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "Uses of Blood",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Column(
                                children: [
                                  Text(
                                    "The primary use of blood is to sustain life by providing essential functions within the body. These functions include:",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Oxygen Transport: Blood carries oxygen from the lungs to cells throughout the body, ensuring their proper function and metabolism.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Nutrient Delivery: Blood transports nutrients absorbed from the digestive system to cells, providing energy and essential building blocks for growth and repair.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Waste Removal: Blood carries metabolic waste products, such as carbon dioxide and urea, away from cells to be eliminated from the body through the lungs, kidneys, and other organs.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Immune Defense: Blood contains white blood cells and antibodies that defend against pathogens, viruses, and bacteria, helping the body fight infections and diseases.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Temperature Regulation: : Blood helps regulate body temperature by redistributing heat generated by metabolism and adjusting blood flow near the body's surface in response to environmental conditions.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Clotting: Blood contains platelets and clotting factors that form clots to stop bleeding and prevent excessive blood loss after injury.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "Donors with compatible blood groupings",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Advantages:",
                                    textAlign: TextAlign.left,
                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Blood Type O (Universal Donor):",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Advantages:Can donate to individuals with any blood type (A, B, AB, or O), making it invaluable in emergency situations when the recipient's blood type is unknown.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Advantages:Blood type O negative is considered the universal donor for red blood cells, plasma, and platelets, as it lacks A, B, and Rh antigens, reducing the risk of transfusion reactions",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Blood Type AB (Universal Recipient):Advantages:Can receive blood from individuals with any blood type (A, B, AB, or O), making it versatile and reducing the need for specific blood type matches in transfusions.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Advantages:Individuals with blood type AB positive are often in demand for platelet and plasma donations, as their blood type is compatible with many recipients.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Rh-Negative Blood Types: Advantages:Rh-negative individuals can donate blood to both Rh-positive and Rh-negative recipients, increasing the pool of potential donors. Advantages:Rh-negative blood is often used in cases where the recipient's Rh status is unknown or when Rh compatibility is required but not readily available.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Disadvantages: Blood Type O (Universal Donor): Disadvantage:Individuals with blood type O can only receive blood from other type O donors, limiting their options in case of blood transfusions.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Blood Type AB (Universal Recipient):Disdvantage:Blood type AB individuals can only donate to other AB recipients, reducing the availability of compatible donors.Disadvantages:Individuals with blood type AB may be at a higher risk of sensitization to foreign antigens due to exposure to a wide range of blood types. Rh-Negative Blood Types:Rh-negative individuals can only receive Rh-negative blood, which may be less readily available compared to Rh-positive blood. Rh-negative blood is relatively rare compared to Rh-positive blood, which can pose challenges in emergency situations or when specific Rh-negative blood types are required.",

                                    //  "Approved Annual Leaves",
                                    style: TextStyle(
                                      fontSize: kTwelveFont,
                                      fontWeight: kFW500,
                                      color: Kwhite,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "Who can donate?",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Text(
                                "Age: Typically 17 years old or older (16 with parental consent).\n"
                                "Weight: Generally meeting minimum weight requirements, usually around 50 kgs.\n"
                                "Height: Not typically a specific requirement.\n"
                                "Health: Recent travel to certain regions may affect eligibility.\n"
                                "Travel History: Recent travel to certain regions may affect eligibility.\n"
                                "Medication: Some medication may disqualify donors or require temporary deferral.\n"
                                "Medical History: Past or present medical conditions may affect eligibility.\n"
                                "Lifestyle Factors: High-risk behaviors or recent procedures like tattoos may impact donation eligibility.",
                                //  "Approved Annual Leaves",
                                style: TextStyle(
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500,
                                  color: Kwhite,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "Who can't donate?",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Text(
                                "Age: Typically individuals under 17 years old (or 16 without parental consent).\n"
                                "Weight: Not meeting minimum weight requirements, usually around 50 kgs.\n"
                                "Height: Not typically a specific factor for disqualification.\n"
                                "Health: Recent travel to certain high-risk regions may disqualify donors.\n"
                                "Travel History: Recent travel to certain regions may affect eligibility.\n"
                                "Medication: Some medications can disqualify donors or require temporary deferral.\n"
                                "Medical History: Past or present medical conditions such as bloodborne diseases may disqualify donors.\n"
                                "Lifestyle Factors: High-risk behaviors like intravenous drug use or recent tattoos may prevent donation.",
                                style: TextStyle(
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500,
                                  color: Kwhite,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        )))),
            SizedBox(
              height: 20.h,
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(13.r)),
                child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r)),
                    color: KRed.withOpacity(0.5),
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            "What is blood donation?",

                            // leavesController.myLeaveBalance["anual_eaves"]
                            //         ["anual_applied"]
                            //     .toString(),
                            style: GoogleFonts.roboto(
                                fontSize: kEighteenFont,
                                color: Kwhite,
                                fontWeight: kFW500),
                          ),
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              margin: EdgeInsets.all(8.r),
                              child: Text(
                                "Blood donation is a voluntary act where an individual gives blood to be used for medical purposes. It involves collecting blood through a needle from a.\n"
                                "donor's vein, typically in the arm. This blood is then processed and used for transfusions, medical treatments, or research.",
                                style: TextStyle(
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500,
                                  color: Kwhite,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        )))),
          ],
        ),
      ),
    );
  }
}
