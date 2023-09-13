import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/ChangePassword.dart';
import 'package:tranlate/Screen/ChatListPage.dart';
import 'package:tranlate/Screen/InvoiceList.dart';
import 'package:tranlate/Screen/LoginPage.dart';
import 'package:tranlate/Screen/MainPage.dart';
import 'package:tranlate/Screen/TaskList.dart';
import 'package:tranlate/Screen/profilepage.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/sharedpreferance.dart';

import '../Modals/ViewProfileModal.dart';


class drawer1 extends StatefulWidget {
  const drawer1({Key? key}) : super(key: key);

  @override
  State<drawer1> createState() => _drawer1State();
}

bool isloading = false;

class _drawer1State extends State<drawer1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('open');
  }

  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.85;
    return Drawer(
      child: isloading
          ? Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading... ',
                    style: TextStyle(fontFamily: 'task', fontSize: 15.sp),
                  ),
                  SizedBox(height: 4.h),
                ],
              )),
            )
          : Container(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: widthDrawer,
                color: Colors.white,
                child: ListView(

                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 14.h,
                        padding: EdgeInsets.all(1.w),
                        width: widthDrawer,
                        // color: Colors.black.withOpacity(0.3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 8.5.h,
                              width: 19.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: viewProfileModal
                                          ?.clientData?.profileImg ??
                                      '',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/user.png',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            // CircleAvatar(
                            //     radius: 9.w,
                            //     backgroundImage: NetworkImage(
                            //         "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  viewProfileModal?.clientData?.userName ==
                                              '' ||
                                          viewProfileModal
                                                  ?.clientData?.userName ==
                                              null
                                      ? 'N/A'
                                      : viewProfileModal
                                              ?.clientData?.userName ??
                                          '',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      letterSpacing: 0.5,
                                      fontFamily: 'task',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                SizedBox(
                                  width: 42.w,
                                  child: Text(
                                      viewProfileModal?.clientData?.email ==
                                                  '' ||
                                              viewProfileModal
                                                      ?.clientData?.email ==
                                                  null
                                          ? 'N/A'
                                          : viewProfileModal
                                                  ?.clientData?.email ??
                                              '',
                                      maxLines: 2,
                                      style: TextStyle(
                                          // color: primary,
                                          fontFamily: 'task',
                                          fontSize: 15.sp,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.house,
                                            size: 22.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Home",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TaskList(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.task_rounded,
                                            size: 22.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Task ",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => profilepage(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.person_outline_rounded,
                                            size: 22.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Profile",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InvoiceList(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.insert_page_break_outlined,
                                            size: 22.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text('Invoice',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatListPage(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.chat_outlined,
                                            size: 22.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Chat",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangePassword(),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 64.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.lock_rotation_open,
                                            size: 25.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Change Password",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        InkWell(
                          onTap: () async {
                            await SaveDataLocal.clearUserData();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Container(
                                  width: 65.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.logout,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text("Logout",
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'task',
                                                color: Colors.red,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'task',
      fontWeight: FontWeight.w600);

  viewap() {
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
            print(viewProfileModal?.clientData?.mobile);
            print(viewProfileModal?.status);
            setState(() {
              isLoading = false;
            });
          }
          else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
