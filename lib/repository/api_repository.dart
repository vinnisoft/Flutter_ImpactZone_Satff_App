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
    try {
      final response = await dioClient!.get(membersDetailEndPoint + id, skipAuth: false);
      return MemberDetailResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
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



  /*===================================================================== Members List  API Call  ==========================================================*/

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


  /*===================================================================== Profile Data API Call  ==========================================================*/

  Future profileDataApiCall({id}) async {
    try {
      final response = await dioClient!.get(profileData, skipAuth: false);
      return ProfileModelResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }

  /*===================================================================== Inventory Category List  API Call  ==========================================================*/

  Future inventoryCategoryApiCall() async {
    try {
      final response = await dioClient!.get(inventoryCategory, skipAuth: false);
      return InventoryResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }



  /*=====================================================================  book event API Call  ==========================================================*/

  Future bookEventApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response = await dioClient!
          .post(bookEvent, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }




  /*=====================================================================  get event API Call  ==========================================================*/

  Future getEventApiCall() async {
    try {
      final response = await dioClient!
          .get(getEvent, skipAuth: false);
      return CalendarEventSetupResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


  /*=====================================================================  get resource API Call  ==========================================================*/

  Future getResourceApiCall() async {
    try {
      final response = await dioClient!
          .get(getResource, skipAuth: false);
      return ResourceResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }



  /*=====================================================================  get location API Call  ==========================================================*/

  Future getLocationApiCall() async {
    try {
      final response = await dioClient!
          .get(getLocation, skipAuth: false);
      return CalendarLocationResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }




  /*=====================================================================  get staff API Call  ==========================================================*/

  Future getStaffApiCall() async {
    try {
      final response = await dioClient!
          .get(getStaff, skipAuth: false);
      return StaffResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }


  /*===================================================================== member detail API Call  ==========================================================*/

  Future bookingDetailsApiCall({id}) async {
    try {
      final response = await dioClient!.get(getBookingDetails + id, skipAuth: false);
      return BookingDetailResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }





  /*===================================================================== appointment detail API Call  ==========================================================*/

  Future getAllAppointmentDetailApiCall() async {
    try {
      final response = await dioClient!.get(appointmentsEndPoint, skipAuth: false);
      return MyAppointmentListResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }




  /*=====================================================================  update appoinment API Call  ==========================================================*/

  Future updateEventApiCall(
      {required Map<String, dynamic>? dataBody,required String id}) async {
    try {
      final response = await dioClient!
          .put(updateAppointment+id, data: dataBody!, skipAuth: false);
      return MessageResponseModel.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }




  /*===================================================================== check Promo Code API Call  ==========================================================*/

  Future checkPromoCodeApiCall(
      {required Map<String, dynamic>? dataBody}) async {
    try {
      final response =
      await dioClient!.post(checkPromoCode, data: dataBody!,skipAuth: false);
      return PromoCodeResponse.fromJson(response);
    } catch (e) {
      return Future.error(NetworkExceptions.getDioException(e));
    }
  }



}


