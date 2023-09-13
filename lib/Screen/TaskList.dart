import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/TaskListModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/CommentPage.dart';
import 'package:tranlate/Screen/TaskDetail.dart';
import 'package:tranlate/Widget/bottombar.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class task {
  String tasktitle;
  String tasktime;
  String abouttask;
  String status;

  task(this.tasktitle, this.tasktime, this.abouttask, this.status);
}

List<task> data = [
  task(
      "https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8anBnfGVufDB8fDB8fHww&w=1000&q=80",
      'Wisdom loy',
      'Flutter Besides',
      "02:40 PM"),
];

class _TaskListState extends State<TaskList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Taskapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.5.h,
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
                              "Task List",
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
                      tasklistmodal?.status == 'false'
                          ? Container(
                          height: 80.h,
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "No Task Available",
                              style: TextStyle(
                                  fontFamily: "task",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.black),
                            ),
                          ))
                          : Container(
                              height: 80.h,
                              child: ListView.builder(
                                itemCount: tasklistmodal?.clientData?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 1.h,
                                    ),
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child:Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 89.w,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 60.w,
                                                child: Text(
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  tasklistmodal
                                                                  ?.clientData?[
                                                                      index]
                                                                  .taskName ==
                                                              '' ||
                                                          tasklistmodal
                                                                  ?.clientData?[
                                                                      index]
                                                                  .taskName ==
                                                              null
                                                      ? 'N/A'
                                                      : tasklistmodal
                                                              ?.clientData?[
                                                                  index]
                                                              .taskName ??
                                                          '',
                                                  style: TextStyle(
                                                      fontSize: 14.5.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'task',
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              tasklistmodal?.clientData?[index].taskType == '2'?Container(
                                                child: Text("Fixed Work", style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: "task")),
                                              ):Row(
                                                children: [
                                                  Icon(Icons.timer_outlined),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Text(
                                                    tasklistmodal
                                                                    ?.clientData?[
                                                                        index]
                                                                    .totalHours ==
                                                                '' ||
                                                            tasklistmodal
                                                                    ?.clientData?[
                                                                        index]
                                                                    .totalHours ==
                                                                null
                                                        ? 'N/A'
                                                        : tasklistmodal
                                                                ?.clientData?[
                                                                    index]
                                                                .totalHours ??
                                                            '',
                                                    style: TextStyle(
                                                        fontSize: 12.5.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'task',
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 89.w,
                                          child: Text(
                                            tasklistmodal?.clientData?[index]
                                                            .taskDescription ==
                                                        '' ||
                                                    tasklistmodal
                                                            ?.clientData?[index]
                                                            .taskDescription ==
                                                        null
                                                ? 'N/A'
                                                : tasklistmodal
                                                        ?.clientData?[index]
                                                        .taskDescription ??
                                                    '',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'task',
                                                color: Colors.grey.shade500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CommentPage(
                                                                taskid: tasklistmodal
                                                                    ?.clientData?[
                                                                        index]
                                                                    .taskId,
                                                              )),
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.comment,
                                                    size: 25.sp,
                                                    color: Color(0xff0a4eb7),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  width: 23.w,
                                                  height: 5.h,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      TaskDetail(
                                                                        taskid: tasklistmodal
                                                                            ?.clientData?[index]
                                                                            .taskId,
                                                                      )));
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        primary:
                                                            Color(0xff0165FF)),
                                                    child: Text(
                                                      "View",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13.2.sp,
                                                          fontFamily: "task"),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Container(
                                              height: 5.h,
                                              width: 0.4.w,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Row(
                                              children: [
                                                Text('Status :',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "task")),
                                                SizedBox(width: 1.w),
                                                Text(
                                                    tasklistmodal
                                                                ?.clientData?[
                                                                    index]
                                                                .status ==
                                                            '1'
                                                        ? 'Pending'
                                                        : tasklistmodal
                                                                    ?.clientData?[
                                                                        index]
                                                                    .status ==
                                                                '2'
                                                            ? 'Assign'
                                                            : tasklistmodal
                                                                        ?.clientData?[
                                                                            index]
                                                                        .status ==
                                                                    '3'
                                                                ? 'Completed'
                                                                : 'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: "task")),
                                                Icon(
                                                  tasklistmodal
                                                              ?.clientData?[
                                                                  index]
                                                              .status ==
                                                          '1'
                                                      ? Icons.watch_later
                                                      : tasklistmodal
                                                                  ?.clientData?[
                                                                      index]
                                                                  .status ==
                                                              '2'
                                                          ? Icons.info
                                                          : tasklistmodal
                                                                      ?.clientData?[
                                                                          index]
                                                                      .status ==
                                                                  '3'
                                                              ? Icons
                                                                  .check_circle
                                                              : Icons.cancel,
                                                  color: tasklistmodal
                                                              ?.clientData?[
                                                                  index]
                                                              .status ==
                                                          '1'
                                                      ? Colors.yellow
                                                      :tasklistmodal
                                                                  ?.clientData?[
                                                                      index]
                                                                  .status ==
                                                              '2'
                                                          ? Colors.orange
                                                          : tasklistmodal
                                                                      ?.clientData?[
                                                                          index]
                                                                      .status ==
                                                                  '3'
                                                              ? Colors.green
                                                              : Colors.red,
                                                  size: 21,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }


  Taskapi() async {
    final Map<String, String> data = {};
    data['client_id'] = usermodal?.userData?.uid ?? "";
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().TaskListapi(data).then((response) async {
          tasklistmodal = TaskListModal.fromJson(json.decode(response.body));
          print(tasklistmodal?.status);
          if (response.statusCode == 200 &&
              tasklistmodal?.status == "success") {

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(()
        {
          isLoading = false;
        });
        buildErrorDialog(context, '', "Internet Required");
      }
    });
  }

}