import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Screen/LoginPage.dart';
import 'package:tranlate/Screen/MainPage.dart';
import 'package:tranlate/Widget/const.dart';
import 'package:tranlate/Widget/sharedpreferance.dart';


class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    Timer(
       Duration(seconds: 5),
          () => (usermodal == null)
          ?Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),))
          :Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage(),))
    );
  }

  getdata() async {
    usermodal = await SaveDataLocal.getDataFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('img/login.json'),
            ),
            Column(
              children: [
                Container(
                  child: Lottie.asset('img/lo.json', height: 19.h),
                ),
                Text(
                  'Please Wait ...',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'task',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
