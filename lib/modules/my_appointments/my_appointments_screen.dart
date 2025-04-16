import 'package:impact_zone/export.dart';

class MyAppointmentsScreen extends GetView<MyAppointmentsController> {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarTitleText: keyMyAppointments.tr,
          actionWidget: [
            AssetImageWidget(
              AppImages.iconsNotification,
              imageHeight: 20.h,
            ),
          ],
        ),
        body: Obx(
          () => ListView.separated(
            itemCount: controller.isAppointmentLoading.value ? 10 : controller.myAppointmentList.length,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.h),
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap:controller.isAppointmentLoading.value
                  ? () {} :  (){
                Get.toNamed(AppRoutes.routeMyAppointmentDetail, arguments: {
                  'appointment_id' : controller.myAppointmentList[index].sId
                });
              },
              child: controller.isAppointmentLoading.value ?
              ShimmerEffect.shimmerAppointmentListContent() : AppointmentListWidget(
                appointmentImage: controller.myAppointmentList[index].eventType == "CLASS" ? AppImages.iconsClassAppointment :  AppImages.iconsAppointment,
                appointmentHeading:  controller.myAppointmentList[index].event ?? '',
                appointmentType:  controller.myAppointmentList[index].eventType != null ?  controller.myAppointmentList[index].eventType.toString().capitalizeFirst! : '',
                appointmentDate: controller.myAppointmentList[index].eventDate != null ? DateFormat('EEE, dd MMM').format(DateTime.parse(controller.myAppointmentList[index].eventDate!)) : '',
                appointmentStartTime: controller.myAppointmentList[index].startTime != null ? DateFormat('HH:MM').format(DateTime.parse('2025-01-01T${controller.myAppointmentList[index].startTime!}:00.000Z')) : '',
                appointmentEndTime: controller.myAppointmentList[index].endTime != null ? DateFormat('HH:MM').format(DateTime.parse('2025-01-01T${controller.myAppointmentList[index].endTime!}:00.000Z')) : '',

              ),
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 12.h,
            ),
          ),
        ));
  }

}
