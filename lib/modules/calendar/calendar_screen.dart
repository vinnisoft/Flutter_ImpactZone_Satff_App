import 'package:impact_zone/export.dart';

class CustomCalendarScreen extends GetView<CalendarController2> {
  CustomCalendarScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        mini: true,
        onPressed: () {
          Get.toNamed(AppRoutes.routeBookEventScreen)?.then((result) {
            if(result!=null){
              controller.appointmentsListApi();
            }
          });
        },
        child: Icon(Icons.add, size: 25.sp),
      ),
      body: Obx(
            () {
          controller.myAppointmentList.length;
          return Column(
              children: [
                TopBannerWidget(scaffoldKey: _scaffoldKey,title: keyCalender.tr,),
                SizedBox(height: 10.h), // Top padding
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${keyToday.tr}, ${DateFormat('dd MMM yyyy').format(
                            controller.selectedDate.value)}',
                        style: textStyleHeadlineMedium().copyWith(
                          fontSize: 16.sp,
                          color: AppColors.appColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ).paddingOnly(right: 5.sp),
                      AssetImageWidget(
                        AppImages.iconsCalendarUnselected, imageHeight: 20.h,
                        color: AppColors.appColor,)
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                _buildDateSelectorRow(),
                SizedBox(height: 8.h),
                // Calendar
                Expanded(
                    child: Obx(
                          () {
                        controller.appointmentList.length;
                        return SfCalendar(
                            controller: calendarController,
                            view: CalendarView.day,
                            initialDisplayDate: controller.selectedDate.value,
                            headerHeight: 0,
                            viewHeaderHeight: 0,
                            allowViewNavigation: false,
                            showDatePickerButton: false,
                            showNavigationArrow: false,
                            viewNavigationMode: ViewNavigationMode.none,
                            dataSource: MeetingDataSource(
                                controller.appointmentList),
                            appointmentBuilder: (context, details) {
                              final Meeting meeting = details.appointments
                                  .first;
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  return InkWell(
                                    onTap: (){
                                 Get.toNamed(AppRoutes.routeViewEventScreen,
                                        arguments: {
                                   "booking_id":meeting.id.toString(),
                                   "title":meeting.id.toString(),
                                        }
                                      )?.then((result){
                                     });

                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color: meeting.background,
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: constraints.maxHeight,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  meeting.eventName,
                                                  style:textStyleBodyMedium()
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                Text(
                                                  meeting.eventType ?? '',
                                                  style:textStyleBodyMedium()
                                                      .copyWith(
                                                    fontSize: 10.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),

                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes
                                                      .routeEditEventScreen,
                                                      arguments: {
                                                        "booking_id": meeting.id
                                                            .toString(),
                                                        "event": meeting
                                                            .eventName,
                                                        "event_type": meeting
                                                            .eventType.toString(),
                                                        "event_date": meeting
                                                            .eventDate.toString(),
                                                        "start_time": meeting
                                                            .startTime.toString(),
                                                        "end_time": meeting
                                                            .endTime.toString(),
                                                        "location": meeting
                                                            .location.toString(),
                                                        "resources": meeting
                                                            .resource.toString(),
                                                        "member": meeting.member
                                                            .toString(),

                                                      }
                                                  )?.then((result) {
                                                    if(result!=null){
                                                      controller.appointmentsListApi();
                                                    }
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.edit, size: 16.sp,
                                                  color: Colors.white,)
                                                    .paddingAll(10.r)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                        );
                      },
                    )
                )
              ]
          );
        },
      ),
    );
  }

  // Builds the horizontal scrollable date row
  Widget _buildDateSelectorRow() {
    final DateTime month = DateTime(controller.selectedDate.value.year,
        controller.selectedDate.value.month);
    final int daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final List<DateTime> dates = List.generate(
      daysInMonth,
          (i) => DateTime(month.year, month.month, i + 1),
    );
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        controller: controller.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          // final isSelected = date.day == selectedDate.day;
          final isSelected = date.day == controller.selectedDate.value.day &&
              date.month == controller.selectedDate.value.month &&
              date.year == controller.selectedDate.value.year;
          return GestureDetector(
            onTap: () {
              controller.selectedDate.value = date;
              calendarController.selectedDate = date;
              calendarController.displayDate = date;
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: isSelected ? Colors.black : AppColors
                    .containerGreyColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat('MMM').format(date).toUpperCase(),
                      style: textStyleBodyMedium().copyWith(
                        fontSize: 10.sp,
                        color: !isSelected
                            ? AppColors.secondaryTextColor
                            : AppColors.primaryTextColor,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  Text(DateFormat('dd').format(date),
                      style:textStyleBodyMedium()
                          .copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: !isSelected
                            ? AppColors.secondaryTextColor
                            : AppColors.primaryTextColor,
                      )),
                  Text(DateFormat('EEE').format(date).toUpperCase(),
                      style: textStyleBodyMedium().copyWith(
                        fontSize: 10.sp,
                        color:!isSelected
                           ? AppColors.secondaryTextColor
                            : AppColors.primaryTextColor,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;
}


class MyAppointment {
  final String title;
  final String subtitle;
  final String location;
  final DateTime startTime;
  final DateTime endTime;
  final Color backgroundColor;

  MyAppointment({
    required this.title,
    required this.subtitle,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.backgroundColor,
  });
}


class Meeting {

  Meeting(
      this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay, {
        this.eventType,
        this.isMemberVerified,
        this.id,
        this.eventDate,
        this.startTime,
        this.endTime,
        this.location,
        this.member,
        this.resource,
      });

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  /// New: Type of the event (e.g. CLASS, SESSION)
  String? eventType;

  /// New: Whether the member is verified
  bool? isMemberVerified;
  String? eventDate;
  String? startTime;
  String? endTime;
  String? member;
  String? resource;
  String? location;

  String? id;
}


