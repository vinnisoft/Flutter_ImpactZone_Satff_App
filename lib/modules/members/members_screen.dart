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
              // _topBanner(),
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
      padding: const EdgeInsets.only(left: 16,right: 16,top: 16), // adjust as needed
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffE9E9E9)),

        ),

        child: Row(
          children: [
            AssetImageWidget(AppImages.iconsSearch,imageWidth: 20.w,),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller.searchTextController,
                decoration: InputDecoration(
                  hintText: keySearch.tr,
                  isCollapsed: true,
                  hintStyle: TextStyle(
                    color: Color(0xff969696),
                    fontWeight: FontWeight.w400
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
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
       padding: const EdgeInsets.symmetric(horizontal: 20),
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









