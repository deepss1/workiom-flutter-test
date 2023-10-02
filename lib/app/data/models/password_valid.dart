// To parse this JSON data, do
//
//     final passwordValid = passwordValidFromMap(jsonString);

import 'dart:convert';

PasswordValid passwordValidFromMap(String str) =>
    PasswordValid.fromMap(json.decode(str));

String passwordValidToMap(PasswordValid data) => json.encode(data.toMap());

class PasswordValid {
  PasswordValid({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory PasswordValid.fromMap(Map<String, dynamic> json) => PasswordValid(
        result: json['result'] == null
            ? null
            : SettingResult.fromMap(json['result']),
        targetUrl: json['targetUrl'],
        success: json['success'],
        error: json['error'],
        unAuthorizedRequest: json['unAuthorizedRequest'],
        abp: json['__abp'],
      );
  final SettingResult? result;
  final dynamic targetUrl;
  final bool? success;
  final dynamic error;
  final bool? unAuthorizedRequest;
  final bool? abp;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'result': result?.toMap(),
        'targetUrl': targetUrl,
        'success': success,
        'error': error,
        'unAuthorizedRequest': unAuthorizedRequest,
        '__abp': abp,
      };
}

class SettingResult {
  SettingResult({
    this.setting,
  });

  factory SettingResult.fromMap(Map<String, dynamic> json) => SettingResult(
        setting:
            json['setting'] == null ? null : Setting.fromMap(json['setting']),
      );
  final Setting? setting;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'setting': setting?.toMap(),
      };
}

class Setting {
  Setting({
    this.requireDigit,
    this.requireLowercase,
    this.requireNonAlphanumeric,
    this.requireUppercase,
    this.requiredLength,
  });

  factory Setting.fromMap(Map<String, dynamic> json) => Setting(
        requireDigit: json['requireDigit'],
        requireLowercase: json['requireLowercase'],
        requireNonAlphanumeric: json['requireNonAlphanumeric'],
        requireUppercase: json['requireUppercase'],
        requiredLength: json['requiredLength'],
      );
  bool? requireDigit;
  bool? requireLowercase;
  bool? requireNonAlphanumeric;
  bool? requireUppercase;
  final int? requiredLength;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'requireDigit': requireDigit,
        'requireLowercase': requireLowercase,
        'requireNonAlphanumeric': requireNonAlphanumeric,
        'requireUppercase': requireUppercase,
        'requiredLength': requiredLength,
      };
}
