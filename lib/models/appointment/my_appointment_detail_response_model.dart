class MyAppointmentDetailResponseModel {
  bool? success;
  String? message;
  MyAppointmentDetailDataModel? data;

  MyAppointmentDetailResponseModel({this.success, this.message, this.data});

  MyAppointmentDetailResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? MyAppointmentDetailDataModel.fromJson(json['data']) : null;
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

class MyAppointmentDetailDataModel {
  String? sId;
  String? event;
  String? startTime;
  String? endTime;
  int? duration;
  String? eventDate;
  String? eventType;
  String? resources;
  String? status;
  List<Member>? members;

  MyAppointmentDetailDataModel(
      {this.sId,
        this.event,
        this.startTime,
        this.endTime,
        this.duration,
        this.eventDate,
        this.eventType,
        this.resources,
        this.status,
        this.members});

  MyAppointmentDetailDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    event = json['event'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
    eventDate = json['eventDate'];
    eventType = json['eventType'];
    resources = json['resources'];
    status = json['status'];
    if (json['members'] != null) {
      members = <Member>[];
      json['members'].forEach((v) {
        members!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['event'] = event;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['duration'] = duration;
    data['eventDate'] = eventDate;
    data['eventType'] = eventType;
    data['resources'] = resources;
    data['status'] = status;
    if (members != null) {
      data['member'] = members!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  String? sId;
  String? firstName;
  String? mI;
  String? lastName;
  String? image;

  Member({this.sId, this.firstName, this.mI, this.lastName, this.image});

  Member.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    mI = json['MI'];
    lastName = json['lastName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['MI'] = mI;
    data['lastName'] = lastName;
    data['image'] = image;
    return data;
  }
}
