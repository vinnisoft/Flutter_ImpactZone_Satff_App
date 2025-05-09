import 'package:impact_zone/export.dart';


class TodoTaskDetails extends  GetView<TodoTaskDetailsController> {

  const TodoTaskDetails({
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyToDoTasks.tr,
        actionWidget: [
          AssetImageWidget(AppImages.iconsBell)
        ],
      ),

      body: Obx(
          () {
            controller.isTodoDetailsLoading.value;
            if(controller.isTodoDetailsLoading.value){
              return ShimmerEffect.shimmerTaskDetailsContent(showCompleted: true);
            }
            if(controller.myTodoDetails.value==TaskDetailDataModel()) {
              return Text("");
            }
              String formatedDue ="2025-12-10T06:36:20.238Z";
            if(controller.myTodoDetails.value.dueDate!=null){
              formatedDue=controller.formatDate(controller.myTodoDetails.value.dueDate.toString());
            }
            else{
              formatedDue=controller.formatDate(formatedDue);

            }

            return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20.w),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12.r),
                   boxShadow: [
                     BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                   ]),
               child: Row(

                 children: [
                   Container(
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.only(top: 20.h,bottom: 20.h,right: 20.w,left: 0.w),
                     decoration: BoxDecoration(
                         color: Color(0xffF0F3FF),
                         borderRadius: BorderRadius.circular(4.r)
                     ),
                     child: AssetImageWidget(AppImages.imagesSplashLogo,imageWidth: 20.w,),
                   ),
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(controller.myTodoDetails.value.taskTitle.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700),),
                         Text(controller.myTodoDetails.value.taskType.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style:textStyleBodySmall().copyWith(fontSize: 14.sp),)
                       ],
                     ),
                   ),
                 ],
               ),
             ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                margin: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: Text(keyDescription.tr,style: textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                    ),

                    Text(controller.myTodoDetails.value.message.toString(),
                    style:textStyleBodySmall().copyWith(fontSize: 14.sp),),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical:10.h ),
                      child: Divider(color: Color(0xffE9E9E9),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(keyAssignedBy.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                        Flexible(
                          child: Text("${controller.myTodoDetails.value.member!.firstName.toString()} ${controller.myTodoDetails.value.member!.firstName.toString()}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleBodySmall().copyWith(fontSize: 14.sp),),
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical:10.h),
                      child: Divider(color: Color(0xffE9E9E9),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(keyDueDate.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                        Text(formatedDue,style:textStyleBodySmall().copyWith(fontSize: 14.sp),)
                      ],
                    ),


                  ],
                ),
              )
            ],
          ),
        );
          },
      ),
    );
  }
}
