
import '../export.dart';

class VariationDialog<T> {
  void show({
    required BuildContext context,
    required String title,
    String? message,
    String? cancelText,
    String? confirmText,
    String? hint,
    required List<T> ,
    required Function(ClubData) onConfirm,
    VoidCallback? onCancel,
    IconData? icon,
    Color? confirmColor,
  }) {
    ClubData clubData = ClubData();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.cancel_outlined,color: AppColors.containerGreyColor,))
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: textStyleHeadlineMedium().copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomDropdown2<T>(dropdownItems:dropdownItems,
              onChanged: (value) {
                clubData = value;
              },
              radius: 6.r,
              hint: hint,
              fillColor: AppColors.colorWhite,
              prefixIcon: null,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),

          ],
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: onCancel,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.containerGreyColor)
                  ),
                  child: Text(cancelText.toString(),style: textStyleHeadlineMedium().copyWith(color: AppColors.secondaryTextColor,fontSize: 14),),
                ),
              ),
              SizedBox(width: 10.w,),
              InkWell(
                onTap: ()=>onConfirm(clubData),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  decoration: BoxDecoration(
                      color: confirmColor?? AppColors.appColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(confirmText.toString(),style: textStyleHeadlineMedium().copyWith(color: Colors.white,fontSize: 14),),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
