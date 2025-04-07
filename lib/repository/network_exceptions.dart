import 'package:impact_zone/export.dart';

class NetworkExceptions {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return messageData = keyRequestCancelled.tr;
            case DioExceptionType.connectionTimeout:
              return messageData = keyConnectionTimeOut.tr;
            case DioExceptionType.unknown:
              List<String> dateParts = error.message!.split(":");
              List<String> message = dateParts[2].split(",");

              if (message[0].trim() == keyConnectionRefused.tr) {
                return messageData = keyServerUnderMaintenance.tr;
              } else if (message[0].trim() == keyNetworkUnReachable.tr) {
                return messageData = keyNetworkUnReachable.tr;
              } else if (dateParts[1].trim() == keyFailedToHostLookup.tr) {
                return messageData = keyNoInternetConnection.tr;
              } else {
                return messageData = dateParts[1];
              }
            case DioExceptionType.connectionError:
              return messageData = keyNoInternetConnection.tr;
            case DioExceptionType.receiveTimeout:
              return messageData = keyTimeOut.tr;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  try {
                    return messageData = error.response?.data['message'] ??
                        'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 401:
                  Get.find<LocalStorage>().clearLoginData();
                  if(Get.currentRoute != AppRoutes.routeLogin){
                    Get.offAllNamed(AppRoutes.routeLogin);
                  }
                  try {
                    return messageData = error.response?.data['message'] ??
                        'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 403:
                  Get.find<LocalStorage>().clearLoginData();
                  if(Get.currentRoute != AppRoutes.routeLogin){
                    Get.offAllNamed(AppRoutes.routeLogin);
                  }
                  try {
                    return messageData = error.response?.data['message'] ??
                        'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 404:
                  return messageData = keyNotFound.tr;
                case 408:
                  return messageData = keyRequestTimeOut.tr;
                case 500:
                  return messageData = keyInternalServerError.tr;
                case 503:
                  return messageData = keyServiceUnavailable.tr;
                default:
                  return messageData = keySomethingWrong.tr;
              }
            case DioExceptionType.sendTimeout:
              return messageData = keyTimeOut.tr;
            case DioExceptionType.badCertificate:
            // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
            // TODO: Handle this case.
              break;
          }
        }
        else if (error is SocketException) {
          return messageData = keySocketExceptions.tr;
        } else {
          return messageData = keyUnExceptedException.tr;
        }
      } on FormatException catch (_) {
        return messageData = keyFormatException.tr;
      } catch (_) {
        return messageData = keyUnExceptedException.tr;
      }
    } else {
      return error.toString().contains(keyNotSubType.tr)
          ? messageData = keyUnableToProcessData.tr
          : messageData = keyUnExceptedException.tr;
    }
  }
}
