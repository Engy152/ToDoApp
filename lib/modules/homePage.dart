// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:to_do_app/cubit/cubit.dart';
// import 'package:to_do_app/modules/addTasks/AddTaskScreen.dart';
// import 'package:to_do_app/shared/constance.dart';
// import 'package:to_do_app/shared/simpleMethod.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = TasksCubit.get(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           DateFormat.yMMMd().format(DateTime.now()),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//                 'Today',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0,),
//             Container(
//               child: DatePicker(
//
//                 DateTime.now(),
//                 height: 100,
//                 width: 80,
//                 initialSelectedDate: DateTime.now(),
//                 selectionColor: colotDate,
//
//                 dayTextStyle: TextStyle(
//                   color: Colors.grey
//                 ),
//                 monthTextStyle: TextStyle(
//                     color: Colors.grey
//                 ),
//                 dateTextStyle: TextStyle(
//
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey,
//
//                 ),
//
//               ),
//             ),
//             SizedBox(height: 15,),
//             Center(
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/Checklist-rafiki 1.png'),
//                   Text(
//                     'What do you want to do today?',
//                     style: TextStyle(
//
//                       fontSize: 21,
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Text('Tap + to add your tasks',textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 17,
//                     ),),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//
//         //shape: ShapeBorder(),
//         backgroundColor: colorButtom,
//         child: Icon(Icons.add,size: 30,),
//         onPressed: ()
//         {
//           // cubit.addTask(
//           //     title: 'Engy',
//           //     note: "Magdy",
//           //     startTime: 'kk', endTime: ',kk,', );
//           navigateTo(context, AddTaskScreen());
//         },
//       ),
//     );
//   }
// }
