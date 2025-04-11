class TaskDetailResponseModel {
  bool? success;
  String? message;
  TaskDetailDataModel? data;

  TaskDetailResponseModel({this.success, this.message, this.data});

  TaskDetailResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? TaskDetailDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['success'] = success;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }

  @override
  String toString() {
    return 'TaskDetailResponseModel(success: $success, message: $message, data: $data)';
  }
}

class TaskDetailDataModel {
  String? id;
  MemberInfo? member;
  DateTime? dueDate;
  String? taskType;
  String? taskTitle;
  String? message;
  String? status;
  DateTime? completedDate;

  TaskDetailDataModel({
    this.id,
    this.member,
    this.dueDate,
    this.taskType,
    this.taskTitle,
    this.message,
    this.status,
    this.completedDate,
  });

  TaskDetailDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    member = json['member'] != null ? MemberInfo.fromJson(json['member']) : null;
    dueDate = json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null;
    taskType = json['taskType'];
    taskTitle = json['taskTitle'];
    message = json['message'];
    status = json['status'];
    completedDate = json['completedDate'] != null ? DateTime.parse(json['completedDate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = id;
    json['member'] = member?.toJson();
    json['dueDate'] = dueDate?.toIso8601String();
    json['taskType'] = taskType;
    json['taskTitle'] = taskTitle;
    json['message'] = message;
    json['status'] = status;
    json['completedDate'] = completedDate?.toIso8601String();
    return json;
  }

  @override
  String toString() {
    return 'TaskDetailDataModel(id: $id, member: $member, taskTitle: $taskTitle, status: $status)';
  }
}

class MemberInfo {
  String? id;
  String? firstName;
  String? lastName;

  MemberInfo({this.id, this.firstName, this.lastName});

  MemberInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['_id'] = id;
    json['firstName'] = firstName;
    json['lastName'] = lastName;
    return json;
  }

  @override
  String toString() {
    return '$firstName $lastName';
  }
}
