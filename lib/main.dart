// ignore_for_file: avoid_print, iterable_contains_unrelated_type, unused_local_variable, unused_import

import 'package:alarm/alarm.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:doctor/admin/views/admin_view.dart';
import 'package:doctor/core/localization/local.dart';
import 'package:doctor/firebase_options.dart';
import 'package:doctor/network/auth_base.dart';
import 'package:doctor/network/firebase_messaging_base.dart';
import 'package:doctor/network/laravel.dart';
import 'package:doctor/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'admin/admin/views/login.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  Get.log('starting services ...');
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => LaravelApiClient().init());

  await Alarm.init();
  Get.log('All services started...');

  final box = GetStorage();
  String keylocal = box.read('locale') ?? 'x';
  ///en //ar //' '
  ///
  Locale lang = const Locale('ar');
  if (keylocal != 'x') {
    lang = Locale(keylocal);
  } else {
    box.write('locale', 'ar');
  }
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {


  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    String email = box.read('email') ?? 'x';
    bool isLogin=box.read('login')??false;

    if(isLogin){
      return GetMaterialApp(
        builder: BotToastInit(), // Initialize BotToast
        navigatorObservers: [BotToastNavigatorObserver()], // Register BotToastObserver
        home: AdminView(),
        //AdminView(),
        translations: MyLocal(),
        //   title: "Doctor",
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
      );
    }else{
      return GetMaterialApp(
        builder: BotToastInit(), // Initialize BotToast
        navigatorObservers: [BotToastNavigatorObserver()], // Register BotToastObserver
        home: AdminLogin(),
        //AdminView(),
        translations: MyLocal(),
        //   title: "Doctor",
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
      );
    }


    
  }
}

// FirebaseMessaging messaging = FirebaseMessaging.instance;

// Future<void> configureFirebaseMessaging() async {

//   print("NOTIF");
//   FirebaseMessaging.instance
//       .getInitialMessage()
//       .then((RemoteMessage? message) async {

//         print("HEREnotifications......");
//     // Handle the initial message when the app is opened from a notification
//     if (message != null) {
//        print("HEREnotifications....1111..");
//          print("MSG 2");
//     print(message..notification!.title.toString());
    
//       print("Initial message: ${message.notification?.title}");
//       triggerNotification
//         ( message.notification!.title.toString());
//     }
//   });

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
   
//    print("MSG 1");
//     print(message..notification!.title.toString());
//     triggerNotification(message.notification!.title.toString());
//     print("Foreground message: ${message.notification?.title}");
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//     print("Opened app message: ${message.notification?.title}");
//     print("Opened app message22222: ${message.notification?.titleLocArgs}");

//     List nameList=
//     message.notification!.title.toString().split(',');

//     print(nameList[0]);
//     print(nameList[1]);

//     if(nameList[1].toString().length>1){
//       Get.offAll(const AllServicesView());

//     }else{
//       Get.offAll(RootView());
//     }

//     // triggerNotification(message.notification!.title!);
//   });

//   // ignore: no_leading_underscores_for_local_identifiers
//   Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {

//   //  List nameList=
//     message.notification!.title.toString();

//     triggerNotification (message.notification!.title.toString());
//     //_showDialog(message.notification!.title!);
//     // Handle the received message here
//     print("OPEN APP: ${message.notification?.title}");
//     triggerNotification(message.notification!.title.toString());

//   }
//   FirebaseMessaging.onBackgroundMessage
//     (_firebaseMessagingBackgroundHandler);
// }

// triggerNotification(String msg) {

//  print("........TRIGGERR.....");
//  print("msg..$msg");
//   return AwesomeNotifications().createNotification
//     (content:
//   NotificationContent(
//     id: 1,
//       channelKey:'basic-channel' ,
//       title: 'EASY',
//       body: msg
//   ));


// }


