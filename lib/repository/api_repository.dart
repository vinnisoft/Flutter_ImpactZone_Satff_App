import 'package:impact_zone/export.dart';

class APIRepository {
  late DioClient? dioClient;

  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl, dio);
    DeviceConfig.init();
  }


/*===================================================================== forgot password API Call  ==========================================================*/

  Future forgotPasswordApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(forgotPasswordEndPoint, data: dataBody!);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== verify otp API Call  ==========================================================*/

  Future verifyOtpApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response =
          await dioClient!.post(verifyOtpEndPoint, data: dataBody!);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== login  API Call  ==========================================================*/

  Future loginApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!.post(loginEndPoint, data: dataBody!);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== change password API Call  ==========================================================*/

  Future resetPasswordApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(resetPasswordEndPoint, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== change password API Call  ==========================================================*/

  Future changePasswordApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(changePasswordEndPoint, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== update my_profile API Call  ==========================================================*/

  Future getProfileApi() async {
    try {
      final response = await dioClient!.get(myProfileEndPoint, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== update my_profile API Call  ==========================================================*/

  Future updateProfileApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .put(editProfileEndPoint, data: dataBody!, skipAuth: false);
      return LoginResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== delete account API Call  ==========================================================*/

  Future deleteAccountApiCall({required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .delete(deleteAccountEndPoint, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== logout API Call  ==========================================================*/

  Future logoutApiCall() async {
    try {
      final response = await dioClient!.post(logoutEndPoint, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== appointment list API Call  ==========================================================*/

  Future appointmentsApiCall() async {
    try {
      final response = await dioClient!.get(appointmentsEndPoint, skipAuth: false);
      return MyAppointmentListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== appointment detail API Call  ==========================================================*/

  Future appointmentDetailApiCall({id}) async {
    try {
      final response = await dioClient!.get(appointmentsEndPoint + id, skipAuth: false);
      return MyAppointmentDetailResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

/*===================================================================== member detail API Call  ==========================================================*/

  Future memberDetailApiCall({id}) async {
    // try {
      final response = await dioClient!.get(membersDetailEndPoint + id, skipAuth: false);
      return MemberDetailResponseModel.fromJson(response);
    // } catch (e) {
    //   return Future.error(NetworkExceptions.getDioException(e));
    // }
  }
}
