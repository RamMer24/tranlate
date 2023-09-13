import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

Widget spinKit = Container(
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.elliptical(15.0, 15.0)),
    gradient: LinearGradient(
      begin: Alignment(-1.0, 1.0),
      end: Alignment(1.0, -1.0),
      colors: <Color>[
        Colors.grey,
        Colors.grey,
      ],
    ),
    // color: buttonColor,
  ),
  width: 90.0,
  height: 90.0,
  child: const SpinKitChasingDots(
    color: Colors.white,
    size: 40.0,
  ),
);
Widget commanScreen({required Scaffold scaffold, required bool isLoading}) {
  return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: spinKit,
        child: scaffold,
        color: Colors.transparent,
      ));
}
