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
              TopBannerWidget(scaffoldKey: _scaffoldKey,title: keyChat.tr,),
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
         padding: const EdgeInsets.symmetric(horizontal: 12),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(12),
           border: Border.all(color: Color(0xffE9E9E9)),

         ),

         child: Row(
           children: [
             AssetImageWidget(AppImages.iconsSearch,imageWidth: 20.w,),
             SizedBox(width: 8.w),
             Expanded(
               child: TextFieldWidget(
                 textController: controller.searchTextController,
                 decoration: InputBorder.none,
                 contentPadding: EdgeInsets.zero,
                 hint: keySearch.tr,
                 hintStyle: textStyleBodySmall().copyWith(
                     color: Color(0xff969696),
                     fontWeight: FontWeight.w400
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }




   Widget _chatList() {
     return Padding(
         padding:  EdgeInsets.symmetric(horizontal: 20.w),
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
             child: _chatItem(index)
           ),
           separatorBuilder: (BuildContext context, int index) =>
               SizedBox(
                 height: 20.h,
               ),
         ),
     );
   }

  _chatItem(int index) {
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
               Text("Alex Linderson",style:textStyleBodyMedium().copyWith(fontSize: 18.sp,fontWeight: FontWeight.w700,color: AppColors.primaryTextColor)),
               Text("Don’t miss to attend the meeting.",overflow:TextOverflow.ellipsis,maxLines:1,style: textStyleBodyMedium().copyWith(
                   fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.secondaryTextColor
               ),)
             ],
           ),
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text("2 min ago",maxLines:1,style:textStyleBodySmall().copyWith()),
             index==1||index==3||index==5? Container(
               width: 20.w,
               height: 20.h,
               decoration: BoxDecoration(
                 color:AppColors.textRedColor,
                 borderRadius: BorderRadius.circular(30.r)
               ),
               child: Center(child: Text(index.toString(),textAlign:TextAlign.center,style:textStyleBodySmall().copyWith(color:Colors.white))),
             ):SizedBox()
           ],
         ),
       ],
     );
  }




}
