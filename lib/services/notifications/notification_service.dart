import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService();

  final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

   static const String _channelId = 'reminders_channel';
  static const String _channelName = 'Reminders';
  static const String _channelDescription = 'Напоминания о задачах';

  bool _initialized = false;

  /// Инициализация плагина и таймзон.
  /// Вызывать один раз при старте приложения (в main.dart или DI).
  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    final String timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
        const DarwinInitializationSettings iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
      macOS: iosInit,
    );

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onTap,
    );

    _initialized = true;
  }

  /// Запрос разрешений (Android 13+, iOS, macOS).
  Future<bool> requestPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? android =
        _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final bool? granted =
          await android.requestNotificationsPermission();
      return granted ?? false;
    }

    final IOSFlutterLocalNotificationsPlugin? ios =
        _plugin.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final bool? granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    final MacOSFlutterLocalNotificationsPlugin? macos =
        _plugin.resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>();
    if (macos != null) {
      final bool? granted = await macos.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true;
  }

  /// Запланировать уведомление на конкретную дату/время.
  Future<void> scheduleAt({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    if (dateTime.isBefore(DateTime.now())) return;

    final tz.TZDateTime scheduled = tz.TZDateTime.from(dateTime, tz.local);

    const NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    );

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduled,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Отменить одно уведомление по id.
  Future<void> cancel(int id) async {
    await _plugin.cancel(id);
  }

  /// Отменить все уведомления.
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  void _onTap(NotificationResponse response) {
    // Здесь можно добавить навигацию по payload. (Навигация по тапу на уведомление)
    if (kDebugMode) {
      debugPrint('Notification tapped: ${response.payload}');
    }
  }
}
