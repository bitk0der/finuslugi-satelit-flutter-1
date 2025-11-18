import 'package:background_fetch/background_fetch.dart';
import 'package:dio/dio.dart';
import 'package:fin_uslugi/core/network/api_client.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/bloc/notification_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:fin_uslugi/features/local_notifications/data/services/notification_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  if (task.timeout) {
    Logger().w('[HeadlessTask] Timeout: ${task.taskId}');
    BackgroundFetch.finish(task.taskId);
    return;
  }

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
  BackgroundFetch.finish(task.taskId);
}

bool checkTimeStamp(int? timeStamp) {
  /* return true; */
  if (timeStamp == null) return false;

  var enteredDate = DateTime.fromMillisecondsSinceEpoch(timeStamp);

  return DateTime.now().difference(enteredDate).inHours > 24;
}
