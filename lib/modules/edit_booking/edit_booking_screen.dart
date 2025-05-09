import '../../export.dart';
class EditBookingScreen extends GetView<EditBookingController> {
  const EditBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyEditEvent.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body:SafeArea(
        child: ListView(
          children: [
            _bookEventWidget(context),
          ],
        ),
      ),
    );

  }


  _bookEventWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
          ]),
      child: Obx(
            ()=>controller.isLoading.value?ShimmerEffect.eventShimmer(): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bookEventField(title: keyEvent.tr, icon: AssetImageWidget(AppImages.iconsEventIcon)),
            _bookEventTypeField(title: keyEventType.tr, icon: AssetImageWidget( AppImages.iconsEventTypeIcon)),
            Text(keyEventDate.tr,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),).paddingOnly(bottom: 10.h),
            SizedBox(height: 5.h,),
            _selectDate(callback: (){
              // showDatePickerModal(context);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                ),
                builder: (_) =>  CustomDatePicker(onDateSelected: (selectedDate){
                  controller.selectedDate.value = selectedDate.split(' ').first;
                },),
              );
            }),
            Text(keyStartTime.tr,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),).paddingOnly(top: 10.h),
            SizedBox(height: 5.h,),
            _selectTime(callback: (){
              // showDatePickerModal(context);
              showCustomTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                onSave: (selectedTime) {
                  controller.selectedTime.value = selectedTime.format(context);
                },
              );
            }),

            _selectDuration(callback: (){
              showCustomTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                onSave: (selectedTime) {
                  controller.selectedEndTime.value = selectedTime.format(context);
                },
              );
            }),
            Text(keyEndTime.tr,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),).paddingOnly(top: 10.h),
            SizedBox(height: 5.h,),
            _endTime(),
            _bookEventMemberField(title: keyMember.tr, icon: AssetImageWidget( AppImages.iconsMemberIcon)),
            _bookEventResourceField(title: keyResource.tr,icon: AssetImageWidget( AppImages.iconsEventResourceIcon)),
            _bookEventLocationField(title: keyLocation.tr,icon: AssetImageWidget( AppImages.iconsEventResourceIcon)),
            SizedBox(height: 20.h,),
            PrimaryBottomButton(callBack: (){controller.bookEventApi(); }, title: keyEditEvent.tr)
          ],
        ),
      ),
    ).paddingAll(20.h);

  }


  _selectDuration({required Function() callback}) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(keyDuration.tr,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
        SizedBox(height: 5.h,),
        Obx(
              () {
            controller.durationList.length;
            return CustomDropdown2<String>(dropdownItems:controller.durationList,
              onChanged: (value) {
                if(controller.selectedTime.value.isEmpty){
                  return;
                }
                controller.selectedEndTime.value=Helper.addMinutesToTime(controller.selectedTime.value,int.parse(value.toString()));
              },
              radius: 6.r,
              prefixIcon: AssetImageWidget(AppImages.iconsTime,color: AppColors.appColor,imageHeight: 20.h,),
            );

          },

        ),
      ],
    ).paddingSymmetric(vertical: 10.h);  }

  _endTime() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.containerBorderGreyColor)
      ),
      child: Obx(()=> Text(controller.selectedEndTime.value, style: textStyleBodyLarge().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp,color: AppColors.secondaryTextColor))),
    );
  }


  _bookEventField({required String title,required Widget icon }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
        SizedBox(height: 5.h,),
        Obx(
              () {
            controller.resourceList.length;
            return CustomDropdown2<CalendarEvent>(dropdownItems:controller.eventListResponse,
              onChanged: (I) {
                controller.selectedEvent.value = I;
                controller.durationList.assignAll(controller.selectedEvent.value?.duration ?? []);
              },
              radius: 6.r,
              prefixIcon: icon,
              hint: controller.event.value,
            );

          },

        ),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

  _bookEventTypeField({required String title,required Widget icon }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
        SizedBox(height: 5.h,),
        Obx(
              () {
            controller.resourceList.length;
            return CustomDropdown2(dropdownItems:controller.eventType,
              onChanged: (I) {
                controller.selectedEventType.value = I;
              },
              radius: 6.r,
              prefixIcon: icon,
              hint: controller.eventType2.value,
            );

          },

        ),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

  _bookEventMemberField({required String title,required Widget icon }) {
    return _bookEventMemberField2(title: keyMember.tr, icon: AssetImageWidget( AppImages.iconsMemberIcon));
  }

  _bookEventMemberField2({required String title, required Widget icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyleDisplayLarge().copyWith(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Obx(() {
          final selected = controller.selectedMember.value;
          return GestureDetector(
            onTap: () => _showMemberDialog(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.containerGreyColor),
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  icon,
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                        selected?.firstName ??'searchMember'.tr,
                        style: textStyleBodyMedium().copyWith(
                          fontSize: 14.sp,
                          color: selected == null ? AppColors.secondaryTextColor : AppColors.primaryTextColor,
                        )
                    ),
                  ),
                  Icon(Icons.arrow_drop_down,size: 22.sp,color: AppColors.appColor,),
                ],
              ),
            ),
          );
        }),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }

  void _showMemberDialog() {
    final searchController = TextEditingController();
    final filteredList = RxList<MemberModel>(controller.myMemberList);

    Get.dialog(
      AlertDialog(
        title: Text(keySearchMember.tr,
            style: textStyleDisplayLarge().copyWith(
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              textController: searchController,
              onChange: (query) {
                filteredList.value = controller.myMemberList
                    .where((member) => (member.firstName ?? '').toLowerCase().contains(query.toLowerCase()))
                    .toList();
              },
              hint: keySearch.tr,
            ),
            SizedBox(height: 10.h),
            Obx(() => SizedBox(
              height: 200.h,
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (_, index) {
                  final member = filteredList[index];
                  return ListTile(
                    title: Text(member.firstName?? '',style: textStyleHeadlineMedium().copyWith(fontSize: 14.sp),),
                    onTap: () {
                      controller.selectedMember.value = member;
                      Get.back();
                    },
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
  _bookEventResourceField({required String title,required Widget icon }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
        SizedBox(height: 5.h,),
        Obx(
              () {
            controller.resourceList.length;
            return CustomDropdown2<Resource>(
              dropdownItems: controller.resourceListResponse,
              dropdownValue: controller.selectedResource.value,
              onChanged: (value) {
                controller.selectedResource.value = value;
              },
              prefixIcon: icon,
              hint: controller.resources.value,
            );

          },

        ),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }





  _bookEventLocationField({required String title,required Widget icon }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style:textStyleDisplayLarge().copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500,fontSize: 16.sp),),
        SizedBox(height: 5.h,),
        Obx(
              () {
            controller.resourceList.length;
            return CustomDropdown2<LocationData>(
              dropdownItems: controller.LocationListResponse,
              dropdownValue: controller.selectedLocation.value,
              onChanged: (value) {
                controller.selectedResource.value = value;
              },
              prefixIcon: icon,
              hint: controller.location.value,
            );

          },

        ),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }


  _selectDate({required Function() callback}) {
    return  InkWell(
      onTap: (){
        callback();
      },
      child:Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.containerBorderGreyColor)
          ),
          child: Obx(
                ()=> Row(
              children: [
                controller.selectedDate.value.toString().isNotEmpty?SizedBox(): AssetImageWidget(AppImages.iconsCalendarUnselected,color: AppColors.appColor,imageHeight: 20.h,),
                controller.selectedDate.value.toString().isNotEmpty?SizedBox():SizedBox(width: 10.w,),
                Obx(()=> Text(controller.selectedDate.value.toString().isNotEmpty?controller.selectedDate.value.toString():controller.eventDate.toString(),style: textStyleBodySmall(),)),
              ],
            ),
          )),
    ).paddingOnly(bottom: 10.h);
  }



  _selectTime({required Function() callback}) {
    return  InkWell(
      onTap: (){
        callback();
      },
      child:Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: AppColors.containerBorderGreyColor)
          ),
          child: Obx(
                ()=> Row(
              children: [
                controller.selectedTime.value.toString().isNotEmpty?SizedBox(): AssetImageWidget(AppImages.iconsTime,color: AppColors.appColor,imageHeight: 20.h,),
                controller.selectedTime.value.toString().isNotEmpty?SizedBox():SizedBox(width: 10.w,),
                Obx(()=> Text(controller.selectedTime.value.toString().isNotEmpty?controller.selectedTime.value.toString():controller.startTime.toString(),style: textStyleBodySmall(),)),
              ],

            ),
          )),
    ).paddingOnly(bottom: 10.h);
  }


}




Future<void> showCustomTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  required Function(TimeOfDay) onSave,
}) async {
  int selectedHour = initialTime.hourOfPeriod;
  int selectedMinute = initialTime.minute;
  String selectedPeriod = initialTime.period == DayPeriod.am ? 'AM' : 'PM';

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(top: 20.h, bottom: 30.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             SizedBox(height: 10.h),
             Text(
              selectTime.tr,
              style: textStyleBodyMedium().copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextColor
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hour Picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedHour),
                          itemExtent: 32,
                          onSelectedItemChanged: (index) {
                            selectedHour = index;
                          },
                          children: List.generate(12, (index) {
                            final hour = index + 1;
                            return Center(
                              child: Text(
                                hour.toString().padLeft(2, '0'),
                                style: textStyleBodyMedium().copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.appColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      // Minute Picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedMinute),
                          itemExtent: 32,
                          onSelectedItemChanged: (index) {
                            selectedMinute = index;
                          },
                          children: List.generate(60, (index) {
                            return Center(
                              child: Text(
                                index.toString().padLeft(2, '0'),
                                style: textStyleBodyMedium().copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.appColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      // AM/PM Picker
                      Expanded(
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                              initialItem: selectedPeriod == 'AM' ? 0 : 1),
                          itemExtent: 32,
                          onSelectedItemChanged: (index) {
                            selectedPeriod = index == 0 ? 'AM' : 'PM';
                          },
                          children: ['AM', 'PM'].map((p) {
                            return Center(
                              child: Text(
                                p,
                                style:   textStyleBodyMedium().copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.appColor,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
             SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                 SizedBox(width: 10.w),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      int hour = selectedHour % 12 +
                          (selectedPeriod == 'PM' ? 12 : 0);
                      Navigator.pop(context);
                      onSave(TimeOfDay(hour: hour, minute: selectedMinute));
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF1B1F33),

                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w),
          ],
        ),
      );
    },
  );


}

