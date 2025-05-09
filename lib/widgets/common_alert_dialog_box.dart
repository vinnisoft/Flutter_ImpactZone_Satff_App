
import '../export.dart';

class CustomAlertDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required String cancelText,
    required String confirmText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    IconData? icon,
    Color? confirmColor,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.red),
              const SizedBox(width: 8),
            ],
            if (title != null)Text(
              title,
              style: textStyleHeadlineMedium(),
            ),
          ],
        ),
        content: Text(message,
          style: textStyleHeadlineMedium().copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: onCancel,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.containerGreyColor)
              ),
              child: Text(cancelText,style: textStyleHeadlineMedium().copyWith(color: AppColors.secondaryTextColor),),
            ),
          ),
         InkWell(
            onTap: onConfirm,
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
             decoration: BoxDecoration(
               color: confirmColor?? AppColors.appColor,
               borderRadius: BorderRadius.circular(10)
             ),
             child: Text(confirmText,style: textStyleHeadlineMedium().copyWith(color: Colors.white),),
           ),
         )
        ],
      ),
    );
  }
}
