import 'dart:convert';

import 'package:impact_zone/export.dart';

class LocalStorage {
  static const String isFirstLaunch = "isFirstLaunch";
  static const String notificationStatus = "notificationStatus";
  static const String authToken = "authToken";
  static const String loginDataModel = "loginDataModel";
  static const String currentLocation = "currentLocation";
  static const String firebaseToken = "firebaseToken";

  firstLaunch(bool? isFirstCheck) {
    localStorage
        .write(isFirstLaunch, isFirstCheck)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    localStorage.read(
      isFirstLaunch,
    );
  }

  getFirstLaunchStatus() {
    return localStorage.read(isFirstLaunch) ?? false;
  }

  saveNotificationStatus(bool? status) {
    localStorage
        .write(notificationStatus, status)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return true;
    });
    localStorage.read(
      notificationStatus,
    );
  }

  getNotificationStatus() {
    return localStorage.read(notificationStatus) ?? true;
  }

  saveLocation(double? latitude, double? longitude) {
    localStorage.write(currentLocation, '$latitude, $longitude');
  }

  getLocation() {
    return localStorage.read(currentLocation);
  }

  saveAuthToken(String? token) {
    localStorage.write(authToken, token);
  }

  getAuthToken() {
    return localStorage.read(authToken);
  }

  saveFirebaseToken(String? fToken) async{
    localStorage.write(firebaseToken, fToken);
  }

  getFirebaseToken() {
    return localStorage.read(firebaseToken);
  }

  saveRegisterData(LoginDataModel? model) async {
    localStorage.write(loginDataModel, jsonEncode(model));
  }

  getSavedLoginData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(loginDataModel);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      LoginDataModel user = LoginDataModel.fromJson(userMap);
      return user;
    }
    return null;
  }

  clearLoginData() {
    localStorage.remove(loginDataModel);
    localStorage.remove(authToken);
  }
}
