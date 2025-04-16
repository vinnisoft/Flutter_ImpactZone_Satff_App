import 'package:impact_zone/export.dart';
import 'package:impact_zone/models/member/members_list_model.dart';
import 'package:impact_zone/models/todo_task/todo_task_model.dart';

import '../models/todo_task/todo_task_details_model.dart';

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


  /*===================================================================== Todo list API Call  ==========================================================*/

  Future todoListApiCall() async {
    try {
      final response = await dioClient!.get(taskEndPoint, skipAuth: false);
      return EmployeeTaskResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== Todo Details API Call  ==========================================================*/

  Future todoDetailsApiCall(String taskId) async {
    try {
      final response = await dioClient!.get("$taskEndPoint/$taskId", skipAuth: false);
      return TaskDetailResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }



  /*===================================================================== membes List  API Call  ==========================================================*/

  Future membersListApiCall() async {
    try {
    final response = await dioClient!.get(membersDetailEndPoint, skipAuth: false);
    return MemberListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== TodoList Update  API Call  ==========================================================*/

  Future todoListUpdateApiCall(String id,{required Map<String, dynamic>? dataBody} ) async {
    try {
      final response = await dioClient!.put(todoDetails+id, skipAuth: false, data: dataBody!);
      return EmployeeTaskModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

}
