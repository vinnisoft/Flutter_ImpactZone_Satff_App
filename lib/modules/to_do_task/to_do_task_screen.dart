import 'package:impact_zone/export.dart';
import 'package:dotted_line/dotted_line.dart';
class ToDoTaskScreen extends GetView<ToDoTaskController>{
  const ToDoTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitleText: keyToDoTasks.tr,
        actionWidget: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(AppImages.iconsBell),
          )
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
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: controller.isCompletedTodo.value?BoxDecoration(
              color: Color(0xff252B42),
              borderRadius: BorderRadius.circular(6)
            ):BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Color(0xffE9E9E9),strokeAlign: 1)
            ),
            child: Text(keyCompletedTODO.tr,textAlign:TextAlign.center,style: TextStyle(color:  controller.isCompletedTodo.value?Color(0xffFFFFFF):Color(0xff969696),fontWeight: FontWeight.w500),),
          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: InkWell(
          onTap: (){
            controller.changeTodoHeaderStatus(false);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: controller.isCompletedTodo.value?BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Color(0xffE9E9E9),strokeAlign: 1)
            ):BoxDecoration(
                color: Color(0xff252B42),
                borderRadius: BorderRadius.circular(6)
            ),
            child: Text(keyInCompleteTODO.tr,textAlign:TextAlign.center,style: TextStyle(color:
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
        child: Center(child: Text(keyTodoListEmpty.tr,style: TextStyle(color: Color(0xff1F1F21),fontWeight: FontWeight.w700),)),
      );
    }
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 10)
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
                margin: EdgeInsets.only(right: 20,left: 0),
                decoration: BoxDecoration(
                    color: Color(0xffF0F3FF),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Image.asset(AppImages.iconsAppLogo,width: 20,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.myTodoList[index].taskTitle.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff1F1F21),height: 0),),
                    Text(controller.myTodoList[index].taskType.toString().toLowerCase(),maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff848484),height: 0,),)
                  ],
                ),
              ),
              SizedBox(width: 10.h,),
              Image.asset(AppImages.iconsCompleteTodo,width: 20,),
            ],
          ),
          if(index!=controller.myTodoList.length-1)Container(
            padding: EdgeInsets.only(left: 25),
            height: 30,
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
    // if(controller.myTodoList[index].status=="COMPLETE"){
    //   return SizedBox();
    // }
    return  InkWell(
      onTap: (){
        // Get.toNamed(AppRoutes.routeTodoDescription,
        //   arguments: {
        //     'title': 'title',
        //     'memberName': 'memberName',
        //     'description': 'description',
        //     'AssignedBy': 'AssignedBy',
        //     'dueDate': 'dueDate',
        //   },);

      },
      child: controller.isTaskLoading.value
          ? ShimmerEffect.shimmerTaskListContent(showCompleted: true):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(right: 20,left: 0),
                decoration: BoxDecoration(
                    color: Color(0xffF0F3FF),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Image.asset(AppImages.iconsAppLogo,width: 20,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.myTodoList[index].taskTitle.toString(),maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xff1F1F21),height: 0),),
                    Text(controller.myTodoList[index].taskType.toString().toLowerCase(),maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff848484),height: 0,),)
                  ],
                ),
              ),
              SizedBox(width: 10.h,),
              controller.isCompletedTodo.value?SizedBox():controller.myTodoList[index].bookmarkStatus==true?InkWell(
                onTap: (){
                  controller.updateBookMarkStatus(controller.myTodoList[index].id.toString(),false);
                },
                  child: Image.asset(AppImages.iconsBookmark,width: 20,)):
              InkWell(
                onTap: (){
                  controller.updateBookMarkStatus(controller.myTodoList[index].id.toString(),true);
                },
                  child: Image.asset(AppImages.iconsEmptyBookmark,width: 20,)),
              SizedBox(width: 5,),
              controller.myTodoList[index].status=="COMPLETED"?Image.asset(AppImages.iconsCompleteTodo,width: 20,):
              InkWell(
                onTap: (){
                  controller.todoListUpdateApi(controller.myTodoList[index].id.toString(),"COMPLETED");
                },
                  child: Image.asset(AppImages.iconsUnCheckTodo,width: 20,)
              ),
            ],
          ),
          if(index!=controller.myTodoList.length-1)Container(
              padding: EdgeInsets.only(left: 25),
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