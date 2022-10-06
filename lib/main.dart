import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // 알림 구현
import 'package:flutter_native_timezone/flutter_native_timezone.dart'; // 현지 시간 맞추기
import 'package:lymphowear_remote_app/constants.dart';
import 'package:lymphowear_remote_app/pages/splash_screen_page.dart';
import 'package:lymphowear_remote_app/models/received_notification.dart';
import 'package:rxdart/subjects.dart'; //  ReactiveX 기반의 Dart 언어 용 Reactive 프로그래밍 라이브러리
import 'package:timezone/data/latest_all.dart' as tz; // 시간 설정
import 'package:timezone/timezone.dart' as tz;

// 알림 플러그인
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// model
final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

// 알림의 주제 작성
final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
    ),
  );

  // 비동기 main 메소드 사용 시 추가
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

// android - AndroidInitializationSettings
// iOS - Darwin..., DarwinInitializationSettings
  /// Android Permission Setting
  const AndroidInitializationSettings initializationSettingsAndroid =
      // AndroidInitializationSettings('mipmap/ic_launcher');
      // 안드로이드 알람 로고
      AndroidInitializationSettings('app_icon');

  /// iOS Permission Setting
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
          (NotificationResponse notificationResponse) {
    // notifacation 클릭 후 결과 - AlertDialog 등 사용 가능
  });

  runApp((const MyApp()));
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  // flutter_native_timezone - timezone의 현재 시간대를 얻는 방법을 제공
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
