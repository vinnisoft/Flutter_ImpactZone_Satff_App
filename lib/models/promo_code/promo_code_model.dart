class PromoCodeResponse {
  final bool? success;
  final String? message;
  final PromoCodeData? data;

  PromoCodeResponse({this.success, this.message, this.data});

  factory PromoCodeResponse.fromJson(Map<String, dynamic> json) {
    return PromoCodeResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? PromoCodeData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.toJson(),
  };
}

class PromoCodeData {
  final String? id;
  final String? company;
  final String? discountName;
  final String? discountCode;
  final String? amountType;
  final num? amount;
  final dynamic availableDiscount;
  final String? startDate;
  final String? endDate;
  final bool? indefinite;
  final bool? combinedDiscount;
  final List<String>? combineDiscountWith;
  final bool? itemUsedMoreThanOnce;
  final bool? itemBogo;
  final List<String>? bogoDiscount;
  final bool? multiItemDiscountCheck;
  final List<MultiItemDiscount>? multiItemDiscount;
  final String? description;
  final List<String>? services;
  final List<dynamic>? salesCode;
  final List<dynamic>? membershipType;
  final List<dynamic>? days;
  final String? startTime;
  final String? endTime;
  final bool? specificTime;
  final bool? isActive;
  final bool? isDeleted;
  final bool? availableOnline;
  final String? howThisDiscountUsed;
  final bool? limitTotalUse;
  final int? totalUse;
  final int? usePerUser;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  PromoCodeData({
    this.id,
    this.company,
    this.discountName,
    this.discountCode,
    this.amountType,
    this.amount,
    this.availableDiscount,
    this.startDate,
    this.endDate,
    this.indefinite,
    this.combinedDiscount,
    this.combineDiscountWith,
    this.itemUsedMoreThanOnce,
    this.itemBogo,
    this.bogoDiscount,
    this.multiItemDiscountCheck,
    this.multiItemDiscount,
    this.description,
    this.services,
    this.salesCode,
    this.membershipType,
    this.days,
    this.startTime,
    this.endTime,
    this.specificTime,
    this.isActive,
    this.isDeleted,
    this.availableOnline,
    this.howThisDiscountUsed,
    this.limitTotalUse,
    this.totalUse,
    this.usePerUser,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PromoCodeData.fromJson(Map<String, dynamic> json) {
    return PromoCodeData(
      id: json['_id'],
      company: json['company'],
      discountName: json['discountName'],
      discountCode: json['discountCode'],
      amountType: json['amountType'],
      amount: json['amount'],
      availableDiscount: json['availableDiscount'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      indefinite: json['indefinite'],
      combinedDiscount: json['combinedDiscount'],
      combineDiscountWith: (json['combineDiscountWith'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      itemUsedMoreThanOnce: json['itemUsedMoreThanOnce'],
      itemBogo: json['itemBogo'],
      bogoDiscount: (json['bogoDiscount'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      multiItemDiscountCheck: json['multiItemDiscountCheck'],
      multiItemDiscount: (json['multiItemDiscount'] as List<dynamic>?)
          ?.map((e) => MultiItemDiscount.fromJson(e))
          .toList(),
      description: json['description'],
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      salesCode: json['salesCode'],
      membershipType: json['membershipType'],
      days: json['days'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      specificTime: json['specificTime'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      availableOnline: json['availableOnline'],
      howThisDiscountUsed: json['howThisDiscountUsed'],
      limitTotalUse: json['limitTotalUse'],
      totalUse: json['totalUse'],
      usePerUser: json['usePerUser'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'company': company,
    'discountName': discountName,
    'discountCode': discountCode,
    'amountType': amountType,
    'amount': amount,
    'availableDiscount': availableDiscount,
    'startDate': startDate,
    'endDate': endDate,
    'indefinite': indefinite,
    'combinedDiscount': combinedDiscount,
    'combineDiscountWith': combineDiscountWith,
    'itemUsedMoreThanOnce': itemUsedMoreThanOnce,
    'itemBogo': itemBogo,
    'bogoDiscount': bogoDiscount,
    'multiItemDiscountCheck': multiItemDiscountCheck,
    'multiItemDiscount':
    multiItemDiscount?.map((e) => e.toJson()).toList(),
    'description': description,
    'services': services,
    'salesCode': salesCode,
    'membershipType': membershipType,
    'days': days,
    'startTime': startTime,
    'endTime': endTime,
    'specificTime': specificTime,
    'isActive': isActive,
    'isDeleted': isDeleted,
    'availableOnline': availableOnline,
    'howThisDiscountUsed': howThisDiscountUsed,
    'limitTotalUse': limitTotalUse,
    'totalUse': totalUse,
    'usePerUser': usePerUser,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
  };
}

class MultiItemDiscount {
  final int? noOfItems;
  final String? amountType;
  final num? amount;

  MultiItemDiscount({this.noOfItems, this.amountType, this.amount});

  factory MultiItemDiscount.fromJson(Map<String, dynamic> json) {
    return MultiItemDiscount(
      noOfItems: json['noOfItems'],
      amountType: json['amountType'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'noOfItems': noOfItems,
    'amountType': amountType,
    'amount': amount,
  };
}
