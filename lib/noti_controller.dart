import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsController {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  List<RemoteMessage> notificationHistory = [];
  List<RemoteMessage> unreadNotifications = [];
  Future<void> initialize() async {
    await Firebase.initializeApp();
    await _requestNotificationPermissions();
    await _configureAndroidNotifications();
    await _handleNotifications();
  }

  // Future<String?> getFcmToken() async {
  //   return await _firebaseMessaging.getToken();
  // }

  // Future<void> sendFcmTokenToBackend(String? fcmToken) async {
  //   // Make an API call to your Laravel backend to send the FCM token
  //   // You can use a package like `http` or `dio` to make the API call
  //   final response = await http.post(
  //     Uri.parse('$laravelBackendUrl/api/fcm-token'),
  //     body: {'fcm_token': fcmToken},
  //   );
  // }

  Future<void> _requestNotificationPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined permission');
    }
  }

  Future<void> _configureAndroidNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _handleNotifications() async {
    // Handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the received notification
      print('Received a message in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title}');
        notificationHistory.add(message);
        unreadNotifications.add(message);
        _showNotification(
          message.notification!.title!,
          message.notification!.body!,
        );
      }
    });

    // Handle notifications that open the app
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the notification that opened the app
      print('A new onMessageOpenedApp event was published!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification!.title}');
        _navigateToNotificationScreen(message.data);
      }
    });
  }

  void _showNotification(String title, String body) {
    // Use a package like `flutter_local_notifications` to display the notification
    // to the user
    _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'base_channel',
          'base_channel',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  void _navigateToNotificationScreen(Map<String, dynamic> data) {
    // Navigate to the appropriate screen in your app based on the notification data
  }
  void _markNotificationAsRead(RemoteMessage message) {
    unreadNotifications.remove(message);
  }
}