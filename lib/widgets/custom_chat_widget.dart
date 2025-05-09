import '../export.dart';

class CustomChatWidget extends GetView<ChatController> {
  final String message;
  final bool isSender;
  final String time;

  CustomChatWidget({
    required this.message,
    required this.isSender,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSender ? AppColors.appColor : AppColors.blueBgColor;
    final textColor = isSender ? Colors.white : Colors.black87;

    return Column(
      crossAxisAlignment:
      isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width*0.6,
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: isSender?BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15.r),topLeft: Radius.circular(15.r)):BorderRadius.only(bottomRight: Radius.circular(15.r),bottomLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
                  ),
                  child: Text(message, style: textStyleBodyMedium().copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp
                  )),
                ),
                isSender?SizedBox():AssetImageWidget(AppImages.iconsThreeDotIcon,imageHeight: 15.h,)
              ],
            ),
            Obx(
                  ()=> controller.pickedFile.value!=null?controller.pickedFile.value!.path.contains('.pdf')?  Container(
                        height: 90.h,
                      width: 90.w,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.containerBorderColor,
                        borderRadius:isSender?BorderRadius.only(bottomRight: Radius.circular(15.r),bottomLeft: Radius.circular(15.r),topLeft: Radius.circular(15.r)):BorderRadius.only(bottomRight: Radius.circular(15.r),bottomLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
                      ),
                      child: Column(
                      mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AssetImageWidget(AppImages.iconsPdfIcon,),
                          Text("Report.png",style: textStyleBodySmall().copyWith(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w400),)
                        ],
                      )
                  ):ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.file(
                  width: 192.w,
                  height: 122.h,
                  controller.pickedFile.value!,
                  fit: BoxFit.cover,
                ),
              ):SizedBox(),
            ),
            Text(
              time,
              style: textStyleBodySmall()
            ).paddingOnly(right: 10.w),
          ],
        )
      ],
    ).paddingOnly(bottom: 10.h);
  }
}