import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/cubit.dart';
import 'package:to_do_app/cubit/states.dart';
import 'package:to_do_app/modules/TasksScreen/Widget/CustomShowTask.dart';
import 'package:to_do_app/modules/TasksScreen/Widget/customFilterData.dart';
import 'package:to_do_app/modules/addTasks/AddTaskScreen.dart';
import 'package:to_do_app/shared/constance.dart';
import 'package:to_do_app/shared/simpleMethod.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('ttttttttt${TasksCubit.get(context).selectDate}');

    return BlocConsumer<TasksCubit,TaskStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var cubit = TasksCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              DateFormat.yMMMd().format(DateTime.now()),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  child: DatePicker(
                    DateTime.now(),
                    height: 100,
                    width: 80,

                    initialSelectedDate: cubit.selectDate,
                    selectionColor: colotDate,
                    dayTextStyle: TextStyle(
                        color: Colors.grey
                    ),
                    monthTextStyle: TextStyle(
                        color: Colors.grey
                    ),
                    dateTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,

                    ),
                    //
                    onDateChange: (date)
                    {
                     // cubit.chamdeDatePicker(date);
                      cubit.selectDate = date;
                      TasksCubit.get(context).filterDate(date);
                      print('0000000000000');
                      print(cubit.selectDate);
                     // cubit.getTask();

                    },
                  ),
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: ListView.builder(

                    itemBuilder: (contex,index)
                    {
                      print('wwwwwwwwww${cubit.selectDate}');
                      return cubit.selectDate == null?CustomShowTask(index:index):CustomShowTaskFilter(index: index);
                    },
                    itemCount: cubit.selectDate == null?cubit.taskData.length:cubit.filteredTasks.length,
                  ),
                ),


              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            //shape: ShapeBorder(),
            backgroundColor: colorButtom,
            child: Icon(Icons.add,size: 30,),
            onPressed: ()
            {
              // cubit.addTask(
              //     title: 'Engy',
              //     note: "Magdy",
              //     startTime: 'kk', endTime: ',kk,', );
              cubit.TitleController.clear();
              cubit.NoteController.clear();
              cubit.DateController.clear();
              cubit.StartTimeController.clear();
              cubit.EndTimeController.clear();
              navigateTo(context, AddTaskScreen());
            },
          ),
        );
      },
    );
  }
}