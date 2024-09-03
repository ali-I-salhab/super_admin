import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//evey thing will start with starting application Secondary Side Bar.
//any thing needed to start when application started will added to this file

class MyServices extends GetxService {
  // we can use dependece injection Get.put ....
  // because we extends Getxservices
  late SharedPreferences shared;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
// request user permition 
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // handle reach notification whith opern app(foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
        // handle reach notification whith firbase app(foreground)

    Future<void> _firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      // If you're going to use other Firebase services in the background, such as Firestore,
      // make sure you call `initializeApp` before using other Firebase services.
      await Firebase.initializeApp();

      print("Handling a background message: ${message.messageId}");
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    print('User granted permission: ${settings.authorizationStatus}');
    shared = await SharedPreferences.getInstance();
    return this;
  }
}

initialservizes() async {
  await Get.putAsync(() => MyServices().init());
}
