import 'package:impact_zone/export.dart';

class ChatListScreen extends GetView<ChatListController> {
   ChatListScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBanner(),
              _searchBar(),
              _chatList()
            ],
          ).paddingOnly(bottom: 30.h),
        ),
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
                   hintText: keySelect.tr,
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

  _topBanner() => Stack(
    children: [
      AssetImageWidget(
        AppImages.iconsHomeBg,
        imageHeight: 80.h,
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
              Text(keyChat.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22),),
              InkWell(
                onTap: ()=>Get.toNamed(AppRoutes.routeNotificationScreen),
                child: AssetImageWidget(
                  AppImages.iconsNotification,
                  imageHeight: 20.h,
                ),
              ),
            ],
          ),
        ],
      ).paddingOnly(top: 40.h, left: 12.h, right: 12.h)
    ],
  );


   Widget _chatList() {
     return Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: ListView.separated(
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           padding: EdgeInsets.only(top: 20.h),
           itemCount:6,
           itemBuilder: (BuildContext context, int index) =>

           InkWell(
             onTap: () {
              Get.toNamed(AppRoutes.routeChatScreen,);
             },
             child: _chatItem()
           ),
           separatorBuilder: (BuildContext context, int index) =>
               SizedBox(
                 height: 20.h,
               ),
         ),
     );
   }

  _chatItem() {
     return Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         NetworkImageWidget(
           imageUrl: "${baseUrl}public/1738333626870.JPEG",
           imageHeight: 35.h,
           imageWidth: 35.h,
           radiusAll:30 ,
         ).paddingOnly(right: 10),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Alex Linderson",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: AppColors.primaryTextColor),),
               Text("Don’t miss to attend the meeting.",overflow:TextOverflow.ellipsis,maxLines:1,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.secondaryTextColor),)
             ],
           ),
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text("2 min ago",maxLines:1,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: AppColors.secondaryTextColor)),
             Container(
               width: 20,
               height: 20,
               decoration: BoxDecoration(
                 color:AppColors.textRedColor,
                 borderRadius: BorderRadius.circular(30)
               ),
               child: Center(child: Text("4",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),)),
             )
           ],
         ),
       ],
     );
  }




}
