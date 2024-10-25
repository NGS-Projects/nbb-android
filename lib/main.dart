import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nuhvinbloodbank/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:mappls_gl/mappls_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nuhvinbloodbank/untils/export_file.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// function to listen to background  changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Some notification Received");
    Get.toNamed(kNotificationMessage);
    // navigatorKey.currentState!.Get.toNamed(page)
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //////////////////////////////////////////
  MapplsAccountManager.setMapSDKKey("033f942acd66a3157a6d52a22ee81f18");
  MapplsAccountManager.setRestAPIKey("033f942acd66a3157a6d52a22ee81f18");
  MapplsAccountManager.setAtlasClientId(
      "96dHZVzsAusidhUytn28QkwAnZ6bRAtUugIE6qJQ_3uRKc1qwIl4NIkCiU-a1ttK5UqamKmzCI8DEyXQyTpnow==");
  MapplsAccountManager.setAtlasClientSecret(
      "lrFxI-iSEg9BKENPQ6Yb1lZNFHGWKlr6U-sg5kRdNkAcI6tzAFS9OkmBhZNOQnvFJ9HedN6VELQKTDqsv7wP84qDhhRdyog-");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // onBackground Notificationtapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Background Notification Tapped");
      Get.toNamed(kNotificationMessage, arguments: message);
    }
  });
  PushNotifcations.init();
  PushNotifcations.localNotiInit();
  // Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  await UserSimplePreferences.init();

// to handle forground notifications
  //String payloadData = jsonEncode(message.data);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) => {
        print("Got a message in foreground"),
        if (message.notification != null)
          {
            PushNotifcations.showSimpleNotification(
                title: message.notification!.title!,
                body: message.notification!.body!,
                payload: jsonEncode(message.data))
          }
      });

  //HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            // navigatorKey: navigatorKey,
            title: "NuhvinBloodBank",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Roboto',
              bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: Colors.transparent),
            ),
            getPages: Routes.routes,
            initialRoute: kSplashScreen,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!);
            });
      },
    );
  }
}
