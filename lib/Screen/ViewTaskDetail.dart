// import 'package:flutter/material.dart';
//
// import 'package:sizer/sizer.dart';
// import 'package:translationapp/dropdown.dart';
//
// class ViewTaskDetail extends StatefulWidget {
//
//   @override
//   State<ViewTaskDetail> createState() => _ViewTaskDetailState();
// }
//
// List<String> items = ['Completed', ' Pending', 'In Progress'];
// String? selectedItem;
//
// class _ViewTaskDetailState extends State<ViewTaskDetail> {
//   bool _isexpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(children: [
//           SizedBox(
//             height: 3.h,
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//             ),
//             title: Center(
//                 child: Text(
//               " View Task List",
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "task"),
//             )),
//             trailing: Icon(
//               Icons.menu,
//               size: 25,
//             ),
//           ),
//
//           SizedBox(
//             height: 2.h,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding:  EdgeInsets.only(left: 1.5.w),
//                           child: Text(
//                             "Task Title",
//                             style: TextStyle(
//                                 fontSize: 21.sp,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: "task",
//                                 letterSpacing: 1,
//                                 color: Colors.black
//                             ),
//                           ),
//                         ),
//
//                         Container(
//                           padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                               color: Color(0xffc2e7ff),
//                             border: Border.all(width: 1,color: Colors.grey)
//                           ),
//                           child: Text("Flutter is the best way in mobile application"
//                               "its features that make the country incredible",
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "task",
//                                 color: Colors.black),),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 1.w,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                     children: [
//                       Text(
//                         "Task Time",
//                         style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: "task",
//                             letterSpacing: 1,
//                             color: Colors.black),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
//                         width: 42.w,
//                         height: 6.h
//                         ,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white,
//                             border: Border.all(width: 1,color: Colors.grey)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(Icons.timer_outlined,color: Color(0xff0165FF),),
//                             SizedBox(
//                               width: 1.w,
//                             ),
//                             Text(
//                               "12:05 pm",
//                               style: TextStyle(
//                                   fontSize: 17.sp,
//                                   fontWeight: FontWeight.w500,
//                                   fontFamily: "task",
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                    SizedBox(
//                      width: 4.w,
//                    ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding:  EdgeInsets.only(left: 0.5.h),
//                         child: Text(
//                           "Task Status",
//                           style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: "task",
//                               letterSpacing: 1,
//                               color: Colors.black),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 1.3.h),
//                         width: 42.w,
//                         height: 6.h,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.white,
//                             border: Border.all(width: 1,color: Colors.grey)
//                         ),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//
//                             children: [
//                               Text("complete",style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 21.sp,
//                                   fontWeight: FontWeight.normal,
//                                   fontFamily: "task")),
//                               SizedBox(
//                                 width: 1.w,
//                               ),
//                               Icon(Icons.check_circle,color: Colors.green,size: 17,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//
//               SizedBox(
//                 height: 2.h,
//               ),
//               Padding(
//                 padding:  EdgeInsets.only(left: 1.h),
//                 child: Row(
//                   children: [
//                     Text(
//                       "About Task",
//                       style: TextStyle(
//                           fontSize: 21.sp,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: "task",
//                           letterSpacing: 1,
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.h),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     border: Border.all(width: 1,color: Colors.grey)
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "India is a rich, diverse land of various cultures, "
//                             "languages, religions, food, etc. As"
//                             "citizens of India, everyone must have "
//                             "learnt about the history of India and all"
//                             "its features that make the country incredible.",
//                             style: TextStyle(
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: "task",
//                                 color: Colors.black),
//                             maxLines: _isexpanded ? null : 2,
//                             overflow: _isexpanded
//                                 ? TextOverflow.visible
//                                 : TextOverflow.ellipsis,
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 255,bottom: 15),
//                             child: InkWell(
//                               focusColor: Colors.black,
//                               onTap: () {
//                                 setState(() {
//                                   _isexpanded = !_isexpanded;
//                                 });
//                               },
//                               child: Container(
//                                   child: _isexpanded
//                                       ?  Text(
//                                           "Read Less",
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                         )
//                                       :  Text("Read More...",
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold))),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 1.w,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Container(
//                 width: 89.w,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 22.w,
//                       height: 10.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: NetworkImage(
//                                 "https://cdn.pixabay.com/photo/2018/03/20/05/41/time-3242249_640.jpg"),
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 3.5.w,
//                     ),
//                     SizedBox(
//                       width: 60.w,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Padding(
//                             padding:  EdgeInsets.only(left: 1.h,),
//                             child: Text(
//                               "Ram Amar",
//                               style: TextStyle(
//                                   fontSize: 33,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "task"),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 1.3.h),
//                             width: 90.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.white,
//                                 border: Border.all(width: 1,color: Colors.grey)
//                             ),
//                             child: Text(
//                               "rammer6424@gmail.com",
//                               style: TextStyle(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.normal,
//                                   fontFamily: "task"),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 70.w,
//                     height: 5.h,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0)),
//                           primary: Color(0xff0165FF)),
//                       child: Text(
//                         " View Invoice",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 3.h,
//               ),
//             ],
//           ),
//         ]),
//       ),
//     ));
//   }
// }
