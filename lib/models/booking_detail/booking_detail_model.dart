class BookingDetailResponseModel {
  bool? success;
  String? message;
  BookingDetailDataModel? data;

  BookingDetailResponseModel({this.success, this.message, this.data});

  BookingDetailResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? BookingDetailDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BookingDetailDataModel {
  String? id;
  String? company;
  EventModel? event;
  StaffModel? staff;
  bool? isStaffVerified;
  String? startTime;
  String? endTime;
  int? duration;
  String? scheduleClass;
  String? type;
  String? eventDate;
  String? eventType;
  String? resources;
  String? status;
  dynamic useService;
  bool? isMemberVerified;
  String? location;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  List<MemberModel>? member;

  BookingDetailDataModel({
    this.id,
    this.company,
    this.event,
    this.staff,
    this.isStaffVerified,
    this.startTime,
    this.endTime,
    this.duration,
    this.scheduleClass,
    this.type,
    this.eventDate,
    this.eventType,
    this.resources,
    this.status,
    this.useService,
    this.isMemberVerified,
    this.location,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.member,
  });

  BookingDetailDataModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    company = json['company'];
    event = json['event'] != null ? EventModel.fromJson(json['event']) : null;
    staff = json['staff'] != null ? StaffModel.fromJson(json['staff']) : null;
    isStaffVerified = json['isStaffVerified'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
    scheduleClass = json['scheduleClass'];
    type = json['type'];
    eventDate = json['eventDate'];
    eventType = json['eventType'];
    resources = json['resources'];
    status = json['status'];
    useService = json['useService'];
    isMemberVerified = json['isMemberVerified'];
    location = json['location'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['member'] != null) {
      member = [];
      json['member'].forEach((v) {
        member!.add(MemberModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['company'] = company;
    if (event != null) data['event'] = event!.toJson();
    if (staff != null) data['staff'] = staff!.toJson();
    data['isStaffVerified'] = isStaffVerified;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['duration'] = duration;
    data['scheduleClass'] = scheduleClass;
    data['type'] = type;
    data['eventDate'] = eventDate;
    data['eventType'] = eventType;
    data['resources'] = resources;
    data['status'] = status;
    data['useService'] = useService;
    data['isMemberVerified'] = isMemberVerified;
    data['location'] = location;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EventModel {
  String? id;
  String? name;
  int? defaultMaxAttendes;
  int? maximumWaitlist;
  RequiredToComplete? requiredToComplete;
  List<String>? calanderDisplay;
  List<String>? popupDisplay;
  String? boxColor;
  String? textColor;
  List<EventService>? eventService;

  EventModel({
    this.id,
    this.name,
    this.defaultMaxAttendes,
    this.maximumWaitlist,
    this.requiredToComplete,
    this.calanderDisplay,
    this.popupDisplay,
    this.boxColor,
    this.textColor,
    this.eventService,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    defaultMaxAttendes = json['defaultMaxAttendes'];
    maximumWaitlist = json['maximumWaitlist'];
    requiredToComplete = json['requiredtoComplete'] != null
        ? RequiredToComplete.fromJson(json['requiredtoComplete'])
        : null;
    calanderDisplay = json['calanderDisplay']?.cast<String>();
    popupDisplay = json['popupDisplay']?.cast<String>();
    boxColor = json['boxColor'];
    textColor = json['textColor'];
    if (json['eventService'] != null) {
      eventService = [];
      json['eventService'].forEach((v) {
        eventService!.add(EventService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id;
    data['name'] = name;
    data['defaultMaxAttendes'] = defaultMaxAttendes;
    data['maximumWaitlist'] = maximumWaitlist;
    if (requiredToComplete != null) {
      data['requiredtoComplete'] = requiredToComplete!.toJson();
    }
    data['calanderDisplay'] = calanderDisplay;
    data['popupDisplay'] = popupDisplay;
    data['boxColor'] = boxColor;
    data['textColor'] = textColor;
    if (eventService != null) {
      data['eventService'] = eventService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequiredToComplete {
  bool? employee;
  bool? location;
  bool? member;
  bool? memberVerification;
  bool? employeeVerification;
  bool? autoComplete;

  RequiredToComplete({
    this.employee,
    this.location,
    this.member,
    this.memberVerification,
    this.employeeVerification,
    this.autoComplete,
  });

  RequiredToComplete.fromJson(Map<String, dynamic> json) {
    employee = json['employee'];
    location = json['location'];
    member = json['member'];
    memberVerification = json['memberVerification'];
    employeeVerification = json['employeeVerification'];
    autoComplete = json['autoComplete'];
  }

  Map<String, dynamic> toJson() {
    return {
      'employee': employee,
      'location': location,
      'member': member,
      'memberVerification': memberVerification,
      'employeeVerification': employeeVerification,
      'autoComplete': autoComplete,
    };
  }
}

class EventService {
  String? id;
  String? eventLevel;
  String? eventSetup;
  int? duration;
  List<String>? services;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  EventService({
    this.id,
    this.eventLevel,
    this.eventSetup,
    this.duration,
    this.services,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  EventService.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    eventLevel = json['eventLevel'];
    eventSetup = json['eventSetup'];
    duration = json['duration'];
    services = json['services']?.cast<String>();
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'eventLevel': eventLevel,
      'eventSetup': eventSetup,
      'duration': duration,
      'services': services,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class StaffModel {
  String? id;
  String? firstName;
  String? lastName;
  String? middleInitial;

  StaffModel({this.id, this.firstName, this.lastName, this.middleInitial});

  StaffModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleInitial = json['middleInitial'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'middleInitial': middleInitial,
    };
  }
}

class MemberModel {
  String? id;
  String? firstName;
  String? lastName;
  List<dynamic>? services;
  String? member;
  bool? isMemberVerified;
  String? status;

  MemberModel({
    this.id,
    this.firstName,
    this.lastName,
    this.services,
    this.member,
    this.isMemberVerified,
    this.status,
  });

  MemberModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    services = json['services'];
    member = json['member'];
    isMemberVerified = json['isMemberVerified'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'services': services,
      'member': member,
      'isMemberVerified': isMemberVerified,
      'status': status,
    };
  }
}
