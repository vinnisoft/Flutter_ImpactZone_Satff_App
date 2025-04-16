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
               padding: EdgeInsets.symmetric(horizontal: 20),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(12.r),
                   boxShadow: [
                     BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                   ]),
               child: Row(

                 children: [
                   Container(
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.only(top: 20,bottom: 20,right: 20,left: 0),
                     decoration: BoxDecoration(
                         color: Color(0xffF0F3FF),
                         borderRadius: BorderRadius.circular(4)
                     ),
                     child: AssetImageWidget(AppImages.imagesSplashLogo,imageWidth: 20.w,),
                   ),
                   Flexible(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(controller.myTodoDetails.value.taskTitle.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff1F1F21)),),
                         Text(controller.myTodoDetails.value.taskType.toString(),maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff848484)),)
                       ],
                     ),
                   ),
                 ],
               ),
             ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(keyDescription.tr,style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF2F3032)
                      ),),
                    ),

                    Text(controller.myTodoDetails.value.message.toString(),
                    style: TextStyle(fontWeight:FontWeight.w500,color: Color(0xffA6A6A6))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10 ),
                      child: Divider(color: Color(0xffE9E9E9),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(keyAssignedBy.tr,style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2F3032)
                        ),),
                        Flexible(
                          child: Text("${controller.myTodoDetails.value.member!.firstName.toString()} ${controller.myTodoDetails.value.member!.firstName.toString()}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            color: Color(0xffA6A6A6),
                            fontWeight: FontWeight.w500
                          ),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:10),
                      child: Divider(color: Color(0xffE9E9E9),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(keyDueDate.tr,style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF2F3032)
                        ),),
                        Text(formatedDue,style: TextStyle(
                            color: Color(0xffA6A6A6),
                            fontWeight: FontWeight.w500
                        ),)
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
