
import 'package:impact_zone/export.dart';


class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyNotifications.tr,),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
           Container(
             margin: EdgeInsets.all(20),
             decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                       color: Colors.black12,
                       spreadRadius:2,
                       blurRadius: 10)
                 ],
                 borderRadius: BorderRadius.circular(15.r)),
             child: ListView.builder(
               shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                 itemCount: 40,
                 itemBuilder: _notificationItem,
             ),
           )
        ],
      ),
    );
  }

  Widget? _notificationItem(BuildContext context, int index) {
    return Container(
      color: index==0||index==1?AppColors.blueBgColor:Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right:10 ),
                decoration: BoxDecoration(
                  color: index==0||index==1?Colors.white:AppColors.blueBgColor,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: AssetImageWidget(AppImages.iconsAppLogo,imageWidth: 20,),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lorem Ipsum is simply dummy text of the printing.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.primaryTextColor),),
                    Text("5 min ago",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.secondaryTextColor),).paddingOnly(top: 5),
                  ],
                ),
              )
            ],
          ),
          index==0||index==1?SizedBox():Divider(color: AppColors.containerGreyColor,).paddingOnly(top: 10)
        ],
      ),
    );
  }
}
