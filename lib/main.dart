import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/splash_screen_page.dart';
import 'package:lymphowear_remote_app/models/received_notification.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationSubject.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
        ),
      );
    },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {});

  runApp((const MyApp()));
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LymphoWear',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: Colors.transparent,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline5: TextStyle(
            color: Color(0xff212121),
            fontSize: 20,
            fontWeight: semiBold,
          ),
          headline6: TextStyle(
            color: Color(0xff212121),
            fontSize: 16,
            fontWeight: semiBold,
            letterSpacing: 0.0,
          ),
          subtitle1: TextStyle(
            color: Color(0xff212121),
            letterSpacing: 0.0,
          ),
          subtitle2: TextStyle(
            color: Color(0xff212121),
            fontWeight: semiBold,
            letterSpacing: 0.0,
          ),
          bodyText2: TextStyle(
            color: Color(0xff757575),
            letterSpacing: 0.0,
          ),
          button: TextStyle(
            fontSize: 16,
            fontWeight: semiBold,
            letterSpacing: 0.0,
          ),
          caption: TextStyle(
            color: Color(0xff616161),
            letterSpacing: 0.0,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreenPage(),
    );
  }
}
