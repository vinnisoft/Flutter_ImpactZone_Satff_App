import 'package:dio/io.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/logger/log_interceptor.dart' as log_interceptor;

const _defaultConnectTimeout =
    Duration(milliseconds: Duration.millisecondsPerMinute);
const _defaultReceiveTimeout =
    Duration(milliseconds: Duration.millisecondsPerMinute);
final LocalStorage _localStorage = Get.find<LocalStorage>();

setContentType() {
  return "application/json";
}

class DioClient {
  String baseUrl;

  static late Dio _dio;

  final List<Interceptor>? interceptors;

  DioClient(
    this.baseUrl,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      // ..httpClientAdapter
      // ..options.contentType = setContentType()
      ..options.headers = {
        'Content-Type': setContentType(),
        // 'X-Requested-With': 'XMLHttpRequest',
        'appVersion': DeviceConfig.packageInfo?.version,
        'deviceType': Platform.isIOS ? 'ios' : 'android',
        'deviceId': DeviceConfig.deviceDetails.deviceId,
      };

    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    if (kDebugMode) {
      _dio.interceptors.add(log_interceptor.LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
    }
  }

  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth}) async {
    try {
      if (skipAuth == false) {
        var token = _localStorage.getAuthToken();
        debugPrint("token $token");
        if (token != null) {
          options = Options(headers: {"Authorization": "Bearer $token","club":"674d80074e1753eb473bb230"});
        }
      }

      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      if (skipAuth == false) {
        var token = _localStorage.getAuthToken();
        debugPrint("authorization============ $token");
        if (token != null) {
          options ??= Options(headers: {"Authorization": "Bearer $token","club":"674d7fd34e1753eb473bb22b"});
        }
      }
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
        bool? skipAuth}) async {
    try {
      if (skipAuth == false) {
        var token = _localStorage.getAuthToken();
        debugPrint("authorization============ $token");
        if (token != null) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        }
      }
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> patch(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool? skipAuth}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      if (skipAuth == false) {
        var token = _localStorage.getAuthToken();
        debugPrint("authorization============ $token");
        if (token != null) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        }
      }
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      bool? skipAuth}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      if (skipAuth == false) {
        var token = _localStorage.getAuthToken();
        debugPrint("authorization============ $token");
        if (token != null) {
          options ??= Options(headers: {"Authorization": "Bearer $token"});
        }
      }
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
