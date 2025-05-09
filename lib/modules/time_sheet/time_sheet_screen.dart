import '../../export.dart';

class TimeSheetScreen extends GetView<TimeSheetController> {
  const TimeSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyTimeSheet.tr,
        actionWidget: [
          AssetImageWidget(
            AppImages.iconsNotification,
            imageHeight: 20.h,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Row(
             mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Today,08 Nov 2023",style:textStyleHeadlineMedium().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700)).paddingOnly(right: 5.w),
               AssetImageWidget(AppImages.iconsCalendarUnselected,imageHeight: 16.h,imageWidth: 16.w,color: AppColors.appColor,)
             ],
           ),

         _timeSheet()
          ],
        ),
      ),
    );
  }

  _timeSheet() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: _timeSheetList
    );
  }

  Widget? _timeSheetList(BuildContext context, int index) {
    return     Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius:2,
                blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  color: AppColors.blueBgColor,
                  borderRadius: BorderRadius.circular(6.r)
              ),
              child: AssetImageWidget(AppImages.iconsClockIcon,imageHeight: 16.h,imageWidth: 16.w,color: AppColors.appColor,)
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fri 08",style:textStyleHeadlineMedium().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700)),
                Text("In 10:00am - Out 05:00pm",maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleBodySmall()),
              ],
            ),
          ),
          Text("7:00hrs",style:textStyleHeadlineMedium().copyWith(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
