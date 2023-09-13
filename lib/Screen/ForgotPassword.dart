import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ForgotPasswordModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/LoginPage.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';


import '../Widget/sharedpreferance.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
TextEditingController _email = TextEditingController();
final _formKey = GlobalKey<FormState>();


class _ForgotPasswordState extends State<ForgotPassword> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _email.clear();
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Image.asset(
                    "img/forgot.jpg"),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,fontFamily: "task"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.alternate_email_rounded,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 80.w,
                        child: TextFormField(
                          validator: (val)
                          {
                            if(val!.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val);
                              if(!emailValid)
                              {
                                return "Invalid Email";
                              }
                            }
                            return null;
                          },
                          controller: _email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.6),fontFamily: "task",fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  width: 85.w,
                  height: 5.h,
                  child: ElevatedButton(
                    onPressed: () async{

                      forgotpassapi();
                      // await SaveDataLocal.clearUserData();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Color(0xff0165FF)),
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white, fontSize: 19.sp,fontFamily: "task"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  forgotpassapi(){
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Sending Email...');
      final Map<String, String> data = {};
      data['forgotEmail'] = _email.text.toString();
      print(data);
      checkInternet().then((internet) async {
        print(internet);
        if (internet) {
          authprovider().forgotapi(data).then(( response) async {
            forgotpasswordmodal = ForgotPasswordModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && forgotpasswordmodal?.status == "success") {

              _email.clear();
              print(forgotpasswordmodal?.status);

              EasyLoading.showSuccess(' Please Check Your Email For Reset Password.!');
              Timer(Duration(seconds: 2), () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
              });



              // showDialog(
              //   context: context,
              //   builder: (ctx) =>
              //       AlertDialog(
              //         content:  Text(
              //           "Please Check Your Email For Reset Password.",
              //           style: TextStyle(fontSize:23,fontWeight:FontWeight.bold,fontFamily: "task",
              //           ),),
              //         actions:[
              //           ElevatedButton(
              //             onPressed: () {
              //               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
              //             },
              //             style: ElevatedButton.styleFrom(
              //                 shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(10.0)),
              //                 primary: Color(0xff0165FF)),
              //             child: Text("OK",style: TextStyle
              //               (color: Colors.white, fontSize: 18,fontFamily: "task")),
              //           ),
              //         ],
              //       ),
              // );


              setState(() {
                // isLoading = false;
              });
            } else {
              EasyLoading.showError("Email Not Registered!!");


              // alert();
            }
          });
        } else {
          setState(() {

            // isLoading = false;
          });
          buildErrorDialog(context, '', "Internet Required");
        }
      });
    }
  }
  // alert() {
  //   AlertDialog alert = new  AlertDialog(
  //     content:  Text(
  //       "Email Not Registered",
  //       style: TextStyle(fontSize:23,fontWeight:FontWeight.bold,fontFamily: "task",
  //       ),),
  //     actions:[
  //       ElevatedButton(
  //         onPressed: () {
  //           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
  //           Navigator.pop(context);
  //         },
  //         style: ElevatedButton.styleFrom(
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10.0)),
  //             primary: Color(0xff0165FF)),
  //         child: Text("OK",style: TextStyle
  //           (color: Colors.white, fontSize: 18,fontFamily: "task")),
  //       ),
  //     ],
  //   );
  //
  //   showDialog(
  //       context: context,
  //       builder: (context) `{
  //         return alert;
  //       });
  // }
}
