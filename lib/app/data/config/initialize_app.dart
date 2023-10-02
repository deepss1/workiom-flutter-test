part of 'config.dart';
/*late String kDevelopmentApiBaseUrl;
late String kProductionApiBaseUrl;*/

/// Initialize all core functionalities
Future<void> initializeCoreApp({
  required String? developmentApiBaseUrl,
  required String? productionApiBaseUrl,
  bool firebaseApp = true,
  bool setupLocalNotifications = false,
  bool encryption = false,
}) async {
  //Activate logger
  initLogger();

  //Firebase products initializations
  if (firebaseApp) {
    // await Firebase.initializeApp();
    // notificationActions(
    //   action: notificationAction,
    //   localNotification: setupLocalNotifications,
    //   localNotificationAction: localNotificationAction,
    // );
  }
  /*if (developmentApiBaseUrl != null) {
    kDevelopmentApiBaseUrl = developmentApiBaseUrl;
  }
  if (productionApiBaseUrl != null) {
    kProductionApiBaseUrl = productionApiBaseUrl;
  }*/

  await GetStorage.init();
  UserProvider.loadUser();
  LocaleProvider.loadCurrentLocale();

  if (productionApiBaseUrl != null && developmentApiBaseUrl != null) {
    APIService.initializeAPIService(
      encryptData: encryption,
      devBaseUrl: developmentApiBaseUrl,
      prodBaseUrl: productionApiBaseUrl,
    );
  }
}
