import 'package:impact_zone/export.dart';


class MembersScreen extends GetView<MembersController> {
  MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.filteredItems.length;
        return Scaffold(
          appBar: CustomAppBar(
            appBarTitleText: keyMembers.tr,
            actionWidget: [
              AssetImageWidget(
                AppImages.iconsNotification,
                imageHeight: 20.h,
              ),
            ],
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _searchBar(),
              _membersList(),
            ]
          
          ),
        ),
      );
      },
    );
  }

 Widget  _searchBar(){
    return  Padding(
      padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 16.h), // adjust as needed
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xffE9E9E9)),

        ),

        child: Row(
          children: [
            AssetImageWidget(AppImages.iconsSearch,imageWidth: 20.w,),
            SizedBox(width: 8.w),
            Expanded(
              child: TextFieldWidget(
                textController: controller.searchTextController,
                    decoration:InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hint: keySearch.tr,
                      hintStyle: textStyleBodySmall().copyWith(
                        fontWeight: FontWeight.w400,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _membersList() {
   return Obx(
         () =>Padding(
       padding:  EdgeInsets.symmetric(horizontal: 20.w),
       child: ListView.separated(
         shrinkWrap: true,
         physics: NeverScrollableScrollPhysics(),
         padding: EdgeInsets.only(top: 20.h),
         itemCount: controller.isMembersListApiCall.value?10:controller.filteredItems.length,
         itemBuilder: (BuildContext context, int index) =>
         controller.isMembersListApiCall.value
             ? ShimmerEffect.shimmerMemberListContent()
             :

         InkWell(
           onTap: () {
             Get.toNamed(AppRoutes.routeMemberDetail,
                 arguments: {
                   'member_id': controller
                       .filteredItems[index].id
                 }
                 );
           },
           child: MemberListWidget(
             memberImage:
             baseUrl+controller.filteredItems[index].image.toString(),
             memberName:"${controller.filteredItems[index].firstName} ${controller.filteredItems[index].lastName}",
           ),
         ),
         separatorBuilder: (BuildContext context, int index) =>
             SizedBox(
               height: 20.h,
             ),
       ),
     ),
   );
  }

}









