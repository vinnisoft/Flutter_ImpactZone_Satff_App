
import 'package:impact_zone/export.dart';

class AddNewCardScreen extends GetView<PosCardOnFileController> {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitleText: keyAddNewCard.tr, actionWidget: [
        AssetImageWidget(
          AppImages.iconsNotification,
          imageHeight: 20.h,
        ),
      ],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(keyNameOnCard.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                  _cardForm(hintText: "Aycan Doganlar",icon: AppImages.iconsSingleUserIcon),
                  Text(keyCardNumber.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                  _cardForm(icon:AppImages.iconsCardIcon ,hintText:"1234 4567 7890 1234" ),
        
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(keyExpiry.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                            _cardForm(icon:AppImages.iconsDate ,hintText:"02/24" ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(keyCVV.tr,style: TextStyle(color: AppColors.primaryTextColor,fontSize: 16,fontWeight: FontWeight.w500),),
                            _cardForm(hintText:"•••" ,icon:AppImages.iconsCvvIcon ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PrimaryBottomButton(callBack: (){
                  }, title: keyAdd.tr,).paddingOnly(top: 20)
                ],
              ),
            ).paddingAll(20),
        
          ],
        ),
      ),
    );
  }

  _cardForm({required String icon,required String hintText}) {
    return  TextFieldWidget(
      hint:hintText,
      prefixIcon: AssetImageWidget(
        icon,
        imageHeight: 12.h,
      ).paddingSymmetric(vertical: 10.h, horizontal: 12.w),

      validate: (value) => EmailValidator.validateEmail(value ?? ''),
    ).paddingSymmetric(vertical: 12.h);
  }
}
