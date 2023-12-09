import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubit/cubit.dart';
import 'package:to_do_app/cubit/states.dart';
import 'package:to_do_app/modules/TasksScreen/TasksScreen.dart';
import 'package:to_do_app/shared/constance.dart';
import 'package:to_do_app/shared/customButtom.dart';
import 'package:to_do_app/shared/customTextField.dart';
import 'package:to_do_app/shared/simpleMethod.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task',
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<TasksCubit,TaskStates>(
          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state)
          {
            var cubit = TasksCubit.get(context);
            return Padding(
              padding: EdgeInsets.only(left: 17.0,right: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  customTextField(
                      controller: cubit.TitleController,
                      hintText: 'Enter Title Here',
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      obscureText: false),
                  SizedBox(height: 30,),
                  Text(
                    'Note',
                    style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  customTextField(
                      controller: cubit.NoteController,
                      hintText: 'Enter Note Here',
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      obscureText: false),
                  SizedBox(height: 30,),
                  Text('Date',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  customTextField(
                    controller: cubit.DateController,
                    hintText: DateFormat.yMd().format(DateTime.now()).toString(),
                    suffixIcon: IconButton(
                        onPressed: ()
                        {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          ).then((value)
                          {
                            cubit.DateController.text = DateFormat.yMd().format(value!).toString();
                           // cubit.DateController.text = value.toString();

                          });
                        },
                        icon: Icon(Icons.calendar_month,)),
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    obscureText: false,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Start Time',style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            customTextField(
                                controller: cubit.StartTimeController,
                                hintText: DateFormat('hh:mm a').format(DateTime.now()).toString(),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.access_alarm_outlined,),
                                  onPressed:
                                      ()
                                  {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(hour: 1, minute: 00,)
                                    ).then((value)
                                    {
                                      cubit.StartTimeController.text = value!.format(context);
                                    });
                                  },
                                ),
                                type: TextInputType.text,
                                action: TextInputAction.next,
                                obscureText: false),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      SizedBox(width: 25,),
                      Expanded(
                        child: Column(
                          children: [
                            Text('End Time',style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            customTextField(
                                controller: cubit.EndTimeController,
                                hintText: DateFormat('hh:mm a').format(DateTime.now()).toString(),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.access_alarm_outlined,),
                                  onPressed:
                                      ()
                                  {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(hour: 1, minute: 00,)
                                    ).then((value)
                                    {
                                      cubit.EndTimeController.text = value!.format(context);
                                    });
                                  },
                                ),
                                type: TextInputType.text,
                                action: TextInputAction.done,
                                obscureText: false),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],),
                  SizedBox(height: 10.0,),
                  Text('color',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 10,),
                  Wrap(
                    children: List<Widget>.generate(5, (index)
                    {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: ()
                          {
                            cubit.colorTask(index);
                          },
                          child: CircleAvatar(
                            child:cubit.selectColor==index?Icon(Icons.done,size: 25,):Container(),
                            radius: 20,
                            backgroundColor: cubit.getColorForIndex(index),
                          ),
                        ),
                      );

                    }
                    ),
                  ),
                  SizedBox(height: 50,),
                  Center(
                    child: customButtom(
                      text: 'CREATE TASK',
                      function: ()
                      {
                        cubit.addTask(
                            title: cubit.TitleController.text ,
                            note: cubit.NoteController.text,
                            startTime:cubit.StartTimeController.text ,
                            endTime: cubit.EndTimeController.text,
                          color: cubit.selectColor, isCompleted: true,
                          date: cubit.DateController.text,
                        );
                        navigateTo(context, TasksScreen());
                      },
                      width: 250, color_buttom: colorButtom,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
