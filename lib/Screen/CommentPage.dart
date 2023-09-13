import 'dart:convert';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/AddCommentModal.dart';
import 'package:tranlate/Modals/CommentTaskModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/drawer.dart';
import 'package:tranlate/Widget/loader.dart';


class CommentPage extends StatefulWidget {
  String? comm;
  String? taskid;

  CommentPage({super.key, this.comm, this.taskid});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController _addcomm = TextEditingController();
  ScrollController _scrollController = ScrollController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool _showemoji = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        appBar: PreferredSize(
         preferredSize:  Size.fromHeight(6.h),
          child: AppBar(
            leadingWidth: MediaQuery.of(context).size.width,
            leading:  Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Column(
                  children: [
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                        Text(
                          "Comment",
                          style: TextStyle(
                              fontSize: 27,
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
                  ],
                ),
              ),
            ),
          ),
        ),
        key: _scaffoldKey,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 89.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  commenttaskmodal?.data?[0].taskName ==
                                      '' ||
                                      commenttaskmodal
                                          ?.data?[0].taskName ==
                                          null
                                      ? 'N/A'
                                      : commenttaskmodal
                                      ?.data?[0].taskName ??
                                      "",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'task',
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              commenttaskmodal?.data?[0].taskType == '2'
                                  ? Container(
                                child: Text("Fixed Work",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "task")),
                              )
                                  : Row(
                                children: [
                                  Icon(Icons.timer_outlined),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    commenttaskmodal?.data?[0]
                                        .totalHour ==
                                        '' ||
                                        commenttaskmodal?.data?[0]
                                            .totalHour ==
                                            null
                                        ? 'N/A'
                                        : commenttaskmodal?.data?[0]
                                        .totalHour ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
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
                            commenttaskmodal?.data?[0].taskDescription ==
                                '' ||
                                commenttaskmodal
                                    ?.data?[0].taskDescription ==
                                    null
                                ? 'N/A'
                                : commenttaskmodal
                                ?.data?[0].taskDescription ??
                                "",
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 2.w),
                            Row(
                              children: [
                                Text('Status :',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "task")),
                                SizedBox(width: 1.w),
                                Text(
                                    commenttaskmodal?.data?[0].status == '1'
                                        ? 'Pending'
                                        : commenttaskmodal
                                        ?.data?[0].status ==
                                        '2'
                                        ? 'Assign'
                                        : commenttaskmodal
                                        ?.data?[0].status ==
                                        '3'
                                        ? 'Completed'
                                        : 'Cancel',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "task")),
                                Icon(
                                  commenttaskmodal?.data?[0].status == '1'
                                      ? Icons.watch_later
                                      : commenttaskmodal?.data?[0].status ==
                                      '2'
                                      ? Icons.info
                                      : commenttaskmodal
                                      ?.data?[0].status ==
                                      '3'
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: commenttaskmodal
                                      ?.data?[0].status ==
                                      '1'
                                      ? Colors.yellow
                                      : commenttaskmodal?.data?[0].status ==
                                      '2'
                                      ? Colors.orange
                                      : commenttaskmodal
                                      ?.data?[0].status ==
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
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 57.h,
                    child: Column(
                      children: [
                        commenttaskmodal?.message == "Data Not Found!"
                            ? Container(
                            height: 55.h,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Text(
                                  "No Comments",
                                  style: TextStyle(
                                      fontFamily: "task",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                      color: Colors.black),
                                )))
                            : Container(
                    
                              height: 55.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                controller: _scrollController,
                                // reverse: true,
                                scrollDirection: Axis.vertical,
                                itemCount: commenttaskmodal?.data?.length,
                                itemBuilder: (context, index) {
                                  return commenttaskmodal
                                      ?.data?[index].userId ==
                                      usermodal?.userData?.uid
                                      ? Container(
                                    margin: EdgeInsets.only(left: 40.w),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(right: 2.h),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                commenttaskmodal
                                                    ?.data?[index]
                                                    .userName ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily: "task"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding:
                                                EdgeInsets.all(3.w),
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 1.h,
                                                    vertical: 0.5.w),
                                                width: 70.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                        30,
                                                      ),
                                                      topRight: Radius
                                                          .circular(
                                                        30,
                                                      ),
                                                      bottomLeft: Radius
                                                          .circular(
                                                        30,
                                                      )),
                                                  color:
                                                  Color(0xff0165FF),
                                                ),
                                                child: Text(
                                                  commenttaskmodal
                                                      ?.data?[index]
                                                      .comment ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontFamily: "task",
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 1.h),
                                                child: Text(
                                                    commenttaskmodal
                                                        ?.data?[index]
                                                        .commentTime ??
                                                        ""),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      : Container(
                                    margin: EdgeInsets.only(right: 40.w),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                          EdgeInsets.only(left: 2.w),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Text(
                                                commenttaskmodal
                                                    ?.data?[index]
                                                    .userName ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily: "task"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                EdgeInsets.all(3.w),
                                                margin:
                                                EdgeInsets.symmetric(
                                                    horizontal: 1.h,
                                                    vertical: 0.5.w),
                                                width: 70.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(
                                                          30,
                                                        ),
                                                        topRight: Radius
                                                            .circular(
                                                          30,
                                                        ),
                                                        bottomRight:
                                                        Radius
                                                            .circular(
                                                          30,
                                                        )),
                                                    color: Color(
                                                        0xfff1f4fe)),
                                                child: Text(
                                                  commenttaskmodal
                                                      ?.data?[index]
                                                      .comment ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.sp,
                                                      fontFamily: "task",
                                                      fontWeight:
                                                      FontWeight
                                                          .normal),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 1.h),
                                                child: Text(
                                                    commenttaskmodal
                                                        ?.data?[index]
                                                        .commentTime ??
                                                        ""),
                                              ),
                                            ],
                                          ),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 7.h,
                              // margin: EdgeInsets.all(5),
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        _showemoji = !_showemoji;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.emoji_emotions_sharp,
                                      color: Color(0xff246bfb),
                                    ),
                                  ),
                                  Container(
                                    width: 56.w,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: _addcomm,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                      onTap: () {
                                        if (_showemoji) ;
                                        setState(() {
                                          _showemoji = false;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 1.3.h),
                                        hintText: "message",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 1.5.w,
                            ),
                            (isloading)
                                ? CircularProgressIndicator()
                                : Container(
                              height: 6.h,
                              width: 13.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff246bfb),
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    addcomment();
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 7.w,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        (_showemoji)
                            ? SizedBox(
                          height:
                          MediaQuery.of(context).size.height * .32,
                          child: EmojiPicker(
                            textEditingController: _addcomm,
                            config: Config(
                              columns: 7,
                              // emojiSizeMax: 32 * (Platform.isIOS? 1.30 : 1.0),
                            ),
                          ),
                        )
                            : SizedBox(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
      ),
    );
  }

  commentapi() async {
    final Map<String, String> data = {};
    data['task_id'] = widget.taskid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().commenttaskapi(data).then((response) async {
          commenttaskmodal =
              CommentTaskModal.fromJson(json.decode(response.body));
          print(commenttaskmodal?.status);
          if (response.statusCode == 200 &&
              commenttaskmodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));

            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
            buildErrorDialog(context, "", "data not available");
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

  addcomment() async {
    final Map<String, String> data = {};
    data['task_id'] = widget.taskid.toString();
    data['user_id'] = usermodal?.userData?.uid ?? "";
    data['comments'] = _addcomm.text.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addcommentapi(data).then((response) async {
          addcommentmodal =
              AddCommentModal.fromJson(json.decode(response.body));
          print(commenttaskmodal?.status);
          if (response.statusCode == 200 &&
              addcommentmodal?.status == "success") {
            commentapi();
            _addcomm.clear();

            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
            buildErrorDialog(context, "", "Please type the message");
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
