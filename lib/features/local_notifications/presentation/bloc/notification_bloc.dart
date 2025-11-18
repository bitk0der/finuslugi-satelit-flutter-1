import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:fin_uslugi/features/local_notifications/data/models/chat_request_body.dart';
import 'package:fin_uslugi/features/local_notifications/main_notification_logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:fin_uslugi/core/network/api_client.dart';
import 'package:fin_uslugi/features/local_notifications/data/models/response_message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// BLOC
@singleton
class LocalNotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ApiClient apiClient;
  final SharedPreferences preferences;
  bool isDialogVisible = false;
  LocalNotificationBloc(this.apiClient, this.preferences)
      : super(NotificationInitial()) {
    on<GetBackgroundNotifications>(_onGetBackgroundNotifications);
    on<SaveNotificationToCache>(_onSaveNotificationToCache);
    on<RemoveNotificationFromCache>(_onRemoveNotificationFromCache);
    on<GetNotificationFromCache>(_onGetNotificationFromCache);
    on<ClearNotifications>(_onClearNotificationsCache);
    on<NotificationShow>(_onNotificationShow);
  }

  Future<void> _onNotificationShow(
    NotificationShow event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      MessagesResponse messagesResponse;
      var userId = preferences.getString('userIdMetrika') ?? '';
      messagesResponse = await apiClient.getBackgroundNotification(
        ChatRequestBody.getLastMessageBodyNotification(userId),
      );

      /*  MessagesResponse messagesResponse = MessagesResponse(
          checkDate: null,
          messages: [
            ResponseMessageModel(
                buttons: [
                  ButtonModel(
                      text: 'text',
                      link:
                          'https://poluchitzaem.mfoshop.ru/?aff_sub5=miczaimpush',
                      type: 'type')
                ],
                isUserMessage: false,
                message: '',
                messageId: '',
                time: DateTime.now().millisecondsSinceEpoch)
          ],
          error: null,
          status: 'done'); */

      if (!(preferences.getBool('isNotificationsEnabled') ?? true)) return;
      if (messagesResponse.messages.isNotEmpty) {
        var android = AndroidNotificationDetails(
          'chat_id',
          'chat_channel',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          showWhen: false,
          styleInformation: BigTextStyleInformation(
            messagesResponse.messages.last.message,
            htmlFormatBigText: true,
            htmlFormatTitle: true,
            htmlFormatContent: true,
            htmlFormatContentTitle: true,
            htmlFormatSummaryText: true,
          ),
        );
        // const iOS = IOSNotificationDetails();
        var details = NotificationDetails(android: android);
        // notifications.show(rnd.nextInt(999999), 'У вас новое сообщение',
        //     messagesResponse.messages.last.message, details);
        var localNotificationBloc = LocalNotificationBloc(
          ApiClient(Dio()),
          preferences,
        );
        localNotificationBloc.add(SaveNotificationToCache(messagesResponse));
        notifications.show(
          Random().nextInt(99999),
          messagesResponse.messages.first.title,
          messagesResponse.messages.first.message,
          details,
          payload: jsonEncode(messagesResponse.toJson()),
        );
      }
    } catch (error) {
      String? message;
      if (error is DioException) {
        message = error.message;
      }
      emit(NotificationError(message));
    } finally {
      // BackgroundFetch.scheduleTask(TaskConfig(
      //   taskId: 'chat',
      //   periodic: true,
      //   delay: 15,
      //   requiredNetworkType: NetworkType.ANY,
      // ));
    }
  }

  Future<void> _onClearNotificationsCache(
    ClearNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      await preferences.remove('local_notifications');
      add(GetNotificationFromCache());
    } catch (error) {
      emit(NotificationError());
    }
  }

  Future<void> _onGetBackgroundNotifications(
    GetBackgroundNotifications event,
    Emitter<NotificationState> emit,
  ) async {
    /*  try {
      await apiClient.getBackgroundNotification();
    } catch (error) {
      emit(NotificationError());
    } */
  }

  Future<void> _onRemoveNotificationFromCache(
    RemoveNotificationFromCache event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      var notificationsList =
          preferences.getStringList('local_notifications') ?? [];
      notificationsList.removeWhere(
        (item) =>
            MessagesResponse.fromJson(jsonDecode(item)).messages.first.time ==
            event.messagesResponse.messages.first.time,
      );
      await preferences.setStringList('local_notifications', notificationsList);
      add(GetNotificationFromCache());
    } catch (error) {
      emit(NotificationError());
    }
  }

  Future<void> _onSaveNotificationToCache(
    SaveNotificationToCache event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      var notificationsList =
          preferences.getStringList('local_notifications') ?? [];
      notificationsList.add(jsonEncode(event.messagesResponse.toJson()));
      await preferences.setStringList('local_notifications', notificationsList);
      add(GetNotificationFromCache());
    } catch (error) {
      emit(NotificationError());
    }
  }

  Future<void> _onGetNotificationFromCache(
    GetNotificationFromCache event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      var notificationsList =
          preferences.getStringList('local_notifications') ?? [];
      if (notificationsList.isEmpty) {
        emit(NotificationLoadedSuccessfull([]));
      } else {
        List<MessagesResponse> messageResponses = [];
        for (var item in notificationsList) {
          var jsonMap = jsonDecode(item);
          messageResponses.add(MessagesResponse.fromJson(jsonMap));
        }
        emit(NotificationLoadedSuccessfull(messageResponses));
      }
    } catch (error) {
      emit(NotificationError());
    }
  }
}

// EVENTS
abstract class NotificationEvent {}

class GetBackgroundNotifications extends NotificationEvent {}

class SaveNotificationToCache extends NotificationEvent {
  MessagesResponse messagesResponse;
  SaveNotificationToCache(this.messagesResponse);
}

class NotificationShow extends NotificationEvent {}

class RemoveNotificationFromCache extends NotificationEvent {
  MessagesResponse messagesResponse;
  RemoveNotificationFromCache(this.messagesResponse);
}

class EditNotificationToCache extends NotificationEvent {
  MessagesResponse messagesResponse;
  EditNotificationToCache(this.messagesResponse);
}

class GetNotificationFromCache extends NotificationEvent {}

class ClearNotifications extends NotificationEvent {}

// STATES
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationError extends NotificationState {
  String? message;
  NotificationError([this.message]);
}

class NotificationLoadedSuccessfull extends NotificationState {
  List<MessagesResponse> messageResponses;
  NotificationLoadedSuccessfull(this.messageResponses);
}
