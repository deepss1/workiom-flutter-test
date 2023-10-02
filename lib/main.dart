// ignore_for_file: flutter_style_todos

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'package:get/get.dart';
import 'package:workiom/app/data/local/user_provider.dart';
import 'package:workiom/app/utils/app_utils.dart';

import 'package:workiom/app/data/local/locale_provider.dart';
import 'app/data/config/config.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  tz.initializeTimeZones();

  await runZonedGuarded(
    () async {
      Get.put(AppTranslations());
      TranslationApi.loadTranslations();
      await initializeCoreApp(
        // Set it to true when including firebase app
        firebaseApp: false,
        developmentApiBaseUrl: 'http://api.workiom.site',
        productionApiBaseUrl: 'http://api.workiom.site',
      );
      runApp(
        const StartTheApp(),
      );
    },
    (Object error, StackTrace trace) {
      letMeHandleAllErrors(error, trace);
    },
  );
}

///To catch widget errors
/*FlutterError.onError = (errorDetails) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      letMeHandleAllErrors(errorDetails.exception, errorDetails.stack);
      Catcher.reportCheckedError(errorDetails.exception, errorDetails.stack);
    });
  };*/

/// App starter
class StartTheApp extends StatelessWidget {
  /// Constructor
  const StartTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          hideKeyboard();
        },
        child: GetMaterialApp(
          title: 'Workiom',
          debugShowCheckedModeBanner: false,
          initialRoute: UserProvider.initialRoutes(),
          getPages: AppPages.routes,
          translationsKeys: Get.find<AppTranslations>().keys,
          translations: Get.find<AppTranslations>(),
          locale: LocaleProvider.currentLocale,
          fallbackLocale: const Locale('en_US'),
          defaultTransition: Transition.cupertino,
          theme: AppThemes.lightTheme,
        ),
      );
}
