class LoginResponseModel {
  bool? success;
  String? message;
  LoginDataModel? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new LoginDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginDataModel {
  String? sId;
  String? email;
  String? role;
  String? company;
  String? firstName;
  String? lastName;
  String? middleInitial;
  var jobTitle;
  var dob;
  var socialSecurity;
  String? barCode;
  String? accessCode;
  bool? multiClubClockIn;
  var hireDate;
  var terminationDate;
  var adpId;
  var primaryPhone;
  var workPhone;
  var workPhoneExt;
  String? mobilePhone;
  var faxPhone;
  var emergencyPhone;
  var street;
  String? city;
  String? state;
  String? zipCode;
  bool? emailNotification;
  var onlineNickName;
  var bio;
  var socialMedia;
  String? alternateEmail;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  LoginDataModel(
      {this.sId,
        this.email,
        this.role,
        this.company,
        this.firstName,
        this.lastName,
        this.middleInitial,
        this.jobTitle,
        this.dob,
        this.socialSecurity,
        this.barCode,
        this.accessCode,
        this.multiClubClockIn,
        this.hireDate,
        this.terminationDate,
        this.adpId,
        this.primaryPhone,
        this.workPhone,
        this.workPhoneExt,
        this.mobilePhone,
        this.faxPhone,
        this.emergencyPhone,
        this.street,
        this.city,
        this.state,
        this.zipCode,
        this.emailNotification,
        this.onlineNickName,
        this.bio,
        this.socialMedia,
        this.alternateEmail,
        this.isDeleted,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.token});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    role = json['role'];
    company = json['company'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleInitial = json['middleInitial'];
    jobTitle = json['jobTitle'];
    dob = json['dob'];
    socialSecurity = json['socialSecurity'];
    barCode = json['barCode'];
    accessCode = json['accessCode'];
    multiClubClockIn = json['multiClubClockIn'];
    hireDate = json['hireDate'];
    terminationDate = json['terminationDate'];
    adpId = json['adpId'];
    primaryPhone = json['primaryPhone'];
    workPhone = json['workPhone'];
    workPhoneExt = json['workPhoneExt'];
    mobilePhone = json['mobilePhone'];
    faxPhone = json['faxPhone'];
    emergencyPhone = json['emergencyPhone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    emailNotification = json['emailNotification'];
    onlineNickName = json['onlineNickName'];
    bio = json['bio'];
    socialMedia = json['socialMedia'];
    alternateEmail = json['alternateEmail'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['company'] = this.company;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['middleInitial'] = this.middleInitial;
    data['jobTitle'] = this.jobTitle;
    data['dob'] = this.dob;
    data['socialSecurity'] = this.socialSecurity;
    data['barCode'] = this.barCode;
    data['accessCode'] = this.accessCode;
    data['multiClubClockIn'] = this.multiClubClockIn;
    data['hireDate'] = this.hireDate;
    data['terminationDate'] = this.terminationDate;
    data['adpId'] = this.adpId;
    data['primaryPhone'] = this.primaryPhone;
    data['workPhone'] = this.workPhone;
    data['workPhoneExt'] = this.workPhoneExt;
    data['mobilePhone'] = this.mobilePhone;
    data['faxPhone'] = this.faxPhone;
    data['emergencyPhone'] = this.emergencyPhone;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['emailNotification'] = this.emailNotification;
    data['onlineNickName'] = this.onlineNickName;
    data['bio'] = this.bio;
    data['socialMedia'] = this.socialMedia;
    data['isDeleted'] = this.isDeleted;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}

