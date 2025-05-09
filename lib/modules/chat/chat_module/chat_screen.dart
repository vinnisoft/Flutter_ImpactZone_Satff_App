import 'package:impact_zone/export.dart';



class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _chatAppBar(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemBuilder: _chatItems,
                    itemCount: 6).paddingSymmetric(horizontal: 20),
              ),
             _chatTextField()
            ],
          ),
        ],
      ),
    );
  }
  _chatAppBar() => Stack(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child:AssetImageWidget(
                    AppImages.iconsBack,
                    imageHeight: 20.h,
                  )
              ),
              Stack(
                children: [
                  NetworkImageWidget(
                    imageUrl: "${baseUrl}public/1738333626870.JPEG",
                    imageHeight: 35.h,
                    imageWidth: 35.h,
                    radiusAll:30 ,
                  ),
                  Positioned(
                    bottom: 2,
                      right: 2,
                      child: AssetImageWidget(AppImages.iconsActiveIcon)
                  )
                ],
              ).paddingSymmetric(horizontal: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jhon Abraham",style:textStyleBodyMedium().copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16.sp),),
                  Text(keyActiveNow.tr,style: textStyleBodyMedium().copyWith(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12.sp),),
                ],
              )

            ],
          ).paddingOnly(top: 20.h, left: 12.h, right: 12.h),
        )
      ]
  );

  Widget? _chatItems(BuildContext context, int index) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFF8FBFA),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(keyToday.tr, style:textStyleBodySmall().copyWith(color: Color(0xff000E08),fontSize: 12.sp,fontWeight: FontWeight.w500)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomChatWidget(
                message: 'Hello! Jhon abraham',
                isSender: true,
                time: '09:25 AM',
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkImageWidget(
              imageUrl: "${baseUrl}public/1738333626870.JPEG",
              imageHeight: 35.h,
              imageWidth: 35.h,
              radiusAll:30 ,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jhon Abraham',
                      style:textStyleBodyMedium().copyWith(color: AppColors.appColor,
                    fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  CustomChatWidget(
                    message: 'Hello ! Nazrul How are you?',
                    isSender: false,
                    time: '09:25 AM',
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: CustomChatWidget(
            message: 'You did your job well!jkhuhhhholholhoihlohoihohh!',
            isSender: true,
            time: '09:25 AM',
          ),
        ),
        SizedBox(height: 20.h,)
      ],
    );
  }
  _chatTextField() {
    return  Column(
      children: [
        Divider(color: Color(0xFFEEFAF8),thickness: 1,),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: (){
               _choseMediaType();
              },
                child: AssetImageWidget(AppImages.iconsAttachmentIcon,).paddingOnly(right: 20.w)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFF3F6F6)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    Expanded(
                      child: TextFieldWidget(
                        textController: controller.chatTextController,
                      contentPadding: EdgeInsets.zero,
                        hint: keyWriteYourMessage.tr,
                        decoration: InputBorder.none,
                        hintStyle:textStyleLabelMedium().copyWith( color:AppColors.secondaryTextColor,fontWeight: FontWeight.w500),
                      ),
                    ),
                    AssetImageWidget(AppImages.iconsSendIcon,),
                  ],
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 20,vertical: 20),
      ],
    );
  }



  _choseMediaType() => Get.bottomSheet(
      Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 6.h,
              width: 120.w,
              decoration: BoxDecoration(
                  color: AppColors.bottomSheetBarColor,
                  borderRadius: BorderRadius.circular(15.r)),
            ),
               Text(keyShare.tr,style:textStyleHeadlineLarge()).paddingSymmetric(vertical: 20.h),
            _mediaItems(title: keyCamera.tr,icons: AppImages.iconsCameraIcon,callback: ()async{
              bool permissionGranted = await Helper.checkCameraPermission();
              if (!permissionGranted) {
                debugPrint("Permission denied.");
                return;
              }
              Helper.takePhoto();
            }),
            _mediaItems(title:keyDocuments.tr,icons: AppImages.iconsDocsIcon,subTitle: keyShareYourFiles.tr,callback: ()async{
              bool permissionGranted = await Helper.checkStoragePermission();

              if (!permissionGranted) {
                debugPrint("Permission denied.");
                return;
              }
              File? file=await Helper.pickFile(fileType: "File");
              if(file==null){
                return;
              }
              controller.pickedFile.value=file;
            }),
            _mediaItems(title: keyMedia.tr,icons: AppImages.iconsMediaIcon,hideDivider: true,subTitle:keySharePhotos.tr,callback: ()async{
              bool permissionGranted = await Helper.checkStoragePermission();

              if (!permissionGranted) {
                debugPrint("Permission denied.");
                return;
              }
              File? file=await Helper.pickFile();
              if(file==null){
              return;
              }
              controller.pickedFile.value=file;


            }),
          ],
        ).paddingOnly(top: 5.h, bottom: 40.h),
      ),
      barrierColor: Colors.black26,
      backgroundColor: Colors.white);

  _mediaItems({required String title,required String icons,String subTitle="",bool hideDivider=false,required Function() callback}){
    return     Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Get.back();
                callback();
              },
                child: AssetImageWidget(icons).paddingOnly(right: 20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style:textStyleHeadlineMedium()),
                subTitle.isNotEmpty?Text(subTitle,style:textStyleBodySmall()):SizedBox(),
              ],
            ),
          ],
        ),
        hideDivider?SizedBox():Divider(color: AppColors.containerGreyColor,).paddingSymmetric(vertical: 10)
      ],
    );
  }

}


