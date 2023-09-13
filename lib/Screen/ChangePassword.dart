import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Modals/ChangepasswordModal.dart';
import 'package:tranlate/Provider/authprovider.dart';
import 'package:tranlate/Screen/LoginPage.dart';
import 'package:tranlate/Widget/buildErrorDialog.dart';
import 'package:tranlate/Widget/const.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

TextEditingController _oldpassword = TextEditingController();
TextEditingController _newpassword = TextEditingController();
TextEditingController _confirmpassword = TextEditingController();

bool secure = false;
bool visible = false;
bool visible1 = false;
bool visible2 = false;
final _formKey = GlobalKey<FormState>();

class _ChangePasswordState extends State<ChangePassword> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(usermodal?.userData?.uid);
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          _confirmpassword.clear();
                          _newpassword.clear();
                          _oldpassword.clear();
                        });
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Image.asset(
                "img/changepasswoord.jpg",
                height: 40.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: 90.w,
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_reset_rounded,
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
                            return "Please Enter The Old Password";
                          }
                          return null;
                        },
                        obscureText: visible,
                        controller: _oldpassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                                print(visible);
                                print('Ouch');
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
                          hintText: 'Old Password',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "task",
                              fontSize: 18),
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
                      Icons.password,
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
                            return "Please Enter The New Password";
                          }
                          return null;
                        },
                        obscureText: visible1,
                        controller: _newpassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible1 = !visible1;
                                print(visible1);
                                print('Ouch');
                              });
                            },
                            icon: visible1
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
                          hintText: 'New Password',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "task",
                              fontSize: 18),
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
                            return "Please Enter The Confirm Password";
                          }
                          return null;
                        },
                        obscureText: visible2,
                        controller: _confirmpassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible2 = !visible2;
                                print(visible);
                                print('Ouch');
                              });
                            },
                            icon: visible2
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
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: "task",
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                width: 88.w,
                height: 5.h,
                child: ElevatedButton(
                  onPressed: () {
                    forgotpass();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Color(0xff0165FF)),
                  child: Text(
                    "Change password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.sp,
                        fontFamily: "task"),
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
    );
  }

  forgotpass() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['id'] = usermodal?.userData?.uid ?? "";
      data['current_password'] = _oldpassword.text.trim().toString();
      data['new_password'] = _newpassword.text.trim().toString();
      data['confirm_password'] = _confirmpassword.text.trim().toString();

      print(data);
      checkInternet().then((internet) async {
        print(internet);
        if (internet) {
          authprovider().ChangePassword(data).then((response) async {
            print(changeModal?.status);
            changeModal =
                ChangepasswordModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                changeModal?.status == "success") {
              _oldpassword.clear();
              _newpassword.clear();
              _confirmpassword.clear();

              update(context, '', 'Password Changed Successfully',
                  callback: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              });

              setState(() {
                isLoading = false;
              });
            } else {
              _newpassword.text == _confirmpassword.text
                  ? buildErrorDialog(context, '', "Old Password is Invalid")
                  : buildErrorDialog(
                      context, '', "Password And Confirmpassword does Not Match");
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
}
