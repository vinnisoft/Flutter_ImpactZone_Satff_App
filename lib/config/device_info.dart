import 'package:impact_zone/export.dart';

class DeviceConfig {
  static DeviceModel deviceDetails = DeviceModel();
  static PackageInfo? packageInfo;

  static Future<void> init() async {
    deviceDetails = await DeviceConfig.getDeviceInfo();
    packageInfo = await PackageInfo.fromPlatform();

    debugPrint("DeviceDetails = ${deviceDetails.toJson()}");
    debugPrint("PackageDetails = $packageInfo");
  }

  static Future<DeviceModel> getDeviceInfo() async {
    DeviceModel deviceDetails = DeviceModel();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo info = await deviceInfo.androidInfo;
        deviceDetails.deviceName = info.model;
        deviceDetails.deviceOS = "Android";
        deviceDetails.deviceOSVersion = info.version.sdkInt.toString();
        deviceDetails.deviceModel = info.model;
        deviceDetails.deviceId = info.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo info = await deviceInfo.iosInfo;
        deviceDetails.deviceName = info.utsname.machine;
        deviceDetails.deviceOS = "iOS";
        deviceDetails.deviceOSVersion = info.systemName;
        deviceDetails.deviceModel = info.utsname.machine;
        deviceDetails.deviceId = info.identifierForVendor;
        // uniq
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return deviceDetails;
  }
}
