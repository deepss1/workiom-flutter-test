// To parse this JSON data, do
//
//     final userProfile = userProfileFromMap(jsonString);

import 'dart:convert';

UserProfile userProfileFromMap(String str) =>
    UserProfile.fromMap(json.decode(str));

String userProfileToMap(UserProfile data) => json.encode(data.toMap());

class UserProfile {
  final UserData? result;
  final dynamic targetUrl;
  final bool? success;
  final dynamic error;
  final bool? unAuthorizedRequest;
  final bool? abp;

  UserProfile({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        result:
            json['result'] == null ? null : UserData.fromMap(json['result']),
        targetUrl: json['targetUrl'],
        success: json['success'],
        error: json['error'],
        unAuthorizedRequest: json['unAuthorizedRequest'],
        abp: json['__abp'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'result': result?.toMap(),
        'targetUrl': targetUrl,
        'success': success,
        'error': error,
        'unAuthorizedRequest': unAuthorizedRequest,
        '__abp': abp,
      };
}

class UserData {
  final User? user;
  final Tenant? tenant;
  final Application? application;

  UserData({
    this.user,
    this.tenant,
    this.application,
  });

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        user: json['user'] == null ? null : User.fromMap(json['user']),
        tenant: json['tenant'] == null ? null : Tenant.fromMap(json['tenant']),
        application: json['application'] == null
            ? null
            : Application.fromMap(json['application']),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'user': user?.toMap(),
        'tenant': tenant?.toMap(),
        'application': application?.toMap(),
      };
}

class Application {
  final String? version;
  final DateTime? releaseDate;
  final String? currency;
  final String? currencySign;
  final bool? userDelegationIsEnabled;
  final Features? features;
  final String? compatibleMobileClientVersion;
  final String? compatibleWebClientVersion;

  Application({
    this.version,
    this.releaseDate,
    this.currency,
    this.currencySign,
    this.userDelegationIsEnabled,
    this.features,
    this.compatibleMobileClientVersion,
    this.compatibleWebClientVersion,
  });

  factory Application.fromMap(Map<String, dynamic> json) => Application(
        version: json['version'],
        releaseDate: json['releaseDate'] == null
            ? null
            : DateTime.parse(json['releaseDate']),
        currency: json['currency'],
        currencySign: json['currencySign'],
        userDelegationIsEnabled: json['userDelegationIsEnabled'],
        features: json['features'] == null
            ? null
            : Features.fromMap(json['features']),
        compatibleMobileClientVersion: json['compatibleMobileClientVersion'],
        compatibleWebClientVersion: json['compatibleWebClientVersion'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'version': version,
        'releaseDate': releaseDate?.toIso8601String(),
        'currency': currency,
        'currencySign': currencySign,
        'userDelegationIsEnabled': userDelegationIsEnabled,
        'features': features?.toMap(),
        'compatibleMobileClientVersion': compatibleMobileClientVersion,
        'compatibleWebClientVersion': compatibleWebClientVersion,
      };
}

class Features {
  Features();

  factory Features.fromMap(Map<String, dynamic> json) => Features();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class Tenant {
  final String? tenancyName;
  final String? name;
  final num? ownerId;
  final dynamic logoUrl;
  final dynamic watermarkUrl;
  final DateTime? creationTime;
  final Edition? edition;
  final bool? isInReadOnlyMode;
  final bool? isSubscribed;
  final dynamic paymentPeriodType;
  final dynamic subscriptionEndDateUtc;
  final dynamic subscriptionCancelDateUtc;
  final bool? isSubscriptionCanceled;
  final dynamic subscriptionCustomName;
  final DateTime? trialPeriodStartDateUtc;
  final DateTime? trialPeriodEndDateUtc;
  final bool? allowExtendTrial;
  final bool? isInTrialPeriod;
  final bool? isUsingTrial;
  final num? trialPeriodDaysDuration;
  final bool? hasCoupon;
  final bool? isInLastPaidEdition;
  final num? waitingDayAfterExpire;
  final bool? disableTenantAfterExpire;
  final dynamic moveToEditionAfterExpire;
  final bool? setInReadOnlyModeAfterExpire;
  final dynamic templateCategoryId;
  final dynamic siloId;
  final dynamic apiUrl;
  final dynamic dnsUrl;
  final dynamic customerId;
  final num? id;

  Tenant({
    this.tenancyName,
    this.name,
    this.ownerId,
    this.logoUrl,
    this.watermarkUrl,
    this.creationTime,
    this.edition,
    this.isInReadOnlyMode,
    this.isSubscribed,
    this.paymentPeriodType,
    this.subscriptionEndDateUtc,
    this.subscriptionCancelDateUtc,
    this.isSubscriptionCanceled,
    this.subscriptionCustomName,
    this.trialPeriodStartDateUtc,
    this.trialPeriodEndDateUtc,
    this.allowExtendTrial,
    this.isInTrialPeriod,
    this.isUsingTrial,
    this.trialPeriodDaysDuration,
    this.hasCoupon,
    this.isInLastPaidEdition,
    this.waitingDayAfterExpire,
    this.disableTenantAfterExpire,
    this.moveToEditionAfterExpire,
    this.setInReadOnlyModeAfterExpire,
    this.templateCategoryId,
    this.siloId,
    this.apiUrl,
    this.dnsUrl,
    this.customerId,
    this.id,
  });

  factory Tenant.fromMap(Map<String, dynamic> json) => Tenant(
        tenancyName: json['tenancyName'],
        name: json['name'],
        ownerId: json['ownerId'],
        logoUrl: json['logoUrl'],
        watermarkUrl: json['watermarkUrl'],
        creationTime: json['creationTime'] == null
            ? null
            : DateTime.parse(json['creationTime']),
        edition:
            json['edition'] == null ? null : Edition.fromMap(json['edition']),
        isInReadOnlyMode: json['isInReadOnlyMode'],
        isSubscribed: json['isSubscribed'],
        paymentPeriodType: json['paymentPeriodType'],
        subscriptionEndDateUtc: json['subscriptionEndDateUtc'],
        subscriptionCancelDateUtc: json['subscriptionCancelDateUtc'],
        isSubscriptionCanceled: json['isSubscriptionCanceled'],
        subscriptionCustomName: json['subscriptionCustomName'],
        trialPeriodStartDateUtc: json['trialPeriodStartDateUtc'] == null
            ? null
            : DateTime.parse(json['trialPeriodStartDateUtc']),
        trialPeriodEndDateUtc: json['trialPeriodEndDateUtc'] == null
            ? null
            : DateTime.parse(json['trialPeriodEndDateUtc']),
        allowExtendTrial: json['allowExtendTrial'],
        isInTrialPeriod: json['isInTrialPeriod'],
        isUsingTrial: json['isUsingTrial'],
        trialPeriodDaysDuration: json['trialPeriodDaysDuration'],
        hasCoupon: json['hasCoupon'],
        isInLastPaidEdition: json['isInLastPaidEdition'],
        waitingDayAfterExpire: json['waitingDayAfterExpire'],
        disableTenantAfterExpire: json['disableTenantAfterExpire'],
        moveToEditionAfterExpire: json['moveToEditionAfterExpire'],
        setInReadOnlyModeAfterExpire: json['setInReadOnlyModeAfterExpire'],
        templateCategoryId: json['templateCategoryId'],
        siloId: json['siloId'],
        apiUrl: json['apiUrl'],
        dnsUrl: json['dnsUrl'],
        customerId: json['customerId'],
        id: json['id'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'tenancyName': tenancyName,
        'name': name,
        'ownerId': ownerId,
        'logoUrl': logoUrl,
        'watermarkUrl': watermarkUrl,
        'creationTime': creationTime?.toIso8601String(),
        'edition': edition?.toMap(),
        'isInReadOnlyMode': isInReadOnlyMode,
        'isSubscribed': isSubscribed,
        'paymentPeriodType': paymentPeriodType,
        'subscriptionEndDateUtc': subscriptionEndDateUtc,
        'subscriptionCancelDateUtc': subscriptionCancelDateUtc,
        'isSubscriptionCanceled': isSubscriptionCanceled,
        'subscriptionCustomName': subscriptionCustomName,
        'trialPeriodStartDateUtc': trialPeriodStartDateUtc?.toIso8601String(),
        'trialPeriodEndDateUtc': trialPeriodEndDateUtc?.toIso8601String(),
        'allowExtendTrial': allowExtendTrial,
        'isInTrialPeriod': isInTrialPeriod,
        'isUsingTrial': isUsingTrial,
        'trialPeriodDaysDuration': trialPeriodDaysDuration,
        'hasCoupon': hasCoupon,
        'isInLastPaidEdition': isInLastPaidEdition,
        'waitingDayAfterExpire': waitingDayAfterExpire,
        'disableTenantAfterExpire': disableTenantAfterExpire,
        'moveToEditionAfterExpire': moveToEditionAfterExpire,
        'setInReadOnlyModeAfterExpire': setInReadOnlyModeAfterExpire,
        'templateCategoryId': templateCategoryId,
        'siloId': siloId,
        'apiUrl': apiUrl,
        'dnsUrl': dnsUrl,
        'customerId': customerId,
        'id': id,
      };
}

class Edition {
  final String? name;
  final String? displayName;
  final int? type;
  final int? id;

  Edition({
    this.name,
    this.displayName,
    this.type,
    this.id,
  });

  factory Edition.fromMap(Map<String, dynamic> json) => Edition(
        name: json['name'],
        displayName: json['displayName'],
        type: json['type'],
        id: json['id'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'displayName': displayName,
        'type': type,
        'id': id,
      };
}

class User {
  final String? name;
  final String? surname;
  final String? userName;
  final String? emailAddress;
  final dynamic profilePictureUrl;
  final bool? allowSetPassword;
  final int? userType;
  final String? userToken;
  final dynamic lastSeen;
  final dynamic title;
  final List<dynamic>? roles;
  final int? id;

  User({
    this.name,
    this.surname,
    this.userName,
    this.emailAddress,
    this.profilePictureUrl,
    this.allowSetPassword,
    this.userType,
    this.userToken,
    this.lastSeen,
    this.title,
    this.roles,
    this.id,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json['name'],
        surname: json['surname'],
        userName: json['userName'],
        emailAddress: json['emailAddress'],
        profilePictureUrl: json['profilePictureUrl'],
        allowSetPassword: json['allowSetPassword'],
        userType: json['userType'],
        userToken: json['userToken'],
        lastSeen: json['lastSeen'],
        title: json['title'],
        roles: json['roles'] == null
            ? <dynamic>[]
            : List<dynamic>.from(json['roles']!.map((dynamic x) => x)),
        id: json['id'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'surname': surname,
        'userName': userName,
        'emailAddress': emailAddress,
        'profilePictureUrl': profilePictureUrl,
        'allowSetPassword': allowSetPassword,
        'userType': userType,
        'userToken': userToken,
        'lastSeen': lastSeen,
        'title': title,
        'roles': roles == null
            ? <dynamic>[]
            : List<dynamic>.from(roles!.map<dynamic>((dynamic x) => x)),
        'id': id,
      };
}
