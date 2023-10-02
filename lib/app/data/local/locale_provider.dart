import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:workiom/app/data/local/local_store.dart';

/// Helper class for localization
class LocaleProvider {
  static Locale _currentLocale = const Locale('en_US');

  /// Get selected locale
  static Locale get currentLocale => _currentLocale;

  /// Load selected locate
  static void loadCurrentLocale() {
    _currentLocale = Locale(LocalStore.currentLocale() ?? 'en_US');
  }

  /// update app language
  static Future<void> changeLocale(Locale updatedLocale) async {
    _currentLocale = updatedLocale;
    LocalStore.currentLocale(updatedLocale.languageCode);
    unawaited(Get.updateLocale(LocaleProvider.currentLocale));
  }
}
