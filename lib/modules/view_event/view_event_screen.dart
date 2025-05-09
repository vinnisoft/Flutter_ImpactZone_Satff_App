import '../../export.dart';

class ViewEventScreen extends GetView<ViewEventController> {
  const ViewEventScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar(
          appBarTitleText:keyViewEvent.tr,
          actionWidget: [
            AssetImageWidget(
              AppImages.iconsNotification,
              imageHeight: 20.h,
            ),
          ],
        ),
        body:
        Column(
          children: [
             Obx(
            () {
              controller.isBookingDetailLoading.value;
              if(controller.isBookingDetailLoading.value){
                return ShimmerEffect.shimmerTaskDetailsContent(showCompleted: true);
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                          ]),
                      child: Row(

                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 20.h,bottom: 20.h,right: 20.w,left: 0.w),
                            decoration: BoxDecoration(
                                color: Color(0xffF0F3FF),
                                borderRadius: BorderRadius.circular(4.r)
                            ),
                            child: AssetImageWidget(AppImages.imagesSplashLogo,imageWidth: 20.w,),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.bookingData.value.eventType.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style:textStyleHeadlineMedium().copyWith(fontSize:16.sp,fontWeight: FontWeight.w700),),
                                Text(keyEventType.tr,maxLines:1,overflow: TextOverflow.ellipsis,style:textStyleBodySmall().copyWith(fontSize: 14.sp),)
                              ],
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Get.toNamed(AppRoutes
                          //         .routeEditEventScreen,
                          //         arguments: {
                          //           "booking_id": controller.bookingData.value.id.toString(),
                          //           "event": controller.bookingData.value.event.toString(),
                          //           "event_type": controller.bookingData.value.eventType.toString(),
                          //           "event_date":controller.bookingData.value.eventDate.toString(),
                          //           "start_time":controller.bookingData.value.startTime.toString(),
                          //           "end_time": controller.bookingData.value.endTime.toString(),
                          //           "location": controller.bookingData.value.location.toString(),
                          //           "resources": controller.bookingData.value.resources.toString(),
                          //           "member": controller.bookingData.value.member.toString(),
                          //
                          //         }
                          //     );
                          //   },
                          //   child: Container(
                          //     padding: EdgeInsets.all(6),
                          //       decoration: BoxDecoration(
                          //           color: AppColors.appColor,
                          //           borderRadius: BorderRadius.circular(4)
                          //       ),
                          //       child: Icon(Icons.edit,color: Colors.white,size: 20,)),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(keyEvent.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                              Flexible(
                                child: Text(controller.bookingData.value.eventType.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBodySmall().copyWith(fontSize: 14.sp),),
                              )
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical:10.h),
                            child: Divider(color: Color(0xffE9E9E9),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(keyDate.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                              Text(controller.bookingData.value.eventDate.toString().split("T").first,style:textStyleBodySmall().copyWith(fontSize: 14.sp),)
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical:10.h),
                            child: Divider(color: AppColors.containerGreyColor,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(keyTime.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                              Flexible(
                                child: Text(controller.bookingData.value.endTime.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBodySmall().copyWith(fontSize: 14.sp),),
                              )
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical:10.h),
                            child: Divider(color: AppColors.containerGreyColor,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(keyResource.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical:10.h),
                            child: Divider(color: AppColors.containerGreyColor,),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(keyMembers.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                              Flexible(
                                child: Text("${controller.bookingData.value.member?.length}/${controller.bookingData.value.event?.maximumWaitlist}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyleBodySmall().copyWith(fontSize: 14.sp),),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                  );
            },
             ),
          ],
        ),
    );
  }
}
