import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/TaskListDetailModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/InvoiceDetail.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';


class TaskDetail extends StatefulWidget {
  String? title;
  String? taskid;

  TaskDetail({
    super.key,
    this.title,
    required this.taskid,
  });

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TaskListDetailModalapi();
  }

  @override
  Widget build(BuildContext context) {
    bool read = true;
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer1(),
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Text(
                              "View Task",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "task"),
                            ),
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                icon: Icon(Icons.menu)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff246bfb)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 4.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Task Title",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0.5.h),
                                      child: Text(
                                        tasklistdetailmodal
                                                        ?.taskData?.taskName ==
                                                    '' ||
                                                tasklistdetailmodal
                                                        ?.taskData?.taskName ==
                                                    null
                                            ? 'N/A'
                                            : tasklistdetailmodal
                                                    ?.taskData?.taskName ??
                                                "",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'task',
                                            color: Colors.white70),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                tasklistdetailmodal?.taskData?.taskType == '2'? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Hours",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      width: 40.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "Fixed Work",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "task")),

                                        ],
                                      ),
                                    ),
                                  ],
                                ):
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Hours",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      width: 40.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              (tasklistdetailmodal?.taskData
                                                          ?.totalHours)
                                                      .toString() +
                                                  " Hrs",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "task")),
                                          Icon(
                                            Icons.timer_outlined,
                                            color: Color(0xff0165FF),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      width: 43.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              tasklistdetailmodal
                                                          ?.taskData?.status ==
                                                      '1'
                                                  ? 'Pending'
                                                  : tasklistdetailmodal
                                                              ?.taskData
                                                              ?.status ==
                                                          '2'
                                                      ? 'Assign'
                                                      : tasklistdetailmodal
                                                                  ?.taskData
                                                                  ?.status ==
                                                              '3'
                                                          ? 'Completed'
                                                          : 'Cancel',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "task")),
                                          SizedBox(
                                            width: 0.5.w,
                                          ),
                                          Icon(
                                            tasklistdetailmodal
                                                        ?.taskData?.status ==
                                                    '1'
                                                ? Icons.watch_later
                                                : tasklistdetailmodal?.taskData
                                                            ?.status ==
                                                        '2'
                                                    ? Icons.info
                                                    : tasklistdetailmodal
                                                                ?.taskData
                                                                ?.status ==
                                                            '3'
                                                        ? Icons.check_circle
                                                        : Icons.cancel,
                                            color: tasklistdetailmodal
                                                        ?.taskData?.status ==
                                                    '1'
                                                ? Colors.yellow
                                                : tasklistdetailmodal?.taskData
                                                            ?.status ==
                                                        '2'
                                                    ? Colors.orange
                                                    : tasklistdetailmodal
                                                                ?.taskData
                                                                ?.status ==
                                                            '3'
                                                        ? Colors.green
                                                        : Colors.red,
                                            size: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.8.h, horizontal: 4.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "About Task",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        letterSpacing: 1,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    tasklistdetailmodal?.taskData
                                                    ?.taskDescription ==
                                                '' ||
                                            tasklistdetailmodal?.taskData
                                                    ?.taskDescription ==
                                                null
                                        ? 'N/A'
                                        : tasklistdetailmodal
                                                ?.taskData?.taskDescription ??
                                            "",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'task',
                                        color: Colors.black54),
                                    maxLines: read ? null : 2,
                                    overflow: read
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.only(left: 245, bottom: 15),
                                  //   child: InkWell(
                                  //     focusColor: Colors.black,
                                  //     onTap: () {
                                  //       setState(() {
                                  //         read = !read;
                                  //       });
                                  //     },
                                  //     child: Container(
                                  //         child: read
                                  //             ? Text(
                                  //                 "Read Less",
                                  //                 style: TextStyle(
                                  //                     color: Colors.black,
                                  //                     fontWeight: FontWeight.bold),
                                  //               )
                                  //             :Text("Read More...",
                                  //                 style: TextStyle(
                                  //                     color: Colors.black,
                                  //                     fontWeight: FontWeight.bold))),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.8.h, horizontal: 4.w),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "From Language",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        letterSpacing: 1,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 0.0.h),
                                      child: Row(
                                        children: [
                                          // Image.asset("img/flags.png",width:6.w,height: 3.5.h,),
                                          // SizedBox(
                                          //   width: 1.w,
                                          //
                                          // ),
                                          Expanded(
                                            child: Text(
                                              tasklistdetailmodal?.taskData
                                                              ?.fromLanguageName ==
                                                          '' ||
                                                      tasklistdetailmodal
                                                              ?.taskData
                                                              ?.fromLanguageName ==
                                                          null
                                                  ? 'N/A'
                                                  : tasklistdetailmodal
                                                          ?.taskData
                                                          ?.fromLanguageName ??
                                                      "",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "task",
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.9.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 3.1.h),
                                    child: Text(
                                      "To Language",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      // border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 3.5.h),
                                      child: Row(
                                        children: [
                                          // Image.asset("img/japan.png",width:7.w,height: 4.h,),
                                          // SizedBox(
                                          //   width: 1.w,
                                          //
                                          // ),
                                          Expanded(
                                            child: Text(
                                              tasklistdetailmodal?.taskData
                                                              ?.toLanguageName ==
                                                          '' ||
                                                      tasklistdetailmodal
                                                              ?.taskData
                                                              ?.toLanguageName ==
                                                          null
                                                  ? 'N/A'
                                                  : tasklistdetailmodal
                                                          ?.taskData
                                                          ?.toLanguageName ??
                                                      "",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: "task",
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.8.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfffefefe),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assigned to",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        letterSpacing: 1,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),

                                      // border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 0.5.h),
                                      child: Text(
                                        tasklistdetailmodal?.taskData
                                                        ?.assignToName ==
                                                    '' ||
                                                tasklistdetailmodal?.taskData
                                                        ?.assignToName ==
                                                    null
                                            ? 'N/A'
                                            : tasklistdetailmodal
                                                    ?.taskData?.assignToName ??
                                                "",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "task",
                                            color: Colors.black54),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {
                            tasklistdetailmodal?.taskData?.invoiceId == null ||
                                    tasklistdetailmodal?.taskData?.invoiceId ==
                                        ''
                                ? buildErrorDialog(context, '',
                                    'Task is Not Completed Yet ! ')
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InvoiceDetail(

                                              id: tasklistdetailmodal
                                                  ?.taskData?.invoiceId,
                                              ispaid: int.parse(
                                                  tasklistdetailmodal
                                                          ?.taskData?.status ??
                                                      ''),
                                            )));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              primary: Color(0xff0165FF)),
                          child: Text(
                            " View Invoice",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19.sp,
                                fontFamily: "task"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  TaskListDetailModalapi() async {
    final Map<String, String> data = {};
    data['client_id'] = usermodal?.userData?.uid ?? "";
    data['task_id'] = widget.taskid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().TaskListDetailModal(data).then((response) async {
          tasklistdetailmodal =
              TaskListDetailModal.fromJson(json.decode(response.body));
          print(tasklistdetailmodal?.status);
          if (response.statusCode == 200 &&
              tasklistdetailmodal?.status == "success") {
            print(tasklistdetailmodal?.taskData?.invoiceId);
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));
            setState(() {
              isLoading = false;
            });
          } else {
            buildErrorDialog(context, "", "Email or Password wrong");
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, '', "Internet Required");
      }
    });
  }
}
