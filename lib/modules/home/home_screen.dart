import 'package:impact_zone/export.dart';
import 'package:impact_zone/widgets/drawer.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: DrawerWidget(),
      floatingActionButton: _floatingActionButton(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBanner(),
            _myAppointmentsHeading(),
            _appointmentData(),
            _todoListHeading(),
            _todoTasks()
          ],
        ).paddingOnly(bottom: 30.h),
      ),
    );
  }

  _floatingActionButton(context) => Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: GetInkWell(
          onTap: () {
            _checkInBottomSheet();
          },
          child: Container(
            padding: EdgeInsets.all(5.h),
            child: AssetImageWidget(
              AppImages.iconsCheckIn,
              imageHeight: 40.h,
            ),
          ),
        ),
      );

  _checkInBottomSheet() => Get.bottomSheet(
      Container(
        width: Get.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4.h,
              width: 120.w,
              decoration: BoxDecoration(
                  color: AppColors.bottomSheetBarColor,
                  borderRadius: BorderRadius.circular(15.r)),
            ),
            Text(
              keyCheckIn.tr,
              style: textStyleHeadlineSmall(),
            ).paddingOnly(top: 15.h, bottom: 30.h),
            Get.find<DashboardController>().userData.value.barCode != null
                ? SizedBox(
                    height: 80.h,
                    width: Get.width * 0.766,
                    child: SfBarcodeGenerator(
                      value: Get.find<DashboardController>()
                          .userData
                          .value
                          .barCode,
                      symbology: Code128(),
                      showValue: true,
                    ),
                  )
                : SizedBox(),
          ],
        ).paddingOnly(top: 5.h, bottom: 40.h),
      ),
      barrierColor: Colors.black26,
      backgroundColor: Colors.white);

  _topBanner() => Stack(
        children: [
          AssetImageWidget(
            AppImages.iconsHomeBg,
            imageHeight: 140.h,
            imageWidth: Get.width,
            imageFitType: BoxFit.cover,
            radiusBottomLeft: 15.r,
            radiusBottomRight: 15.r,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: AssetImageWidget(
                      AppImages.iconsMenu,
                      imageHeight: 20.h,
                    ),
                  ),
                  AssetImageWidget(
                    AppImages.iconsNotification,
                    imageHeight: 20.h,
                  ),
                ],
              ),
              Row(
                children: [
                  AssetImageWidget(
                    AppImages.iconsProfileImage,
                    imageHeight: 42.h,
                  ).paddingOnly(right: 8.w),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          keyWelcome.tr,
                          style: textStyleBodyMedium()
                              .copyWith(color: Colors.white),
                        ).paddingOnly(bottom: 2.h),
                        Text(
                          '${Get.find<DashboardController>().userData.value.firstName} ${Get.find<DashboardController>().userData.value.lastName}',
                          style: textStyleHeadlineMedium().copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ).paddingOnly(top: 15.h)
            ],
          ).paddingOnly(top: 40.h, left: 12.h, right: 12.h)
        ],
      );

  _myAppointmentsHeading() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(keyMyAppointments.tr, style: textStyleDisplaySmall()),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.routeMyAppointments);
            },
            child: Text(keyViewAll.tr,
                style: textStyleBodySmall()
                    .copyWith(
                    color: AppColors.primaryTextColor,
                    decorationColor: AppColors.primaryTextColor,
                    decoration: TextDecoration.underline)),
          ),
        ],
      ).paddingOnly(top: 12.h, left: 15.w, right: 15.w, bottom: 15.h);

  _appointmentData() => ListView.separated(
        itemCount: controller.isAppointmentLoading.value ? 2 : (controller.myAppointmentList.length > 2 ? 2 : controller.myAppointmentList.length),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
        itemBuilder: (BuildContext context, int index) => Obx(() => InkWell(
              onTap: controller.isAppointmentLoading.value
                  ? () {}
                  : () {
                      Get.toNamed(AppRoutes.routeMyAppointmentDetail,
                          arguments: {
                            'appointment_id':
                                controller.myAppointmentList[index].sId
                          });
                    },
              child: controller.isAppointmentLoading.value
                  ? ShimmerEffect.shimmerAppointmentListContent()
                  : AppointmentListWidget(
                      appointmentImage:
                          controller.myAppointmentList[index].eventType ==
                                  "CLASS"
                              ? AppImages.iconsClassAppointment
                              : AppImages.iconsAppointment,
                      appointmentHeading:
                          controller.myAppointmentList[index].event ?? '',
                      appointmentType:
                          controller.myAppointmentList[index].eventType != null
                              ? controller.myAppointmentList[index].eventType
                                  .toString()
                                  .capitalizeFirst!
                              : '',
                      appointmentDate: controller
                                  .myAppointmentList[index].eventDate !=
                              null
                          ? DateFormat('EEE, dd MMM').format(DateTime.parse(
                              controller.myAppointmentList[index].eventDate!))
                          : '',
                      appointmentStartTime: controller
                                  .myAppointmentList[index].startTime !=
                              null
                          ? DateFormat('HH:MM').format(DateTime.parse(
                              '2025-01-01T${controller.myAppointmentList[index].startTime!}:00.000Z'))
                          : '',
                      appointmentEndTime: controller
                                  .myAppointmentList[index].endTime !=
                              null
                          ? DateFormat('HH:MM').format(DateTime.parse(
                              '2025-01-01T${controller.myAppointmentList[index].endTime!}:00.000Z'))
                          : '',
                    ),
            )),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 12.h,
        ),
      );

  _todoListHeading() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(keyToDoTasks.tr, style: textStyleDisplaySmall()),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.routeToDoTasksList);
            },
            child: Text(keyViewAll.tr,
                style: textStyleBodySmall()
                    .copyWith(
                    color: AppColors.primaryTextColor,
                    decorationColor: AppColors.primaryTextColor,
                    decoration: TextDecoration.underline)),
          ),
        ],
      ).paddingOnly(top: 15.h, left: 15.w, right: 15.w, bottom: 15.h);

  _todoTasks() {
    return Obx(
        ()=> Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
            ]),
        child:  ListView.separated(
          itemCount: controller.isTaskLoading.value ? 2 :(controller.myTodoList.isEmpty?1:controller.myTodoList.length),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
          itemBuilder: (BuildContext context, int index) => Obx(() => InkWell(
            onTap: controller.isTaskLoading.value
                ? () {}
                : () {
              if(controller.myTodoList.isNotEmpty){
                Get.toNamed(AppRoutes.routeTodoDescription,
                    arguments: {
                  'task_id':controller.myTodoList[index].id.toString()
                }
                );
              }
            },
            child: controller.isTaskLoading.value
                ? ShimmerEffect.shimmerTaskListContent()
                :controller.myTodoList.isEmpty?Center(child: Text(keyTodoListEmpty.tr,style: TextStyle(color: Color(0xff1F1F21),fontWeight: FontWeight.w700),)):  Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blueBgColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: AssetImageWidget(
                    AppImages.iconsTask,
                    imageHeight: 20.h,
                  ).paddingAll(10.h),
                ).paddingOnly(right: 8.h),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.myTodoList[index].taskTitle.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleLabelMedium(),
                      ).paddingOnly(bottom: 2.h),
                      Text(
                        controller.myTodoList[index].member.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleBodyMedium()
                            .copyWith(color: AppColors.secondaryTextColor),
                      ).paddingOnly(bottom: 5.h)
                    ],
                  ),
                )
              ],
            ),

          )),
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 12.h,
          ),
        )
        ).paddingSymmetric(horizontal: 15.h),
    );
  }
}
