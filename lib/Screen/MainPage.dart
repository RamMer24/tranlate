import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ViewProfileModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/ChatListPage.dart';
import 'package:tranlate/Screen/InvoiceList.dart';
import 'package:tranlate/Screen/TaskList.dart';
import 'package:tranlate/Screen/profilepage.dart';
import 'package:tranlate/Widget/bottombar.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/loader.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
bool isLoading = true;
class Sachen {
  String? image;
  String? name;

  Sachen(this.image, this.name);
}

List<Sachen> data = [
  Sachen("img/task.png", "Task "),
  Sachen("img/invoice.png", "Invoice"),
  Sachen("img/chat.png", "Chat"),
  Sachen("img/img_1.png", "Profile"),
];

int selectindex1 = 0;
class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
       viewap();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen( isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: bottombar(),
        body: WillPopScope(
          onWillPop: dialog,
          child: SingleChildScrollView(
            child: isLoading?Container(): Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Row(
                      children: [
                        Image.asset(
                          "img/logot.jpeg",
                          width: 17.w,
                        ),
                        Text(
                          " Welcome! ",
                          style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: "task"),
                        ),
                      ],
                    ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profilepage()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 7 .h,
                            width: 15.w,
                            padding: EdgeInsets.all(1.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: (viewProfileModal
                                    ?.clientData?.profileImg)
                                    .toString(),
                                progressIndicatorBuilder:
                                    (context, url, progress) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      'img/img_1.png',
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ),
                  ]),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  width: 100.w,
                  height: 75.h,
                  color: Color(0xffefefef),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InvoiceList()));
                            },
                            child: Container(
                                width: 45.w,
                                height: 28.h,
                                padding:
                                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: [
                                Image.asset("img/invoicelist.png",height: 17.h,width: 30.w,),
                                    Text(
                                      "Invoice",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 20.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatListPage()));
                            },
                            child: Container(
                                width: 45.w,
                                height: 28.h,
                                padding:
                                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset("img/chatpage.png",height: 17.h,width: 30.w,),

                                    Text(
                                      "Chat",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 20.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TaskList()));
                            },
                            child: Container(
                                width: 45.w,
                                height: 28.h,
                                padding:
                                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset("img/tasklist.png",height: 17.h,width: 30.w,),

                                    Text(
                                      "Task",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 20.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profilepage()));
                            },
                            child: Container(
                                width: 45.w,
                                height: 28.h,
                                padding:
                                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffffffff),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset("img/profilepage.png",height: 17.h,width: 30.w,   ),

                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 20.sp,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       onTap:(){
                      //         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      //       } ,
                      //       child: Text(
                      //         "Change Your Password?",
                      //         style: TextStyle(
                      //             color:Color(0xff0165FF),
                      //             fontWeight: FontWeight.bold,
                      //             fontFamily: "task",
                      //             fontSize: 20),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<bool> dialog() async {
    close();
    return false;
  }


  void close() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              '! Are You Sure? \n You Want to Quit !',
              style: TextStyle(fontSize: 18.sp),
            ),
            actions: [
              CupertinoButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'task',

                      color: Color(0xffff0000),
                    ),
                  ),
                  onPressed: (

                      ) {
                    exit(0);
                  }),
              CupertinoButton(
                  child: Text('No',style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'task',
                  ),),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  viewap(){
    final Map<String, String> data = {};
    data['id'] = (usermodal?.userData?.uid).toString();

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ViewProfile(data).then((response) async {
          viewProfileModal =
              ViewProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              viewProfileModal?.status == "success") {

            setState(() {
              isLoading = false;
            });
          } else {
            isLoading = false;
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
