class MemberListResponseModel {
  bool? success;
  String? message;
  List<MemberModel>? data;

  MemberListResponseModel({this.success, this.message, this.data});

  MemberListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MemberModel>[];
      json['data'].forEach((v) {
        data!.add(MemberModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['success'] = success;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.map((v) => v.toJson()).toList();
    }
    return json;
  }

  @override
  String toString() {
    return 'MemberListResponseModel(success: $success, message: $message, data count: ${data?.length})';
  }
}

class MemberModel {
  String? id;
  int? barCode;
  String? firstName;
  String? mI;
  String? lastName;
  String? dob;
  String? image;
  String? primaryPhone;
  String? createdAt;
  List<dynamic>? notification;

  MemberModel({
    this.id,
    this.barCode,
    this.firstName,
    this.mI,
    this.lastName,
    this.dob,
    this.image,
    this.primaryPhone,
    this.createdAt,
    this.notification,
  });

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    barCode = json['barCode'];
    firstName = json['firstName'];
    mI = json['MI'];
    lastName = json['lastName'];
    dob = json['dob'];
    image = json['image'];
    primaryPhone = json['primaryPhone'];
    createdAt = json['createdAt'];
    notification = json['notification'] != null ? List<dynamic>.from(json['notification']) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = id;
    json['barCode'] = barCode;
    json['firstName'] = firstName;
    json['MI'] = mI;
    json['lastName'] = lastName;
    json['dob'] = dob;
    json['image'] = image;
    json['primaryPhone'] = primaryPhone;
    json['createdAt'] = createdAt;
    json['notification'] = notification;
    return json;
  }

  @override
  String toString() {
    return '$firstName $lastName (barcode: $barCode)';
  }
}
