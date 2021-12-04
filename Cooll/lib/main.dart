import 'package:cooll/app_runner.dart';
import 'package:cooll/localization/app_localization.dart';
import 'package:cooll/models/app_locale_model.dart';
import 'package:cooll/routes.dart';
import 'package:cooll/utils/navigation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppRunner.run();
}

class CoollApp extends StatelessWidget {
  final String initialRoute;

  const CoollApp({required this.initialRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLocaleModel>(
      builder: (_, appLocale, __) => MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateTitle: (_) => AppLocalizations().appName,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizationsDelegate.supportedLocaleCodes
            .map((code) => Locale(code, '')),
        locale: appLocale.locale,
        debugShowCheckedModeBanner: false,
        routes: Routes.routes,
        initialRoute: initialRoute,
      ),
    );
  }
}
