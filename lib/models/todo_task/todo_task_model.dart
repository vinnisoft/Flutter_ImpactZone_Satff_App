class EmployeeTaskResponseModel {
  bool? success;
  String? message;
  List<EmployeeTaskModel>? data;

  EmployeeTaskResponseModel({this.success, this.message, this.data});

  EmployeeTaskResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EmployeeTaskModel>[];
      json['data'].forEach((v) {
        data!.add(EmployeeTaskModel.fromJson(v));
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
}

class EmployeeTaskModel {
  String? id;
  String? member;
  DateTime? dueDate;
  String? taskType;
  String? taskTitle;
  String? message;
  String? status;
  bool? isActive;
  bool? bookmarkStatus;

  EmployeeTaskModel({
    this.id,
    this.member,
    this.dueDate,
    this.taskType,
    this.taskTitle,
    this.message,
    this.status,
    this.isActive,
    this.bookmarkStatus,
  });

  EmployeeTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    member = json['member'];
    dueDate = json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null;
    taskType = json['taskType'];
    taskTitle = json['taskTitle'];
    message = json['message'];
    status = json['status'];
    isActive = json['isActive'];
    bookmarkStatus = json['bookmarkStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = id;
    json['member'] = member;
    json['dueDate'] = dueDate?.toIso8601String();
    json['taskType'] = taskType;
    json['taskTitle'] = taskTitle;
    json['message'] = message;
    json['status'] = status;
    json['isActive'] = isActive;
    json['bookmarkStatus'] = bookmarkStatus;
    return json;
  }
}
