class MyAppointmentListResponseModel {
  bool? success;
  String? message;
  List<MyAppointmentDataModel>? data;

  MyAppointmentListResponseModel({this.success, this.message, this.data});

  MyAppointmentListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MyAppointmentDataModel>[];
      json['data'].forEach((v) {
        data!.add(new MyAppointmentDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyAppointmentDataModel {
  String? sId;
  String? event;
  String? startTime;
  String? endTime;
  int? duration;
  String? eventDate;
  String? eventType;
  String? status;
  String? scheduleDay;
  bool? isMemberVerified;
  String? location;
  String? resources;

  MyAppointmentDataModel(
      {this.sId,
        this.event,
        this.startTime,
        this.endTime,
        this.duration,
        this.eventDate,
        this.eventType,
        this.status,
        this.scheduleDay,
        this.isMemberVerified,
        this.resources,
        this.location});

  MyAppointmentDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    event = json['event'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
    eventDate = json['eventDate'];
    eventType = json['eventType'];
    status = json['status'];
    scheduleDay = json['scheduleDay'];
    isMemberVerified = json['isMemberVerified'];
    location = json['location'];
    resources = json['resources'];
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
    data['status'] = status;
    data['scheduleDay'] = scheduleDay;
    data['isMemberVerified'] = isMemberVerified;
    data['location'] = location;
    data['resources'] = resources;
    return data;
  }
}
