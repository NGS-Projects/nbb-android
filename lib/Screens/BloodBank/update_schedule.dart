import 'package:nuhvinbloodbank/untils/export_file.dart';

class UpdateSchedule extends StatefulWidget {
  const UpdateSchedule({super.key});

  @override
  State<UpdateSchedule> createState() => _UpdateScheduleState();
}

class _UpdateScheduleState extends State<UpdateSchedule> {
  ApiController authentication = Get.put(ApiController());
  bool sundayClosevalue = false;
  bool mondayClosevalue = false;
  bool tuesdayClosevalue = false;
  bool wednesayClosevalue = false;
  bool thursdayClosevalue = false;
  bool friayClosevalue = false;
  bool saturdayClosevalue = false;
  bool sunday24hrvalue = false;
  bool monday24hrvalue = false;
  bool tuesday24hrvalue = false;
  bool wednesay24hrvalue = false;
  bool thursday24hrvalue = false;
  bool friay24hrvalue = false;
  bool saturday24hrvalue = false;
  String sundaystartTime = "";
  String sundayCloseTime = "";
  String mondaystartTime = "";
  String mondayCloseTime = "";
  String tuesdaystartTime = "";
  String tuesdayCloseTime = "";
  String wednesdaystartTime = "";
  String wednesdayCloseTime = "";
  String thursdaystartTime = "";
  String thursdayCloseTime = "";
  String fridaystartTime = "";
  String fridayCloseTime = "";
  String saturdaystartTime = "";
  String saturdayayCloseTime = "";
  /////////////////////////////time
  Future<TimeOfDay?> getTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      sundaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getSundayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      sundayCloseTime = formattedTime!;
    });
    return time;
  }

  //////////pair
  ///
  Future<TimeOfDay?> getmondayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      mondaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getMondayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      mondayCloseTime = formattedTime!;
    });
    return time;
  }

  /////////pair
  /////
  Future<TimeOfDay?> gettuesdayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      tuesdaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getTuesdayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      tuesdayCloseTime = formattedTime!;
    });
    return time;
  }

  ////// pair
  /////
  Future<TimeOfDay?> getWednesdayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      wednesdaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getWednesdayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      wednesdayCloseTime = formattedTime!;
    });
    return time;
  }

  /// pair
  Future<TimeOfDay?> getThursdayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      thursdaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getThursdayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      thursdayCloseTime = formattedTime!;
    });
    return time;
  }

  // pair
  //
  Future<TimeOfDay?> getfridayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      fridaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getFridayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      fridayCloseTime = formattedTime!;
    });
    return time;
  }

  /// pair
  ///
  Future<TimeOfDay?> getsaturdayopenTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      saturdaystartTime = formattedTime!;
    });
    return time;
  }

  Future<TimeOfDay?> getSaturdayCloseTime({
    required BuildContext context,
    String? title,
    String? formattedTime,
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
  }) async {
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      cancelText: cancelText ?? "Cancel",
      confirmText: confirmText ?? "Save",
      helpText: title ?? "Select time",
      builder: (context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: Kwhite, // Background color
              hourMinuteTextColor:
                  kbloodred, // Text color for hours and minutes
              dayPeriodTextColor: KdarkText, // Text color for AM/PM
              dayPeriodBorderSide:
                  BorderSide(color: KdarkText), // Border color for AM/PM
              dialHandColor: kbloodred, // Color of the hour hand
              dialTextColor: Kwhite, // Text color on the clock dial
              dialBackgroundColor: kbloodred.withOpacity(0.5),
              //dayPeriodColor: lightBlue,
              //hourMinuteColor: lightBlue,
              entryModeIconColor: kbloodred,
              helpTextStyle: GoogleFonts.roboto(
                color: KText, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown.shade300),
                  foregroundColor: MaterialStateProperty.all<Color>(kbloodred)),
              hourMinuteTextStyle: GoogleFonts.roboto(
                  fontSize: 30), // Text style for hours and minutes
            ),
            textTheme: TextTheme(
              bodySmall: GoogleFonts.roboto(color: KdarkText),
            ),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: kbloodred,
              selectionColor: kbloodred,
              selectionHandleColor: KText,
            ),
          ),
          child: child!,
        );
      },
    );
    formattedTime = MaterialLocalizations.of(context).formatTimeOfDay(time!);
    setState(() {
      saturdayayCloseTime = formattedTime!;
    });
    return time;
  }

  @override
  void initState() {
    if (authentication.profileData["bloodBankTimming"] != null) {
      setState(() {
        sundayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Sunday"]["isClosed"];
        mondayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Monday"]["isClosed"];
        tuesdayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Tuesday"]["isClosed"];
        wednesayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Wednesday"]["isClosed"];
        thursdayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Thursday"]["isClosed"];
        friayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Friday"]["isClosed"];
        saturdayClosevalue = authentication.profileData["bloodBankTimming"]
            ["Saturday"]["isClosed"];
        sunday24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Sunday"]["is24Hours"];
        monday24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Monday"]["is24Hours"];
        tuesday24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Tuesday"]["is24Hours"];
        wednesay24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Wednesday"]["is24Hours"];
        thursday24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Thursday"]["is24Hours"];
        friay24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Friday"]["is24Hours"];
        saturday24hrvalue = authentication.profileData["bloodBankTimming"]
            ["Saturday"]["is24Hours"];
        sundaystartTime = authentication.profileData["bloodBankTimming"]
            ["Sunday"]["timming"][0];
        sundayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Sunday"]["timming"][1];
        mondaystartTime = authentication.profileData["bloodBankTimming"]
            ["Monday"]["timming"][0];
        mondayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Monday"]["timming"][1];
        tuesdaystartTime = authentication.profileData["bloodBankTimming"]
            ["Tuesday"]["timming"][0];
        tuesdayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Tuesday"]["timming"][1];

        wednesdaystartTime = authentication.profileData["bloodBankTimming"]
            ["Wednesday"]["timming"][0];
        wednesdayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Wednesday"]["timming"][1];
        thursdaystartTime = authentication.profileData["bloodBankTimming"]
            ["Thursday"]["timming"][0];
        thursdayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Thursday"]["timming"][1];
        fridaystartTime = authentication.profileData["bloodBankTimming"]
            ["Friday"]["timming"][0];
        fridayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Friday"]["timming"][1];
        saturdaystartTime = authentication.profileData["bloodBankTimming"]
            ["Saturday"]["timming"][0];
        saturdayayCloseTime = authentication.profileData["bloodBankTimming"]
            ["Saturday"]["timming"][1];
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bankappbar(
        dontHaveBackAsLeading: false,
        title: "Update Bank Timings",
      ),
      backgroundColor: Kwhite,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Please update Blood Bank working Hours...",
                style: GoogleFonts.roboto(
                    fontSize: kSixteenFont, color: KText, fontWeight: kFW400),
              ),
              SizedBox(
                height: 20.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sunday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  sunday24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: sundayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.sundayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  sundayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: sunday24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.sunday24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              sundayClosevalue == false && sunday24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      sundaystartTime == ""
                                          ? "Select Time"
                                          : "$sundaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: sundaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time = await getTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      sundayCloseTime == ""
                                          ? "Select Time"
                                          : "$sundayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: sundayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getSundayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Monday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  monday24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: mondayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.mondayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  mondayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: monday24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.monday24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              mondayClosevalue == false && monday24hrvalue == false
                  // mondayClosevalue == false && monday24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      mondaystartTime == ""
                                          ? "Select Time"
                                          : "$mondaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: mondaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getmondayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      mondayCloseTime == ""
                                          ? "Select Time"
                                          : "$mondayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: mondayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getMondayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tuesday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  tuesday24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: tuesdayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.tuesdayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  tuesdayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: tuesday24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.tuesday24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              tuesdayClosevalue == false && tuesday24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tuesdaystartTime == ""
                                          ? "Select Time"
                                          : "$tuesdaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: tuesdaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await gettuesdayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tuesdayCloseTime == ""
                                          ? "Select Time"
                                          : "$tuesdayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: tuesdayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getTuesdayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wednesday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  wednesay24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: wednesayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.wednesayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  wednesayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: wednesay24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.wednesay24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              wednesayClosevalue == false && wednesay24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      wednesdaystartTime == ""
                                          ? "Select Time"
                                          : "$wednesdaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: wednesdaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getWednesdayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      wednesdayCloseTime == ""
                                          ? "Select Time"
                                          : "$wednesdayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: wednesdayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getWednesdayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thursday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  thursday24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: thursdayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.thursdayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  thursdayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: thursday24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.thursday24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              thursdayClosevalue == false && thursday24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      thursdaystartTime == ""
                                          ? "Select Time"
                                          : "$thursdaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: thursdaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getThursdayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      thursdayCloseTime == ""
                                          ? "Select Time"
                                          : "$thursdayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: thursdayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getThursdayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Friday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  friay24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: friayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.friayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  friayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: friay24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.friay24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              friayClosevalue == false && friay24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      fridaystartTime == ""
                                          ? "Select Time"
                                          : "$fridaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: fridaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getfridayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      fridayCloseTime == ""
                                          ? "Select Time"
                                          : "$fridayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: fridayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getFridayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saturday",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, fontWeight: kFW600, color: KdarkText),
                  ),
                  saturday24hrvalue == true
                      ? SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: saturdayClosevalue,
                              onChanged: (value) {
                                setState(() {
                                  this.saturdayClosevalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "Closed",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        ),
                  saturdayClosevalue == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: kbloodred,
                              checkColor: Kwhite,
                              value: saturday24hrvalue,
                              onChanged: (value) {
                                setState(() {
                                  this.saturday24hrvalue = value!;
                                });
                                print(value);
                              },
                            ),
                            Text(
                              "24 hrs open",
                              style: GoogleFonts.roboto(
                                  fontSize: kTwelveFont.sp,
                                  color: KdarkText,
                                  fontWeight: kFW500),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              saturdayClosevalue == false && saturday24hrvalue == false
                  ? Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Open Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      saturdaystartTime == ""
                                          ? "Select Time"
                                          : "$saturdaystartTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: saturdaystartTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getsaturdayopenTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Close Time",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                  fontSize: kFourteenFont,
                                  //  letterSpacing: 1,
                                  color: KText,
                                  fontWeight: kFW500),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    left: 5.w,
                                    right: 10.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: kblack.withOpacity(0.6),
                                        width: 0.5),
                                    color: Kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblack.withOpacity(0.2),
                                        blurRadius: 2.r,
                                        offset: Offset(1, 1),
                                        spreadRadius: 1.r,
                                      )
                                      // BoxShadow(
                                      //   color: Color(0x3FD3D1D8),
                                      //   blurRadius: 30,
                                      //   offset: Offset(15, 15),
                                      //   spreadRadius: 2,
                                      // )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      saturdayayCloseTime == ""
                                          ? "Select Time"
                                          : "$saturdayayCloseTime",
                                      //   "hi",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: kFW500,
                                          color: saturdayayCloseTime == ""
                                              ? KTextgery.withOpacity(0.5)
                                              : kblack),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        TimeOfDay? time =
                                            await getSaturdayCloseTime(
                                          context: context,
                                          title: "Select Your Time",
                                        );
                                      },
                                      child: Icon(
                                        Icons.timer,
                                        color: kblack.withOpacity(0.6),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 60.h,
              ),
              Obx(() => authentication.scheduleLoading == true
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
                          "Sunday": {
                            "isClosed": sundayClosevalue,
                            "is24Hours": sunday24hrvalue,
                            "timming": [sundaystartTime, sundayCloseTime]
                          },
                          "Monday": {
                            "isClosed": mondayClosevalue,
                            "is24Hours": monday24hrvalue,
                            "timming": [mondaystartTime, mondayCloseTime]
                          },
                          "Tuesday": {
                            "isClosed": tuesdayClosevalue,
                            "is24Hours": tuesday24hrvalue,
                            "timming": [tuesdaystartTime, tuesdayCloseTime]
                          },
                          "Wednesday": {
                            "isClosed": wednesayClosevalue,
                            "is24Hours": wednesay24hrvalue,
                            "timming": [wednesdaystartTime, wednesdayCloseTime]
                          },
                          "Thursday": {
                            "isClosed": thursdayClosevalue,
                            "is24Hours": thursday24hrvalue,
                            "timming": [thursdaystartTime, thursdayCloseTime]
                          },
                          "Friday": {
                            "isClosed": friayClosevalue,
                            "is24Hours": friay24hrvalue,
                            "timming": [fridaystartTime, fridayCloseTime]
                          },
                          "Saturday": {
                            "isClosed": saturdayClosevalue,
                            "is24Hours": saturday24hrvalue,
                            "timming": [saturdaystartTime, saturdayayCloseTime]
                          }
                        };
                        authentication.updateBloodBankTimings(payload);
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
