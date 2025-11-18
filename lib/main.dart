import 'package:fin_uslugi/core/utils/random_string_generator.dart';
import 'package:fin_uslugi/features/app_banner/app_banner_initial_setup.dart';
import 'package:fin_uslugi/features/local_notifications/main_notification_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:fin_uslugi/core/constants/constants.dart';
import 'package:fin_uslugi/core/di/service_locator.dart';
import 'package:fin_uslugi/core/routes/app_router.dart';
import 'package:fin_uslugi/core/theme/theme.dart';
import 'package:fin_uslugi/gen/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appmetrica_plugin/appmetrica_plugin.dart';

var globalUserId = '';
final appNavigatorKey = GlobalKey<NavigatorState>();
final _appRouter = AppRouter(appNavigatorKey);
String? payloadToHandle;

/* AppMetricaConfig get _config =>
    const AppMetricaConfig(ApiPath.appMetrikaConfigKey, logs: false); */

void main() async {
  AppMetrica.runZoneGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    /*  await AppMetrica.activate(_config); */
    await initServiceLocator();
    await AppBannerInitialSetup().getPackageInfo();
    await AppBannerInitialSetup().getBanner();
    await connectNotificationsLogic();
    var userId = await AppMetrica.deviceId;
    if (GetIt.I<SharedPreferences>().getString('userIdMetrika') == null) {
      await GetIt.I<SharedPreferences>().setString(
        'userIdMetrika',
        userId ?? generateRandomString(),
      );
    }

    globalUserId = userId ?? generateRandomString();

    runApp(
      const App(),
    );
  });
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MaterialApp.router(
        locale: const Locale(languageCode),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        routerConfig: _appRouter.config(),
        supportedLocales: const AppLocalizationDelegate().supportedLocales,
        theme: defaultTheme,
      ),
    );
  }
}
