class MemberDetailResponseModel {
  bool? success;
  String? message;
  MemberDetailDataModel? data;

  MemberDetailResponseModel({this.success, this.message, this.data});

  MemberDetailResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new MemberDetailDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MemberDetailDataModel {
  String? sId;
  String? firstName;
  String? mI;
  String? lastName;
  String? image;
  String? primaryPhone;
  String? city;
  String? email;
  String? state;
  int? zipCode;
  List<PosHistory>? posHistory;
  List<Tasks>? tasks;
  List<BillingHistory>? billingHistory;

  MemberDetailDataModel(
      {this.sId,
        this.firstName,
        this.mI,
        this.lastName,
        this.image,
        this.primaryPhone,
        this.city,
        this.email,
        this.state,
        this.zipCode,
        this.posHistory,
        this.tasks,
        this.billingHistory});

  MemberDetailDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    mI = json['MI'];
    lastName = json['lastName'];
    image = json['image'];
    primaryPhone = json['primaryPhone'];
    city = json['city'];
    email = json['email'];
    state = json['state'];
    zipCode = json['zipCode'];
    if (json['posHistory'] != null) {
      posHistory = <PosHistory>[];
      json['posHistory'].forEach((v) {
        posHistory!.add(new PosHistory.fromJson(v));
      });
    }
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
    if (json['billingHistory'] != null) {
      billingHistory = <BillingHistory>[];
      json['billingHistory'].forEach((v) {
        billingHistory!.add(new BillingHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['MI'] = mI;
    data['lastName'] = lastName;
    data['image'] = image;
    data['primaryPhone'] = primaryPhone;
    data['city'] = city;
    data['email'] = email;
    data['state'] = state;
    data['zipCode'] = zipCode;
    if (posHistory != null) {
      data['posHistory'] = posHistory!.map((v) => v.toJson()).toList();
    }
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    if (billingHistory != null) {
      data['billingHistory'] =
          billingHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PosHistory {
  int? totalCount;
  Null? expiration;
  String? date;
  var netPrice;
  String? service;
  String? createdAt;

  PosHistory(
      {this.totalCount,
        this.expiration,
        this.date,
        this.netPrice,
        this.createdAt,
        this.service});

  PosHistory.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    expiration = json['expiration'];
    date = json['date'];
    netPrice = json['netPrice'];
    createdAt = json['createdAt'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['expiration'] = expiration;
    data['date'] = date;
    data['createdAt'] = createdAt;
    data['netPrice'] = netPrice;
    data['service'] = service;
    return data;
  }
}

class Tasks {
  String? sId;
  String? employee;
  String? dueDate;
  String? taskType;
  String? taskTitle;
  String? message;
  String? createdAt;
  String? status;

  Tasks(
      {this.sId,
        this.employee,
        this.dueDate,
        this.taskType,
        this.taskTitle,
        this.message,
        this.createdAt,
        this.status});

  Tasks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    employee = json['employee'];
    dueDate = json['dueDate'];
    taskType = json['taskType'];
    taskTitle = json['taskTitle'];
    message = json['message'];
    createdAt = json['createdAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['employee'] = employee;
    data['dueDate'] = dueDate;
    data['taskType'] = taskType;
    data['taskTitle'] = taskTitle;
    data['message'] = message;
    data['createdAt'] = createdAt;
    data['status'] = status;
    return data;
  }
}

class BillingHistory {
  String? sId;
  String? name;
  String? createdAt;
  double? netPrice;
  int? minimumQuantity;
  int? defaultQuantity;
  int? maximumQuantity;
  int? quantity;

  BillingHistory(
      {this.sId,
        this.name,
        this.createdAt,
        this.netPrice,
        this.minimumQuantity,
        this.defaultQuantity,
        this.maximumQuantity,
        this.quantity});

  BillingHistory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    netPrice = json['netPrice'];
    minimumQuantity = json['minimumQuantity'];
    defaultQuantity = json['defaultQuantity'];
    maximumQuantity = json['maximumQuantity'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['netPrice'] = netPrice;
    data['minimumQuantity'] = minimumQuantity;
    data['defaultQuantity'] = defaultQuantity;
    data['maximumQuantity'] = maximumQuantity;
    data['quantity'] = quantity;
    return data;
  }
}
