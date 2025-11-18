import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:fin_uslugi/core/network/api_client.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/bloc/notification_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:fin_uslugi/features/local_notifications/data/services/notification_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundFetchService {
  static Future<void> init() async {
    await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        startOnBoot: true,
        requiredNetworkType: NetworkType.ANY,
        enableHeadless: true,
      ),
      onFetch,
      onTimeout,
    );
  }

  static Future<void> onFetch(String taskId) async {
    Logger().i('[BackgroundFetch] Task received: $taskId');

    final notificationsPlugin = FlutterLocalNotificationsPlugin();
    final service = NotificationServiceImpl(notificationsPlugin);
    await service.init();
    final ApiClient apiRepository = ApiClient(Dio());
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final bloc = LocalNotificationBloc(
      apiRepository,
      preferences,
    ); // Replace with actual preferences if needed
    bloc.add(NotificationShow());

    await Future.delayed(const Duration(seconds: 3));
    BackgroundFetch.finish(taskId);
  }

  static Future<void> onTimeout(String taskId) async {
    Logger().w('[BackgroundFetch] Task timeout: $taskId');
    BackgroundFetch.finish(taskId);
  }
}
