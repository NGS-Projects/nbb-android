import 'package:nuhvinbloodbank/untils/export_file.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: kDonorSignUp,
        transition: Transition.rightToLeft,
        page: () => DonorSignUp()),
    GetPage(
        name: kSplashScreen,
        transition: Transition.rightToLeft,
        page: () => SplashScreen()),
    GetPage(
        name: kOnboardingScreen,
        transition: Transition.rightToLeft,
        page: () => OnboardingScreen()),
    GetPage(
        name: kFindDonorSignUp,
        transition: Transition.rightToLeft,
        page: () => FindDonor()),
    GetPage(
        name: kAdminSignIn,
        transition: Transition.rightToLeft,
        page: () => AdminSignIn()),
    GetPage(
        name: kDonorslist,
        transition: Transition.rightToLeft,
        page: () => DonorsList()),
    GetPage(
        name: kSignUpScreen,
        transition: Transition.rightToLeft,
        page: () => SignUp()),
    GetPage(
        name: kSignInScreen,
        transition: Transition.rightToLeft,
        page: () => SignIn()),
    GetPage(
        name: kForgotPasswordScreen,
        transition: Transition.rightToLeft,
        page: () => ForgotPassword()),
    GetPage(
        name: kDashboardScreen,
        transition: Transition.rightToLeft,
        page: () => Dashboard()),
    GetPage(
        name: kNavigation,
        transition: Transition.rightToLeft,
        page: () => Bottom_navigation()),
    GetPage(
        name: kMobileSignUp,
        transition: Transition.rightToLeft,
        page: () => MobileSignUp()),
    GetPage(
        name: kOtpScreen,
        transition: Transition.rightToLeft,
        page: () => OtpScreen()),
    GetPage(
        name: kProfileScreen,
        transition: Transition.rightToLeft,
        page: () => Profile()),
    GetPage(
        name: kReceiversList,
        transition: Transition.rightToLeft,
        page: () => ReceiversList()),
    GetPage(
        name: kNotificationsScreen,
        transition: Transition.rightToLeft,
        page: () => Notifications()),
    GetPage(
        name: kChangePasswordScreen,
        transition: Transition.rightToLeft,
        page: () => ChangePassword()),
    GetPage(
        name: kHelpDeskScreen,
        transition: Transition.rightToLeft,
        page: () => HelpDesk()),
    GetPage(
        name: kBloodBanksList,
        transition: Transition.rightToLeft,
        page: () => BloodBanksList()),
    GetPage(
        name: kEditProfileScreen,
        transition: Transition.rightToLeft,
        page: () => EditProfile()),
    GetPage(
        name: kChatScreen,
        transition: Transition.rightToLeft,
        page: () => ChatScreen()),
    GetPage(
        name: kNotificationMessage,
        transition: Transition.rightToLeft,
        page: () => Message()),
    GetPage(
        name: kDonorBottomNavigation,
        transition: Transition.rightToLeft,
        page: () => DonorBottom_navigation()),
    GetPage(
        name: kNoInternetScreen,
        transition: Transition.rightToLeft,
        page: () => No_Internet()),
    GetPage(
        name: kBloodUpdateScreen,
        transition: Transition.rightToLeft,
        page: () => UpdateBloodStatus()),
    GetPage(
        name: kPatientsScreen,
        transition: Transition.rightToLeft,
        page: () => PatientList()),
    GetPage(
        name: kAboutUs,
        transition: Transition.rightToLeft,
        page: () => AboutUs()),
    GetPage(
        name: kPrivacypolicy,
        transition: Transition.rightToLeft,
        page: () => Privacy()),
    GetPage(
        name: kAbokTermsutUs,
        transition: Transition.rightToLeft,
        page: () => Terms()),
    GetPage(
        name: kUpdateSchedule,
        transition: Transition.rightToLeft,
        page: () => UpdateSchedule()),
    GetPage(
        name: kSearchPlaces,
        transition: Transition.rightToLeft,
        page: () => PlacesSearch()),
    GetPage(
        name: kSearchPlacesBank,
        transition: Transition.rightToLeft,
        page: () => PlacesSearchBanks()),
    GetPage(
        name: kBlogsList,
        transition: Transition.rightToLeft,
        page: () => BlogsList()),
    GetPage(
        name: kBlogView,
        transition: Transition.rightToLeft,
        page: () => BlogView()),
    GetPage(
        name: kAddRating,
        transition: Transition.rightToLeft,
        page: () => AddRating()),
    GetPage(
        name: kRatingsList,
        transition: Transition.rightToLeft,
        page: () => RatingsList()),
    GetPage(
        name: kExploreScreen,
        transition: Transition.rightToLeft,
        page: () => ExploreScreen()),
    GetPage(
        name: kSearchPlacesBankEdit,
        transition: Transition.rightToLeft,
        page: () => PlacesSearchBanksEdit()),
    GetPage(
        name: kFeedView,
        transition: Transition.rightToLeft,
        page: () => FeedView()),
    GetPage(
        name: kRceiverView,
        transition: Transition.rightToLeft,
        page: () => ReceiverView()),
    GetPage(
        name: kDonorView,
        transition: Transition.rightToLeft,
        page: () => DonorView()),
    GetPage(
        name: kbankView,
        transition: Transition.rightToLeft,
        page: () => BankView()),
    GetPage(
        name: kbankView,
        transition: Transition.rightToLeft,
        page: () => BankView()),
    GetPage(
        name: KFriendsDashboard,
        transition: Transition.rightToLeft,
        page: () => FriendsBankDashboard()),
    GetPage(
        name: KFriendsDonors,
        transition: Transition.rightToLeft,
        page: () => FDonorsList()),
    GetPage(
        name: KFriendsSignup,
        transition: Transition.rightToLeft,
        page: () => FSignup()),
    GetPage(
        name: KFriendsSignIn,
        transition: Transition.rightToLeft,
        page: () => FSignIn()),
    GetPage(
        name: KFriendsForgot,
        transition: Transition.rightToLeft,
        page: () => ForgotScreen()),
    GetPage(
        name: KFriendsProfile,
        transition: Transition.rightToLeft,
        page: () => FriendProfile()),
    GetPage(
        name: KFriendsEdit,
        transition: Transition.rightToLeft,
        page: () => FEditProfile()),
    GetPage(
        name: KFADDRecord,
        transition: Transition.rightToLeft,
        page: () => FAddDonation()),
    GetPage(
        name: KFDonationsHistory,
        transition: Transition.rightToLeft,
        page: () => FDOnordHistory()),
  ];
}
