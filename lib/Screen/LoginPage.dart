import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Screen/ForgotPassword.dart';
import 'package:tranlate/Screen/MainPage.dart';

import '../Modals/LoginModal.dart';
import '../Provider/authprovider.dart';
import '../Widget/buildErrorDialog.dart';
import '../Widget/const.dart';
import '../Widget/sharedpreferance.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool secure = false;
  bool visible = false;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visible = true;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset("img/login.jpg",height: 40.h,),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,fontFamily: "task"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
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
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value!.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
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
                  height: 2.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 80.w,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter The Password";
                            }
                            return null;
                          },
                          obscureText:visible,
                          controller: _password,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                  print(visible);

                                });
                              },
                              icon: visible
                                  ? Icon(
                                Icons.visibility,
                                size: 15.sp,
                                color: Colors.black,
                              )
                                  : Icon(
                                Icons.visibility_off,
                                size: 15.sp,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Password',
                            hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.6),fontFamily: "task",fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                        } ,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color:Color(0xff0165FF),
                              fontWeight: FontWeight.bold,
                              fontFamily: "task",

                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: 88.w,
                  height: 5.h,
                  child: ElevatedButton(
                    onPressed: loginap,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary:  Color(0xff0165FF)),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 19.sp,fontFamily: "task"),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 3.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "New Member ?",
                //       style: TextStyle(color: Colors.black, fontSize: 19,fontFamily: "task"),
                //     ),
                //     TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           "Register",
                //           style: TextStyle(
                //               color:Color(0xff0165FF),
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18,
                //               letterSpacing: 1,
                //           fontFamily: "task"),)),
                //   ],
                // ),
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
  loginap()async{
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['email'] = _email.text.trim().toString();
      data['password'] = _password.text.trim().toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then(( response) async {
            usermodal = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && usermodal?.status == "success") {

     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MainPage()));
              SaveDataLocal.saveLogInData(usermodal!);

              setState(() {
                // isLoading = false;
              });
            }
            else {
              buildErrorDialog(context, '', "Email Or Password Is Wrong");
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
  //       "Email Or Password Is Wrong",
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
  //       builder: (context) {
  //         return alert;
  //       });
  // }
}
