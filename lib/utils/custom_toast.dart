import 'package:impact_zone/export.dart';

showToast({String? message}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message ?? "",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    textColor: Colors.white,
    backgroundColor: AppColors.appColor.withOpacity(0.8),
    fontSize: 13.sp,
  );
}

toast(content, {seconds}) {
  Get.closeAllSnackbars();
  return Get.snackbar(
    "f", content,
    colorText: Colors.black,
    duration: Duration(seconds: 1),
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
    margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
    barBlur: 20.0,
    // backgroundColor: appColor.withOpacity(0.5)
  );
}
