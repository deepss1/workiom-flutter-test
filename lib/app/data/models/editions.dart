// To parse this JSON data, do
//
//     final editions = editionsFromMap(jsonString);

import 'dart:convert';

Editions editionsFromMap(String str) => Editions.fromMap(json.decode(str));

String editionsToMap(Editions data) => json.encode(data.toMap());

class Editions {
  Editions({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory Editions.fromMap(Map<String, dynamic> json) => Editions(
        result: json['result'] == null
            ? null
            : EditionResult.fromMap(json['result']),
        targetUrl: json['targetUrl'],
        success: json['success'],
        error: json['error'],
        unAuthorizedRequest: json['unAuthorizedRequest'],
        abp: json['__abp'],
      );
  final EditionResult? result;
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

class EditionResult {
  EditionResult({
    this.allFeatures,
    this.editionsWithFeatures,
    this.tenantEditionId,
  });

  factory EditionResult.fromMap(Map<String, dynamic> json) => EditionResult(
        allFeatures: json['allFeatures'] == null
            ? <AllFeature>[]
            : List<AllFeature>.from(
                json['allFeatures']!.map((dynamic x) => AllFeature.fromMap(x))),
        editionsWithFeatures: json['editionsWithFeatures'] == null
            ? <EditionsWithFeature>[]
            : List<EditionsWithFeature>.from(json['editionsWithFeatures']!
                .map((dynamic x) => EditionsWithFeature.fromMap(x))),
        tenantEditionId: json['tenantEditionId'],
      );
  final List<AllFeature>? allFeatures;
  final List<EditionsWithFeature>? editionsWithFeatures;
  final dynamic tenantEditionId;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'allFeatures': allFeatures == null
            ? <dynamic>[]
            : List<dynamic>.from(
                allFeatures!.map<dynamic>((AllFeature x) => x.toMap())),
        'editionsWithFeatures': editionsWithFeatures == null
            ? <dynamic>[]
            : List<dynamic>.from(editionsWithFeatures!
                .map<dynamic>((EditionsWithFeature x) => x.toMap())),
        'tenantEditionId': tenantEditionId,
      };
}

class AllFeature {
  AllFeature({
    this.name,
    this.parentName,
    this.displayName,
    this.description,
    this.defaultValue,
    this.metadata,
    this.inputType,
  });

  factory AllFeature.fromMap(Map<String, dynamic> json) => AllFeature(
        name: json['name'],
        parentName: json['parentName'],
        displayName: json['displayName'],
        description: json['description'],
        defaultValue: json['defaultValue'],
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromMap(json['metadata']),
        inputType: json['inputType'] == null
            ? null
            : InputType.fromMap(json['inputType']),
      );
  final String? name;
  final dynamic parentName;
  final String? displayName;
  final String? description;
  final String? defaultValue;
  final Metadata? metadata;
  final InputType? inputType;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'parentName': parentName,
        'displayName': displayName,
        'description': description,
        'defaultValue': defaultValue,
        'metadata': metadata?.toMap(),
        'inputType': inputType?.toMap(),
      };
}

class InputType {
  InputType({
    this.name,
    this.attributes,
    this.validator,
    this.itemSource,
  });

  factory InputType.fromMap(Map<String, dynamic> json) => InputType(
        name: json['name'],
        attributes: json['attributes'] == null
            ? null
            : InputTypeAttributes.fromMap(json['attributes']),
        validator: json['validator'] == null
            ? null
            : Validator.fromMap(json['validator']),
        itemSource: json['itemSource'],
      );
  final String? name;
  final InputTypeAttributes? attributes;
  final Validator? validator;
  final dynamic itemSource;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'attributes': attributes?.toMap(),
        'validator': validator?.toMap(),
        'itemSource': itemSource,
      };
}

class InputTypeAttributes {
  InputTypeAttributes();

  factory InputTypeAttributes.fromMap(Map<String, dynamic> json) =>
      InputTypeAttributes();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class Validator {
  Validator({
    this.minValue,
    this.maxValue,
    this.name,
    this.attributes,
  });

  factory Validator.fromMap(Map<String, dynamic> json) => Validator(
        minValue: json['minValue'],
        maxValue: json['maxValue'],
        name: json['name'],
        attributes: json['attributes'] == null
            ? null
            : ValidatorAttributes.fromMap(json['attributes']),
      );
  final int? minValue;
  final int? maxValue;
  final String? name;
  final ValidatorAttributes? attributes;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'minValue': minValue,
        'maxValue': maxValue,
        'name': name,
        'attributes': attributes?.toMap(),
      };
}

class ValidatorAttributes {
  ValidatorAttributes({
    this.minValue,
    this.maxValue,
  });

  factory ValidatorAttributes.fromMap(Map<String, dynamic> json) =>
      ValidatorAttributes(
        minValue: json['MinValue'],
        maxValue: json['MaxValue'],
      );
  final int? minValue;
  final int? maxValue;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'MinValue': minValue,
        'MaxValue': maxValue,
      };
}

class Metadata {
  Metadata({
    this.dataType,
    this.isVisibleOnPricingTable,
    this.isVisibleOnTenantSubscription,
  });

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata(
        dataType: json['dataType'],
        isVisibleOnPricingTable: json['isVisibleOnPricingTable'],
        isVisibleOnTenantSubscription: json['isVisibleOnTenantSubscription'],
      );
  final int? dataType;
  final bool? isVisibleOnPricingTable;
  final bool? isVisibleOnTenantSubscription;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'dataType': dataType,
        'isVisibleOnPricingTable': isVisibleOnPricingTable,
        'isVisibleOnTenantSubscription': isVisibleOnTenantSubscription,
      };
}

class EditionsWithFeature {
  EditionsWithFeature({
    this.edition,
    this.featureValues,
  });

  factory EditionsWithFeature.fromMap(Map<String, dynamic> json) =>
      EditionsWithFeature(
        edition:
            json['edition'] == null ? null : Edition.fromMap(json['edition']),
        featureValues: json['featureValues'] == null
            ? <FeatureValue>[]
            : List<FeatureValue>.from(json['featureValues']!
                .map((dynamic x) => FeatureValue.fromMap(x))),
      );
  final Edition? edition;
  final List<FeatureValue>? featureValues;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'edition': edition?.toMap(),
        'featureValues': featureValues == null
            ? <dynamic>[]
            : List<dynamic>.from(
                featureValues!.map<dynamic>((FeatureValue x) => x.toMap())),
      };
}

class Edition {
  Edition({
    this.name,
    this.displayName,
    this.publicDescription,
    this.internalDescription,
    this.isPublished,
    this.isRegistrable,
    this.type,
    this.minimumUsersCount,
    this.monthlyPrice,
    this.annualPrice,
    this.waitingDayAfterExpire,
    this.trialDayCount,
    this.countAllowExtendTrial,
    this.hasTrial,
    this.disableWorkspaceAfterExpire,
    this.isMostPopular,
    this.doNotSendVerifyEmail,
    this.expiringEdition,
    this.id,
  });

  factory Edition.fromMap(Map<String, dynamic> json) => Edition(
        name: json['name'],
        displayName: json['displayName'],
        publicDescription: json['publicDescription'],
        internalDescription: json['internalDescription'],
        isPublished: json['isPublished'],
        isRegistrable: json['isRegistrable'],
        type: json['type'],
        minimumUsersCount: json['minimumUsersCount'],
        monthlyPrice: json['monthlyPrice'],
        annualPrice: json['annualPrice'],
        waitingDayAfterExpire: json['waitingDayAfterExpire'],
        trialDayCount: json['trialDayCount'],
        countAllowExtendTrial: json['countAllowExtendTrial'],
        hasTrial: json['hasTrial'],
        disableWorkspaceAfterExpire: json['disableWorkspaceAfterExpire'],
        isMostPopular: json['isMostPopular'],
        doNotSendVerifyEmail: json['doNotSendVerifyEmail'],
        expiringEdition: json['expiringEdition'] == null
            ? null
            : ExpiringEdition.fromMap(json['expiringEdition']),
        id: json['id'],
      );
  final String? name;
  final String? displayName;
  final dynamic publicDescription;
  final dynamic internalDescription;
  final bool? isPublished;
  final bool? isRegistrable;
  final num? type;
  final num? minimumUsersCount;
  final num? monthlyPrice;
  final num? annualPrice;
  final dynamic waitingDayAfterExpire;
  final num? trialDayCount;
  final num? countAllowExtendTrial;
  final bool? hasTrial;
  final bool? disableWorkspaceAfterExpire;
  final bool? isMostPopular;
  final dynamic doNotSendVerifyEmail;
  final ExpiringEdition? expiringEdition;
  final num? id;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'displayName': displayName,
        'publicDescription': publicDescription,
        'internalDescription': internalDescription,
        'isPublished': isPublished,
        'isRegistrable': isRegistrable,
        'type': type,
        'minimumUsersCount': minimumUsersCount,
        'monthlyPrice': monthlyPrice,
        'annualPrice': annualPrice,
        'waitingDayAfterExpire': waitingDayAfterExpire,
        'trialDayCount': trialDayCount,
        'countAllowExtendTrial': countAllowExtendTrial,
        'hasTrial': hasTrial,
        'disableWorkspaceAfterExpire': disableWorkspaceAfterExpire,
        'isMostPopular': isMostPopular,
        'doNotSendVerifyEmail': doNotSendVerifyEmail,
        'expiringEdition': expiringEdition?.toMap(),
        'id': id,
      };
}

class ExpiringEdition {
  ExpiringEdition({
    this.name,
    this.displayName,
    this.id,
  });

  factory ExpiringEdition.fromMap(Map<String, dynamic> json) => ExpiringEdition(
        name: json['name'],
        displayName: json['displayName'],
        id: json['id'],
      );
  final String? name;
  final String? displayName;
  final int? id;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'displayName': displayName,
        'id': id,
      };
}

class FeatureValue {
  FeatureValue({
    this.name,
    this.value,
  });

  factory FeatureValue.fromMap(Map<String, dynamic> json) => FeatureValue(
        name: json['name'],
        value: json['value'],
      );
  final String? name;
  final String? value;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'value': value,
      };
}
