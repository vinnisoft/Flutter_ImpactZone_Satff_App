import 'package:impact_zone/export.dart';

class MyAppointmentDetailScreen extends GetView<MyAppointmentDetailController> {
  const MyAppointmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyMyAppointments.tr,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              controller.isAppointmentLoading.value
                  ? ShimmerEffect.shimmerAppointmentListContent(resource: true)
                  : AppointmentListWidget(
                      appointmentImage:
                          controller.appointmentData.value.eventType == "CLASS"
                              ? AppImages.iconsClassAppointment
                              : AppImages.iconsAppointment,
                      appointmentHeading:
                          controller.appointmentData.value.event ?? '',
                      appointmentType:
                          controller.appointmentData.value.eventType != null
                              ? controller.appointmentData.value.eventType
                                  .toString()
                                  .capitalizeFirst!
                              : '',
                      appointmentDate:
                          controller.appointmentData.value.eventDate != null
                              ? DateFormat('EEE, dd MMM').format(DateTime.parse(
                                  controller.appointmentData.value.eventDate!))
                              : '',
                      appointmentStartTime: controller
                                  .appointmentData.value.startTime !=
                              null
                          ? DateFormat('HH:MM').format(DateTime.parse(
                              '2025-01-01T${controller.appointmentData.value.startTime!}:00.000Z'))
                          : '',
                      appointmentEndTime: controller
                                  .appointmentData.value.endTime !=
                              null
                          ? DateFormat('HH:MM').format(DateTime.parse(
                              '2025-01-01T${controller.appointmentData.value.endTime!}:00.000Z'))
                          : '',
                      resource: controller.appointmentData.value.resources,
                    ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 20)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(keyMembers.tr, style: textStyleDisplaySmall()),
                      (!controller.isAppointmentLoading.value && (controller.appointmentData.value.members?.length ?? 0) <= 0) ?
                      Container(
                        alignment: Alignment.center,
                        height: 100.h,
                        width: Get.width,
                        child: Text(
                            'No Members available ',
                            style: textStyleBodyLarge()),
                      ) :
                       ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 20.h),
                        itemCount: controller.isAppointmentLoading.value
                            ? 8
                            : (controller
                                    .appointmentData.value.members?.length ??
                                0),
                        itemBuilder: (BuildContext context, int index) =>
                            controller.isAppointmentLoading.value
                                ? ShimmerEffect.shimmerMemberListContent()
                                : InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.routeMemberDetail,
                                          arguments: {
                                            'member_id': controller
                                                .appointmentData
                                                .value
                                                .members?[index]
                                                .sId
                                          });
                                    },
                                    child: MemberListWidget(
                                      memberImage: controller.appointmentData
                                              .value.members?[index].image ??
                                          '',
                                      memberName:
                                          '${controller.appointmentData.value.members?[index].firstName} ${controller.appointmentData.value.members?[index].lastName}',
                                    ),
                                  ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 20.h,
                        ),
                      ) ,
                    ],
                  ))
            ],
          ).paddingSymmetric(vertical: 18.h, horizontal: 16.h),
        ),
      ),
    );
  }
}
