import 'package:get/get.dart' hide Response;
import 'package:workiom/app/data/config/config.dart';
import 'package:workiom/app/data/local/local_store.dart';

import 'package:workiom/app/data/local/user_provider.dart';
import 'package:workiom/app/data/models/User_model.dart';
import 'package:workiom/app/data/models/editions.dart';
import 'package:workiom/app/data/models/password_valid.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:dio/dio.dart';
import 'package:workiom/app/routes/app_pages.dart';
import 'package:workiom/app/ui/components/app_snackbar.dart';

import '../remote/api_service/init_api_service.dart';

class AuthProvider {
  static Future<EditionResult> getEditionsForSelect() async {
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.get(
        path: '/api/services/app/TenantRegistration/GetEditionsForSelect',
      );
      if (response?.statusCode == 200) {
        return EditionResult.fromMap(response?.data?['result']);
      } else {
        return EditionResult();
      }
    } on DioError {
      return EditionResult();
    }
  }

  static Future<SettingResult> getPasswordValdation() async {
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.get(
        path: '/api/services/app/Profile/GetPasswordComplexitySetting',
      );
      if (response?.statusCode == 200) {
        logWTF(response?.data?['result']);
        return SettingResult.fromMap(
          response?.data?['result'],
        );
      } else {
        return SettingResult();
      }
    } on DioError {
      return SettingResult();
    }
  }

  static Future<bool> checkTeamName({String? teamName}) async {
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.post(
        path: '/api/services/app/Account/IsTenantAvailable',
        mapData: <String, dynamic>{
          'tenancyName': teamName,
        },
      );
      if (response?.statusCode == 200 &&
          response?.data?['result']['tenantId'] == null) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  static Future<bool> registerApi({
    String? emailAddress,
    String? fName,
    String? lastName,
    String? password,
    String? editionsId,
    String? userName,
  }) async {
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.post(
        path: '/api/services/app/TenantRegistration/RegisterTenant',
        mapData: <String, dynamic>{
          'adminEmailAddress': emailAddress,
          'adminFirstName': fName,
          'adminLastName': lastName,
          'adminPassword': password,
          'captchaResponse': null,
          'editionId': editionsId,
          'name': userName,
          'tenancyName': userName,
        },
      );
      if (response?.statusCode == 200 && response?.data?['success'] == true) {
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  static Future<bool> loginApi({
    String? emailAddress,
    String? password,
    String? userName,
  }) async {
    final Map<String, tz.Location> locations = tz.timeZoneDatabase.locations;
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.post(
        path: '/api/TokenAuth/Authenticate',
        mapData: <String, dynamic>{
          'ianaTimeZone': locations.keys.first,
          'userNameOrEmailAddress': emailAddress,
          'rememberClient': false,
          'password': password,
          'returnUrl': null,
          'singleSignIn': false,
          'tenantName': userName,
        },
      );
      if (response?.statusCode == 200 && response?.data?['success'] == true) {
        logWTF(response?.data);
        await UserProvider.onLogin(
          'userDataKey',
          response?.data?['result']['accessToken'],
        );
        return true;
      } else {
        return false;
      }
    } on DioError {
      return false;
    }
  }

  static Future<UserData> getLoginInfo() async {
    try {
      final Response<Map<String, dynamic>?>? response = await APIService.get(
        path: '/api/services/app/Session/GetCurrentLoginInformations',
      );
      if (response?.statusCode == 200) {
        var data = UserData.fromMap(response?.data?['result']);
        LocalStore.tenantName(data.tenant?.name);
        LocalStore.userEmail(data.user?.emailAddress);
        return data;
      } else {
        return UserData();
      }
    } on DioError {
      await Get.offAllNamed<void>(Routes.ON_BOARD);
      appSnackbar(
        message: 'Please Login Again!',
        snackbarState: SnackbarState.warning,
      );

      return UserData();
    }
  }
}
