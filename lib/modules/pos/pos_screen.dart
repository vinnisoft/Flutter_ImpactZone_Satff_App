import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:impact_zone/export.dart';
import 'package:impact_zone/modules/pos/pos_controller.dart';
import '../../app_values/app_images.dart';
import '../../widgets/custom_asset_image_widget.dart';
import '../../widgets/drawer.dart';

class PosScreen extends GetView<PosController> {
   PosScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // drawer: DrawerWidget(),
      appBar: CustomAppBar(appBarTitleText: keyPos.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
       body: SingleChildScrollView(
         child: Column(
           children: [
             // _topBanner(),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal:20.h,vertical: 15.h),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   _categories(),
                   SizedBox(height:15.h),
                   Obx(
                    ()=> _posLists(),
                   ),
                   SizedBox(height:20),
                   controller.categoryIndex>=0?SizedBox():_bottomButton(),
         
                 ],
               ),
             )
           ],
         ),
       ),
      // bottomNavigationBar: _bottomAppBar(),
    );
  }
   _topBanner() => Stack(
         children: [
           AssetImageWidget(
             AppImages.iconsHomeBg,
             imageHeight: 90.h,
             imageWidth: Get.width,
             imageFitType: BoxFit.cover,
             radiusBottomLeft: 15.r,
             radiusBottomRight: 15.r,
           ),
           Padding(
             padding:  EdgeInsets.only(top: 20.h),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 InkWell(
                   onTap: () {
                       _scaffoldKey.currentState?.openDrawer();
                   },
                   child:AssetImageWidget(
                     AppImages.iconsMenu,
                     imageHeight: 20.h,
                   )
                 ),
                 Text("POS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22),),
                 AssetImageWidget(
                   AppImages.iconsNotification,
                   imageHeight: 20.h,
                 ),
               ],
             ).paddingOnly(top: 20.h, left: 12.h, right: 12.h),
           )
         ]
   );

  _categories() {
    return Padding(
      padding:  EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text(keyWhatToSell.tr,style: TextStyle(color: Color(0xFF1F1F21),fontWeight: FontWeight.w700,fontSize: 20),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            height: 120.h,
            child:  ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_,i)=>SizedBox(width: 15.w,),
                itemCount: controller.iconItems.length,
                itemBuilder: (_,index)=>Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                    ()=> InkWell(
                        onTap: (){
                          controller.tapOnCategory(index);
                        },
                        child: Container(
                          height: 90.h,
                          width:90.w,
                          padding: EdgeInsets.all(20.h),
                          decoration: BoxDecoration(
                            color: controller.categoryIndex.value==index?Color(0xFFF0F3FF):Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(color: controller.categoryIndex.value==index?AppColors.containerBorderColor:AppColors.containerBorderGreyColor)
                          ),
                          child:  AssetImageWidget(
                             controller.iconItems[index]['icon'].toString(),
                            imageHeight: 30.h,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(controller.iconItems[index]['title'].toString(),style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
          )

        ],
      ),
    );
  }

  _bottomButton({Function()? onClickCallBack}) {
    return InkWell(
      onTap: onClickCallBack,
      child: Container(
        height: 46.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: controller.categoryIndex>=0?AppColors.appColor:AppColors.containerGreyColor,
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(child: Text(keyContinue.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),
      ),
    );
  }

  _posLists() {
     if(controller.categoryIndex.value==0){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectServices.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
             ListView.builder(
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 3,
                 itemBuilder: _itemList
             ),
            SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){
               Get.toNamed(AppRoutes.routeCartScreen);
             }),
           ],
         ),
       );
     }
     else if(controller.categoryIndex.value==1){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectMembershipPlan.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
             ListView.builder(
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 4,
                 itemBuilder: _agreements
             ),
             SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){}),
           ],
         ),
       );
     }
     else if(controller.categoryIndex.value==2){
       return Container(
         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.h),
         decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(12.r),
             boxShadow: [
               BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
             ]),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(keySelectProducts.tr,style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 20),),
             ListView.builder(
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 3,
                 itemBuilder: _itemList
             ),
             SizedBox(height: 20.h,),
             _bottomButton(onClickCallBack: (){}),
           ],
         ),
       );
     }
     else{
       return SizedBox();
     }
  }

  Widget? _itemList(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.containerBorderGreyColor),
        borderRadius: BorderRadius.circular(6.r)
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64.w,
            height: 64.h,
            child: AssetImageWidget(
             "assets/images/temp_gym.png",
              imageHeight: 20.h,
              radiusAll: 6.r,
            ),
          ),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service 1",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 16),),
              Text("\$56",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w400),),
            ],
          ),
          Expanded(child: SizedBox()),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.blueBgColor,
              borderRadius: BorderRadius.circular(6.r)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(Icons.remove, (){}),
                const SizedBox(width: 12),
                Text(
                  '6',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),
                ),
                const SizedBox(width: 12),
                _circleButton(Icons.add, (){}),
              ],
            ),
          ),
        ],
      ),
    );
  }

   Widget _circleButton(IconData icon, VoidCallback onPressed) {
     return InkWell(
       onTap: onPressed,
       borderRadius: BorderRadius.circular(24),
       child: Container(
         width: 20,
         height: 20,
         decoration: const BoxDecoration(
           color: AppColors.containerBorderColor, // dark blue like the image
           shape: BoxShape.circle,
         ),
         child: Icon(icon, color: Colors.white, size: 18),
       ),
     );
   }

  Widget? _agreements(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.containerBorderGreyColor),
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("IMPACT 1",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w700,fontSize: 16),),
              Text("\$56",style: TextStyle(color: AppColors.primaryTextColor,fontWeight: FontWeight.w400),),
            ],
          ),
          Expanded(child: SizedBox()),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: AppColors.blueBgColor,
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _circleButton(Icons.remove, (){}),
                const SizedBox(width: 12),
                Text(
                  '6',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),
                ),
                const SizedBox(width: 12),
                _circleButton(Icons.add, (){}),
              ],
            ),
          ),
        ],
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
