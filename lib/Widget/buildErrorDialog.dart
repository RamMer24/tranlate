import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

buildErrorDialog(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: Color(0xffb4776e6)
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xffb4776e6),
                decorationColor: Colors.black,
               fontFamily: 'task',)),
      ),
    ),
    onTap: () {
      // if (callback == null) {
      Navigator.pop(context);
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
      // } else {

      // }
    },
  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            // height: (title == "") ? 15.5.h : 23.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 71.w,
            // height: (title == "") ? 15.5.h : 17.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}

update(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname,}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: Color(0xffb4776e6)
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xffb4776e6),
                decorationColor: Colors.black,
               fontFamily: 'task',)),
      ),
    ),
    onTap: callback,
  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,
            height: (title == "") ? 15.5.h : 24.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ?Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.black45,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 70.w,
            // height: (title == "") ? 15.5.h : 25.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 1.h),
                okButton,
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}

gameexit(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname,VoidCallback? callback1, String? buttonname1}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width*0.30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: Color(0xffb4776e6)
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xffb4776e6),
                decorationColor: Colors.black,
               fontFamily: 'task',)),
      ),
    ),
    onTap: callback,
  );
  Widget noButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width*0.30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: Color(0xffb4776e6)
      ),
      child: Center(
        child: Text(buttonname1 ?? 'No',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xffb4776e6),
                decorationColor: Colors.black,
               fontFamily: 'task',)),
      ),
    ),
    onTap: (){Navigator.pop(context);},
  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 70.w,
            height: (title == "") ? 15.5.h : 22.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 1.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    okButton,Container(height: 3.5.h,width: 0.3.w,color: Colors.black54,),noButton,
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}
alreadyadddialog(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname,VoidCallback? callback1, String? buttonname1}) {
  Widget okButton = GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width*0.30,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        // color: Color(0xffb4776e6)
      ),
      child: Center(
        child: Text(buttonname ?? 'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xffb4776e6),
                decorationColor: Colors.black,
               fontFamily: 'task',)),
      ),
    ),
    onTap: (){Navigator.pop(context);},
  );

  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 73.w,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'task',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 70.w,
            height: (title == "") ? 15.5.h : 24.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                (title != "")
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: Colors.black,
                                 fontFamily: 'task',),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      Text(
                        contant,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decorationColor: Colors.black,
                           fontFamily: 'Poppins',),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(
                  height: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(height: 2.h),
                okButton,
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
    //   title: Text(title,
    //       style: TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   content: Text(contant,
    //       style: const TextStyle(
    //           color: Colors.black,
    //           decorationColor: Colors.black,
    //           fontFamily: 'poppins')),
    //   actions: [
    //     okButton,
    //   ],
    // );
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return cupertinoAlertDialog;
    //   },
    // );
  }
  // show the dialog
}
