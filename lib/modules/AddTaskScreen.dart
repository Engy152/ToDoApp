import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/shared/customButtom.dart';

import 'package:to_do_app/shared/customTextField.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var TitleController = TextEditingController();

  var NoteController = TextEditingController();

  var DateController = TextEditingController();

  var StartTimeController = TextEditingController();

  var EndTimeController = TextEditingController();

  int selectColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Task',style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0,right: 17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              customTextField(
                  controller: TitleController,
                  hintText: 'Enter Title Here',
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  obscureText: false),
              SizedBox(height: 30,),
              Text('Note',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              customTextField(
                  controller: NoteController,
                  hintText: 'Enter Note Here',
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  obscureText: false),

              SizedBox(height: 30,),
              Text('Date',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              customTextField(
                  controller: DateController,
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
                          DateController.text = value.toString();
                        });
                      },
                      icon: Icon(Icons.calendar_month,color: Colors.white,)),
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
                      Text('Start Time',style: TextStyle(color: Colors.white,fontSize: 20),),
                      SizedBox(height: 10,),
                      customTextField(
                          controller: StartTimeController,
                          hintText: DateFormat('hh:mm a').format(DateTime.now()).toString(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.access_alarm_outlined,color: Colors.white,),
                            onPressed:
                                ()
                            {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 1, minute: 00,)
                              ).then((value)
                              {
                                StartTimeController.text = value!.format(context);
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
                        Text('End Time',style: TextStyle(color: Colors.white,fontSize: 20),),
                        SizedBox(height: 10,),
                        customTextField(
                            controller: EndTimeController,
                            hintText: DateFormat('hh:mm a').format(DateTime.now()).toString(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.access_alarm_outlined,color: Colors.white,),
                              onPressed:
                                  ()
                              {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: 1, minute: 00,)
                                ).then((value)
                                {
                                  EndTimeController.text = value!.format(context);
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
              Text('color',style: TextStyle(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              Wrap(
                children: List<Widget>.generate(5, (index)
                {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: ()
                      {
                       setState(() {
                         selectColor = index;
                       });
                      },
                      child: CircleAvatar(
                        child:selectColor==index?Icon(Icons.done,color: Colors.white,size: 25,):Container(),
                        radius: 20,
                        backgroundColor:
                             index == 0?Color(0xFFFF4666)
                            :index == 1?Color(0xFF66CC41)
                            :index == 2?Color(0xFF41CCA7)
                            :index == 3?Color(0xFF4181CC)
                                 :Color(0xFFCC8441),


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
                  function: () {  },
                  width: 250,
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
