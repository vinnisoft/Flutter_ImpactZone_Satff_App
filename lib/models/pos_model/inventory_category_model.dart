import '../../export.dart';

class InventoryResponse {
  final bool? success;
  final String? message;
  final List<InventoryItem>? data;

  InventoryResponse({
    this.success,
    this.message,
    this.data,
  });

  factory InventoryResponse.fromJson(Map<String, dynamic> json) {
    return InventoryResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => InventoryItem.fromJson(item))
          .toList(),
    );
  }
}

class InventoryItem {
  final String? id;
  final String? catalogImage;
  final String? type;
  final String? name;
  final String? upc;
  final String? category;
  final String? itemCaption;
  final bool? isRecurring;
  final bool? isOneTimePurchaseable;
  final bool? isRedeemable;
  final String? productType;
  final List<String>? clubs;
  final List<Tax>? taxes;
  final double? netPrice;
  final bool? allowDiscount;
  final DefaultDiscount? defaultDiscount;
  final bool? overrideDiscount;
  final int? minimumQuantity;
  RxInt defaultQuantity;
  final int? maximumQuantity;
  final bool? allowUnlimited;
  final int? moreThan1;
  final int? unitDiscount1;
  final int? moreThan2;
  final int? unitDiscount2;
  final int? moreThan3;
  final int? unitDiscount3;
  final List<dynamic>? filterSet;
  final List<dynamic>? tags;
  final List<dynamic>? variations;
  RxDouble finalNetPrice=0.0.obs;
  RxDouble finalTotal=0.0.obs;
  RxDouble totalTax;
  RxDouble totalDiscount;
  RxBool isWaveTax;
  RxDouble currentDiscountedPrice=0.0.obs;
  InventoryItem({
    this.id,
    this.catalogImage,
    this.type,
    this.name,
    this.upc,
    this.category,
    this.itemCaption,
    this.isRecurring,
    this.isOneTimePurchaseable,
    this.isRedeemable,
    this.productType,
    this.clubs,
    this.taxes,
    this.netPrice,
    this.allowDiscount,
    this.defaultDiscount,
    this.overrideDiscount,
    this.minimumQuantity,
    required int defaultQuantity,
    this.maximumQuantity,
    this.allowUnlimited,
    this.moreThan1,
    this.unitDiscount1,
    this.moreThan2,
    this.unitDiscount2,
    this.moreThan3,
    this.unitDiscount3,
    this.filterSet,
    this.tags,
    this.variations,
    RxDouble? finalTotal,
    RxDouble? finalNetPrice,
    RxDouble? totalTax,
    RxDouble? totalDiscount,
    RxBool? isWaveTax,
    RxDouble? currentDiscountedPrice,
  }) : defaultQuantity = defaultQuantity.obs,finalNetPrice = finalNetPrice ?? 0.0.obs,
        finalTotal = finalTotal ?? 0.0.obs,
  totalTax = totalTax ?? 0.0.obs,
        totalDiscount = totalDiscount ?? 0.0.obs,
        currentDiscountedPrice = currentDiscountedPrice ?? 0.0.obs,
        isWaveTax = isWaveTax ?? false.obs;

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['_id'],
      catalogImage: json['catalogImage'],
      type: json['type'],
      name: json['name'],
      upc: json['upc'],
      category: json['category'],
      itemCaption: json['itemCaption'],
      isRecurring: json['isRecurring'],
      isOneTimePurchaseable: json['isOneTimePurchaseable'],
      isRedeemable: json['isRedeemable'],
      productType: json['productType'],
      clubs: List<String>.from(json['clubs'] ?? []),
      taxes: (json['taxes'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e))
          .toList(),
      netPrice: (json['netPrice'] as num?)?.toDouble(),
      allowDiscount: json['allowDiscount'],
      defaultDiscount: json['defaultDiscount'] != null
          ? DefaultDiscount.fromJson(json['defaultDiscount'])
          : DefaultDiscount(amount: 0.0),
      overrideDiscount: json['overrideDiscount'],
      minimumQuantity: json['minimumQuantity'],
      defaultQuantity: json['defaultQuantity'] ?? 1,
      maximumQuantity: json['maximumQuantity'],
      allowUnlimited: json['allowUnlimited'],
      moreThan1: json['moreThan1'],
      unitDiscount1: json['unitDiscount1'],
      moreThan2: json['moreThan2'],
      unitDiscount2: json['unitDiscount2'],
      moreThan3: json['moreThan3'],
      unitDiscount3: json['unitDiscount3'],
      filterSet: json['filterSet'],
      tags: json['tags'],
      variations: json['variations'],
    );
  }
}

class Tax {
  final String? id;
  final double? taxRatePercentage;
  final String? taxRateName;
  final String? taxRateType;

  Tax({
    this.id,
    this.taxRatePercentage,
    this.taxRateName,
    this.taxRateType,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      id: json['_id'],
      taxRatePercentage: (json['taxRatePercentage'] as num?)?.toDouble(),
      taxRateName: json['taxRateName'],
      taxRateType: json['taxRateType'],
    );
  }
}

class DefaultDiscount {
  final String? id;
  final String? discountName;
  final String? discountCode;
  final String? amountType;
       double amount;
  final String? startDate;
  final String? endDate;
  final bool? indefinite;
  final bool? combinedDiscount;
  final bool? itemUsedMoreThanOnce;
  final bool? itemBogo;
  final bool? multiItemDiscountCheck;
  final List<MultiItemDiscount2>? multiItemDiscount;
  final List<dynamic>? membershipType;
  final List<dynamic>? days;
  final String? startTime;
  final String? endTime;
  final bool? specificTime;

  DefaultDiscount({
    this.id,
    this.discountName,
    this.discountCode,
    this.amountType,
    double? amount,
    this.startDate,
    this.endDate,
    this.indefinite,
    this.combinedDiscount,
    this.itemUsedMoreThanOnce,
    this.itemBogo,
    this.multiItemDiscountCheck,
    this.multiItemDiscount,
    this.membershipType,
    this.days,
    this.startTime,
    this.endTime,
    this.specificTime,
  }): amount = amount ?? 0.0;

  factory DefaultDiscount.fromJson(Map<String, dynamic> json) {
    return DefaultDiscount(
      id: json['_id'],
      discountName: json['discountName'],
      discountCode: json['discountCode'],
      amountType: json['amountType'],
      amount: (json['amount'] as num?)?.toDouble(),
      startDate: json['startDate'],
      endDate: json['endDate'],
      indefinite: json['indefinite'],
      combinedDiscount: json['combinedDiscount'],
      itemUsedMoreThanOnce: json['itemUsedMoreThanOnce'],
      itemBogo: json['itemBogo'],
      multiItemDiscountCheck: json['multiItemDiscountCheck'],
      multiItemDiscount: (json['multiItemDiscount'] as List<dynamic>?)
          ?.map((e) => MultiItemDiscount2.fromJson(e))
          .toList(),
      membershipType: json['membershipType'],
      days: json['days'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      specificTime: json['specificTime'],
    );
  }
}

class MultiItemDiscount2 {
  final int? noOfItems;
  final String? amountType;
  final double? amount;

  MultiItemDiscount2({
    this.noOfItems,
    this.amountType,
    this.amount,
  });

  factory MultiItemDiscount2.fromJson(Map<String, dynamic> json) {
    return MultiItemDiscount2(
      noOfItems: json['noOfItems'],
      amountType: json['amountType'],
      amount: (json['amount'] as num?)?.toDouble(),
    );
  }
}
