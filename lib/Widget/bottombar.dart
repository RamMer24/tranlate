import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tranlate/Screen/ChatListPage.dart';
import 'package:tranlate/Screen/InvoiceList.dart';
import 'package:tranlate/Screen/TaskList.dart';
import 'package:tranlate/Widget/sharedpreferance.dart';


import '../Screen/LoginPage.dart';

class bottombar extends StatefulWidget {
  int? selected;
   bottombar({super.key , this.selected});

  @override
  State<bottombar> createState() => _bottombarState();
}
class Sachen {
  Icon? image;
  String? name;
  Sachen( this.name);
}
List<Sachen> data = [
  Sachen ("Task "),
  Sachen( "Invoice"),
  Sachen( "Chat"),
  Sachen( "Profile"),
];
List<IconData> icns = [Icons.task_rounded,Icons.insert_page_break_outlined,Icons.chat,Icons.logout];
int selectindex1 = 1;



class _bottombarState extends State<bottombar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 6.w, right: 6.w,top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: (){setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TaskList()));
            selected = 1;
          });},
            child: Column(
              children: [
                Icon(Icons.task_rounded,size: 27.sp,
                    color: selected == 1
                        ? Color(0xff0165FF)
                        : Colors.black54,
                  ),
                Text("Task",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: "task",
                      color: selected == 1
                          ? Color(0xff0165FF)
                          :  Colors.black54,

                    ),
                ),
              ],
            ),
          ),
          GestureDetector(onTap: (){setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InvoiceList()));
            selected = 2;
          });},
            child: Column(
              children: [
                Icon(Icons.insert_page_break_outlined,size: 27.sp
                  ,
                  color: selected == 2
                      ? Color(0xff0165FF)
                      :  Colors.black54,),
                Text("Invoice",
                  style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: "task",
                  color: selected == 2
                      ? Color(0xff0165FF)
                      :  Colors.black54,

                ),),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatListPage()));
              selected = 3;
            });},
            child: Column(
              children: [
                Icon(Icons.chat,size: 27.sp
                  ,
                  color: selected == 3
                      ? Color(0xff0165FF)
                      : Colors.black54,),
                Text("Chat",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: "task",
                      color: selected == 3
                          ? Color(0xff0165FF)
                          :  Colors.black54,
                    )
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await SaveDataLocal.clearUserData();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            },
            child: Column(
              children: [
                Icon(Icons.logout,size: 27.sp
                  ,
                  color: Colors.red,),
                Text("Logout",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: "task",
                      color:   Colors.red,

                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
