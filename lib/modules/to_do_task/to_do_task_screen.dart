import 'package:impact_zone/export.dart';

class ToDoTaskScreen extends GetView<ToDoTaskController>{
  const ToDoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyToDoTasks.tr,
        actionWidget: [
          AssetImageWidget(AppImages.iconsBell)
        ],
      ),
       body:SingleChildScrollView(
           child: Obx(
               () {
                 return Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                 children: [
                   _todoStatus(),
                   _todoList(),
                 ],
               ),
             );
               },
           ),
         ),
    );
  }

  _todoStatus() =>Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Expanded(
        child: InkWell(
          onTap: (){
            controller.changeTodoHeaderStatus(true);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: controller.isCompletedTodo.value?BoxDecoration(
              color: Color(0xff252B42),
              borderRadius: BorderRadius.circular(6.r)
            ):BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Color(0xffE9E9E9),strokeAlign: 1)
            ),
            child: Text(keyCompletedTODO.tr,textAlign:TextAlign.center,style:textStyleBodyMedium().copyWith(color:  controller.isCompletedTodo.value?Color(0xffFFFFFF):Color(0xff969696),fontWeight: FontWeight.w500),),
          ),
        ),
      ),
      SizedBox(width: 20.w,),
      Expanded(
        child: InkWell(
          onTap: (){
            controller.changeTodoHeaderStatus(false);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: controller.isCompletedTodo.value?BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Color(0xffE9E9E9),strokeAlign: 1)
            ):BoxDecoration(
                color: Color(0xff252B42),
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Text(keyInCompleteTODO.tr,textAlign:TextAlign.center,style:textStyleBodyMedium().copyWith(color:
               controller.isCompletedTodo.value?Color(0xff969696):Color(0xffFFFFFF),fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    ],
  );

  _todoList() {
    if(controller.myTodoList.isEmpty && !controller.isTaskLoading.value){
      return Padding(
        padding:  EdgeInsets.symmetric(vertical: Get.height * 0.3),
        child: Center(child: Text(keyTodoListEmpty.tr,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700))),
      );
    }
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
    margin: EdgeInsets.symmetric(vertical: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2.r, blurRadius: 10.r)
        ]),
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.isTaskLoading.value ? 12 :  controller.myTodoList.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_,index){
        return _todoItems(index);
    })
  );
  }


  _todoItems(int index) {
    if(controller.isCompletedTodo.value){
      return _completedTodoList(index);
    }
    else{
      return _completeTodoList(index);
    }

  }

  _completedTodoList(int index) {

        if(controller.isTaskLoading.value){
          return ShimmerEffect.shimmerTaskListContent(showCompleted: true);
        }
      if(controller.myTodoList[index].status!="COMPLETED"){
       return SizedBox();
      }
    return  InkWell(
      onTap: (){
        Get.toNamed(AppRoutes.routeTodoDescription,
            arguments: {
            'task_id':controller.myTodoList[index].id.toString()
            });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 20.w,left: 0.w),
                decoration: BoxDecoration(
                    color: Color(0xffF0F3FF),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: AssetImageWidget(AppImages.iconsAppLogo,imageWidth: 20.w,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.myTodoList[index].taskTitle.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                    Text(controller.myTodoList[index].taskType.toString().toLowerCase(),maxLines:1,overflow:TextOverflow.ellipsis,style:textStyleBodyMedium().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp))
                  ],
                ),
              ),
              SizedBox(width: 10.h,),
              AssetImageWidget(AppImages.iconsCompleteTodo,imageWidth: 20.w,),
            ],
          ),
          if(index!=controller.myTodoList.length-1)Container(
            padding: EdgeInsets.only(left: 25.w),
            height: 30.h,
            child: DottedLine(
              direction: Axis.vertical,
              dashColor: Color(0xffD7D7D7),
              lineLength: double.infinity,
              dashLength: 12.0,
              dashGapLength: 6.0,
            ),
          ),

        ],
      ),
    );
  }

  _completeTodoList(int index) {
    return  InkWell(
      onTap: (){
      },
      child: controller.isTaskLoading.value
          ? ShimmerEffect.shimmerTaskListContent(showCompleted: true):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 20.w,left: 0.w),
                decoration: BoxDecoration(
                    color: Color(0xffF0F3FF),
                    borderRadius: BorderRadius.circular(4.r)
                ),
                child: AssetImageWidget(AppImages.iconsAppLogo,imageWidth: 20.w,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.myTodoList[index].taskTitle.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style: textStyleHeadlineMedium().copyWith(fontWeight: FontWeight.w700)),
                    Text(controller.myTodoList[index].taskType.toString().toLowerCase(),maxLines:1,overflow:TextOverflow.ellipsis,style: textStyleBodyMedium().copyWith(fontWeight: FontWeight.w400,fontSize: 14.sp),)
                  ],
                ),
              ),
              SizedBox(width: 10.h,),
              controller.isCompletedTodo.value?SizedBox():controller.myTodoList[index].bookmarkStatus==true?InkWell(
                onTap: (){
                  controller.updateBookMarkStatus(controller.myTodoList[index].id.toString(),false);
                },
                  child: AssetImageWidget(AppImages.iconsBookmark,imageWidth: 15.w,)):
              InkWell(
                onTap: (){
                  controller.updateBookMarkStatus(controller.myTodoList[index].id.toString(),true);
                },
                  child: AssetImageWidget(AppImages.iconsEmptyBookmark,imageWidth: 15.w,)),
              SizedBox(width: 5,),
              controller.myTodoList[index].status=="COMPLETED"?AssetImageWidget(AppImages.iconsCompleteTodo,imageWidth: 20.w,):
              InkWell(
                onTap: (){
                  controller.todoListUpdateApi(controller.myTodoList[index].id.toString(),"COMPLETED");
                },
                  child: AssetImageWidget(AppImages.iconsUnCheckTodo,imageWidth: 20.w,)
              ),
            ],
          ),
          if(index!=controller.myTodoList.length-1)Container(
              padding: EdgeInsets.only(left: 25.w),
              height: 27,
              child: DottedLine(
              direction: Axis.vertical,
              dashColor: Color(0xffD7D7D7),
              lineLength: double.infinity,
              dashLength: 9.0,
              dashGapLength: 3.0,
              ),
              ),

        ],
      ),
    );
  }

}