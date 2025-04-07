class RequestModel {

/*===================================================login Request Model==============================================*/
  static loginRequestModel({
    required String? email,
    required String? password,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    return data;
  }

/*===================================================request otp Request Model==============================================*/
  static requestOtpRequestModel({
    required String? email,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    return data;
  }

/*===================================================verify otp Request Model==============================================*/
  static verifyOtpRequestModel({
    required String? email,
    required String? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["otp"] = otp;
    return data;
  }

/*===================================================reset password Request Model==============================================*/
  static resetPasswordRequestModel({
    required String? email,
    required String? password,
    required String? otp,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["otpCode"] = otp;
    return data;
  }

/*=================================================== change password Request Model==============================================*/
  static changePasswordRequestModel({
    required String? newPassword,
    required String? currentPassword,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["newPassword"] = newPassword;
    data["password"] = currentPassword;
    return data;
  }

/*=================================================== delete account Request Model==============================================*/
  static deleteAccountRequestModel({
    required String? currentPassword,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["password"] = currentPassword;
    return data;
  }

/*=================================================== update profile Request Model==============================================*/
  static updateProfileRequestModel({
    required String? name,
    required String? phoneNumber,
    required String? countryCode,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["phoneNumber"] = phoneNumber;
    data["countryCode"] = countryCode;
    return data;
  }

/*=================================================== create booking Request Model==============================================*/
  static createBookingRequestModel({
    required String? boardingLocationId,
    required String? landingLocationId,
    required String? startTime,
    required String? endTime,
    required int? passengers,
    required String? dayOfWeek,
    required String? dateOfTravel,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["boardingLocationId"] = boardingLocationId;
    data["landingLocationId"] = landingLocationId;
    data["startTime"] = startTime;
    data["endTime"] = endTime;
    data["passengers"] = passengers;
    data["dayOfWeek"] = dayOfWeek;
    data["dateOfTravel"] = dateOfTravel;
    return data;
  }

/*=================================================== update payment Request Model==============================================*/
  static updatePaymentRequestModel({
    required String? bookingId,
    required String? paymentId,
  }) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["bookingId"] = bookingId;
    data["paymentId"] = paymentId;
    return data;
  }
}
