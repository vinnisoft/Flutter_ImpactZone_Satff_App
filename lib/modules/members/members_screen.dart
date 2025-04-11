import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/members/members_controller.dart';
import '../../app_values/app_colors.dart';
import '../../app_values/app_images.dart';
import '../../app_values/text_styles.dart';
import '../../repository/endpoint.dart';
import '../../route/app_routes.dart';
import '../../utils/shimmer_effect.dart';
import '../../widgets/custom_asset_image_widget.dart';
import '../../widgets/drawer.dart';
import 'member_list_widget.dart';

class MembersScreen extends GetView<MembersController> {
  MembersScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.filteredItems.length;
        return Scaffold(
        // key: _scaffoldKey,
        // drawer: DrawerWidget(),
          appBar: CustomAppBar(
            appBarTitleText: keyMembers.tr,
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
        // bottomNavigationBar:controller.searchTextController.text.isEmpty?_bottomAppBar():null,
      );
      },
    );
  }

  _topBanner() => Obx(
    () {
      controller.filteredItems.length;
      return Stack(
      children: [
        AssetImageWidget(
          AppImages.iconsHomeBg,
          imageHeight: 90.h,
          imageWidth: Get.width,
          imageFitType: BoxFit.cover,
          radiusBottomLeft: 15.r,
          radiusBottomRight: 15.r,
        ),
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if(controller.searchTextController.text.isEmpty){
                        _scaffoldKey.currentState?.openDrawer();
                      }
                      else{
                        controller.searchTextController.clear();
                      }

                    },
                    child: controller.searchTextController.text.isEmpty?AssetImageWidget(
                      AppImages.iconsMenu,
                      imageHeight: 20.h,
                    ):AssetImageWidget(
                      AppImages.iconsBack,
                      imageHeight: 20.h,
                    ),
                  ),
                  Text(keyMembers.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22),),
                  AssetImageWidget(
                    AppImages.iconsNotification,
                    imageHeight: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ).paddingOnly(top: 20.h, left: 12.h, right: 12.h)
      ],
    );
    },
  );

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
            Image.asset(AppImages.iconsSearch,width: 20,),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller.searchTextController,
                decoration: InputDecoration(
                  hintText: "Search",
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
          // Image.asset(AppImages.iconsFilter,width: 20,)

          ],
        ), /*AssetImageWidget(
        AppImages.iconsFilter,
        imageHeight: 14.h,
        imageWidth: Get.width,
        imageFitType: BoxFit.cover,
        radiusBottomLeft: 15.r,
        radiusBottomRight: 15.r,
      ),*/
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





  _bottomAppBar() => Obx(
        () => Container(
      padding: EdgeInsets.only(top: 4.h, bottom: 5.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18.r),
            topLeft: Radius.circular(18.r),
          ),
          boxShadow: [BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 2
          )]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(18.r),
          topLeft: Radius.circular(18.r),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: controller.selectedTab.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.selectedTab.value = index;
            switch (index) {
              case 0:
                break;
              case 1:
                break;
              case 2:
                break;
              case 3:
                break;
            }
          },
          selectedLabelStyle: textStyleBodySmall().copyWith(fontSize: 0.sp),
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.appColor,
          unselectedItemColor: AppColors.primaryTextColor,
          unselectedLabelStyle: textStyleBodySmall().copyWith(fontSize: 0.sp),
          items: [
            _navBarItem(
              icon: AppImages.iconsHomeUnselected,
              activeIcon: AppImages.iconsHomeSelected,
            ),
            _navBarItem(
              icon: AppImages.iconsCalendarUnselected,
              activeIcon: AppImages.iconsCalendarSelected,
            ),
            _navBarItem(
              icon: AppImages.iconsChatUnselected,
              activeIcon: AppImages.iconsChatSelected,
            ),
            _navBarItem(
              icon: AppImages.iconsProfileUnselected,
              activeIcon: AppImages.iconsProfileSelected,
            ),
          ],
        ),
      ),
    ),
  );

  BottomNavigationBarItem _navBarItem({icon, activeIcon}) =>
      BottomNavigationBarItem(
        icon: Image.asset(
          icon,
          height: 22.h,
        ),
        label: '',
        activeIcon: Image.asset(
          activeIcon,
          height: 22.h,
        ),
      );
}









