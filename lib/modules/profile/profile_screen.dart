import 'package:impact_zone/export.dart';

class ProfileScreen extends GetView<ProfileController> {
   ProfileScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        drawer: DrawerWidget(),
        key: _scaffoldKey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TopBannerWidget(scaffoldKey: _scaffoldKey,title: keyProfile.tr,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: 20.h,),
                      Obx(
                            ()=> controller.isProfileLoading.value?ShimmerEffect.profileShimmer():Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Profile image with rounded corners
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12.r),
                                        child:    NetworkImageWidget(
                                          imageUrl: "https://impactzoneapi.appdeft.in/public/1738649763853.jpg",
                                          imageHeight: 80.h,
                                          imageWidth: 80.h,
                                          radiusAll: 8.r,
                                        ),
                                      ),

                                      controller.isEditProfile.value?Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width: 120.h,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.4),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12.r),
                                              bottomRight: Radius.circular(12.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: AssetImageWidget(
                                              AppImages.iconsProfileCameraIcon,
                                            ),
                                          ),
                                        ),
                                      ):SizedBox(),
                                    ],
                                  ),

                                  controller.isEditProfile.value?SizedBox():InkWell(
                                      onTap: (){
                                        controller.isEditProfile.value=true;
                                      },
                                      child: Text(keyEdit.tr,style:textStyleHeadlineMedium().copyWith(decoration: TextDecoration.underline,fontSize: 14.sp)))
                                ],
                              ),
                            ),
                            Text(controller.profileData.value.firstName.toString()+controller.profileData.value.lastName.toString()?? "",style:textStyleHeadlineMedium().copyWith(fontWeight:FontWeight.w700)).paddingOnly(right: 20),
                            controller.isEditProfile.value?
                            Container(
                              margin: EdgeInsets.all(20.h),
                              padding: EdgeInsets.all(20.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                                  ]),
                              child: Column(
                                children: [
                                  _form(icons: AppImages.iconsSingleUserIcon,title:keyName.tr,textEditingController: controller.nameTextController),
                                  _form(icons: AppImages.iconsBarCodeIcon,title:keyBarCode.tr,textEditingController: controller.barcodeTextController),
                                  _form(icons: AppImages.iconsAccessCodeIcon,title:keyAccessCode.tr,textEditingController: controller.accessTextController),
                                  _form(icons: AppImages.iconsEmail,title:keyEmail.tr,textEditingController: controller.emailTextController,isEmail: true),
                                  _form(icons: AppImages.iconsCall,title:keyPhoneNo.tr,textEditingController: controller.phoneTextController),
                                  // _form(icons: AppImages.iconsLocation,title:keyHireDate.tr,textEditingController: controller.hireDateTextController),
                                  // _form(icons: AppImages.iconsLocation,title:keyStreetAddress.tr,textEditingController: controller.streetTextController),
                                  _form(icons: AppImages.iconsLocation,title:keyCity.tr,textEditingController: controller.cityTextController),
                                  _form(icons: AppImages.iconsLocation,title:keyState.tr,textEditingController: controller.stateTextController),
                                  _form(icons: AppImages.iconsLocation,title:keyZipCode.tr,textEditingController: controller.zipTextController),
                                  PrimaryBottomButton(callBack: (){controller.updateProfileApiCall();}, title: keySave.tr).paddingOnly(top: 20.h)
                                ],
                              ),
                            )
                                :Container(
                              margin: EdgeInsets.all(20.h),
                              padding: EdgeInsets.all(20.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                                  ]),
                              child: Column(
                                children: [
                                  _userDetails(title: keyBarCode.tr,detail: controller.profileData.value.barCode?? ""),
                                  _userDetails(title: keyAccessCode.tr,detail: controller.profileData.value.accessCode?? ""),
                                  _userDetails(title: keyEmail.tr,detail: controller.profileData.value.email?? ""),
                                  _userDetails(title: keyPhoneNo.tr,detail: controller.profileData.value.primaryPhone?? ""),
                                  _userDetails(title: keyHireDate.tr,detail:  ""),
                                  _userDetails(title: keyStreetAddress.tr,detail:""),
                                  _userDetails(title: keyCity.tr,detail: controller.profileData.value.city?? ""),
                                  _userDetails(title: keyState.tr,detail: controller.profileData.value.state.toString()??"",),
                                  _userDetails(title: keyZipCode.tr,detail:controller.profileData.value.zipCode?? "",removeDivider: true),
                                ],
                              ),
                            ),
                            controller.isEditProfile.value?SizedBox():Container(
                              margin: EdgeInsets.all(20.h),
                              padding: EdgeInsets.all(20.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(keyPassword.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                                        Text("**********",style:textStyleBodyMedium().copyWith(fontSize: 14.sp)),
                                      ]
                                  ),
                                  InkWell(
                                      onTap: (){
                                        Get.toNamed(AppRoutes.routeChangePasswordScreen);
                                      },
                                      child: Text(keyChangePassword.tr,style:textStyleBodyMedium().copyWith(decoration:TextDecoration.underline,))
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ).paddingOnly(bottom: 20.h),
    );
  }

  _userDetails({required String title,required String detail,bool removeDivider=false}){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style:textStyleHeadlineMedium().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700)),
            Text(detail,style:textStyleBodyMedium()),
          ],
        ),
        removeDivider?SizedBox():Divider(
          color: AppColors.containerGreyColor,
          thickness: 1,
        ).paddingSymmetric(vertical: 10.h),
      ],
    );
  }

  _form({required String icons,required String title,TextEditingController? textEditingController,bool isEmail = false}) {
    return    TextFieldWidget(
        textController: textEditingController,
        label: title,
        validate: (value) =>
            isEmail?EmailValidator.validateEmail(value!):null,
        maxLength: 16,
        prefixIcon: AssetImageWidget(
          icons,
          imageHeight: 12.h,
        ).paddingSymmetric(vertical: 12.h, horizontal: 12.w),
        hint: title,
      ).paddingSymmetric(vertical: 6.h);
  }

}
