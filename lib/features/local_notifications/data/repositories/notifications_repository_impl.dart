import 'package:fin_uslugi/core/network/api_client.dart';
import 'package:fin_uslugi/features/local_notifications/domain/usecases/fetch_notifications_usecase.dart';
import 'package:fin_uslugi/features/local_notifications/presentation/bloc/notification_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchNotificationsUseCaseImpl implements FetchNotificationsUseCase {
  final ApiClient apiRepository;
  final SharedPreferences preferences;
  FetchNotificationsUseCaseImpl(this.apiRepository, this.preferences);
  @override
  Future<void> call() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final bloc = LocalNotificationBloc(
      apiRepository,
      preferences,
    ); // Replace with actual preferences if needed
    bloc.add(NotificationShow());
  }
}
