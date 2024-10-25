import 'package:nuhvinbloodbank/untils/export_file.dart';

class Bankappbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool dontHaveBackAsLeading;
  final bool hasNotificationAsTrailing;
  final bool centerTitle;
  final Widget? trailing;
  final Color? bColor;
  final bool? dashboard;
  final bool? dorefresh;

  const Bankappbar({
    Key? key,
    required this.title,
    this.bColor,
    this.dontHaveBackAsLeading = false,
    this.hasNotificationAsTrailing = false,
    this.centerTitle = false,
    this.trailing,
    this.dorefresh,
    this.dashboard = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<Bankappbar> createState() => _BankappbarState();
}

class _BankappbarState extends State<Bankappbar> {
  @override
  Widget build(BuildContext context) {
    return

        /////////////////////////////////////

        ///////////////////////
        AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      centerTitle: widget.centerTitle,
      backgroundColor: Kwhite,
      leadingWidth: widget.dontHaveBackAsLeading ? 15.w : 50.w,
      leading: widget.dontHaveBackAsLeading
          ? const SizedBox()
          : IconButton(
              onPressed: () {
                widget.dorefresh == false
                    ? Get.back()
                    : Get.back(result: "refresh");
              },
              icon: Icon(Icons.arrow_back_ios, size: 25.w, color: KdarkText),
            ),
      title: Text(
        widget.title,
        style: GoogleFonts.roboto(
            fontSize: 20.sp, color: KdarkText, fontWeight: kFW600),
      ),
      actions: [
        widget.trailing ?? const SizedBox(),
      ],
    );
  }
}
