import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/cubit.dart';
import 'package:to_do_app/cubit/states.dart';
import 'package:to_do_app/model/TasksModel.dart';
import 'package:to_do_app/modules/TasksScreen/Widget/CustomButtomSheetWidget.dart';

class CustomShowTask extends StatelessWidget {
  const CustomShowTask({
    super.key,
    required this.index,
  });
 final int index;
  @override
  Widget build(BuildContext context,) {
    print('withot filter');

    return BlocConsumer<TasksCubit,TaskStates>(
      listener: (BuildContext context, TaskStates state) {  },
      builder: (BuildContext context, TaskStates state)
      {

        var cubit = TasksCubit.get(context);

        print(cubit.taskData[index]['date']);
       // print(cubit.selectDate.toString());
        //print(DateTime.parse(cubit.taskData[index]['date']));
        Color backGroundColor = cubit.getColorForIndex(index);
        String dateString = '12/21/2023';

        // تفكيك السلسلة لاستخراج القيم
        List<String> dateParts = dateString.split('/');
        int month = int.parse(dateParts[0]);
        int day = int.parse(dateParts[1]);
        int year = int.parse(dateParts[2]);

        // طباعة السنة والشهر واليوم
        print('Year: $year, Month: $month, Day: $day');
        return GestureDetector(
          onTap: ( )
          {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                  )
              ),
              context: context,
              builder: (context)
              {
                return CustomButtomSheet(index: index,);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: backGroundColor,
               // color: cubit.taskData[index][Color(cubit.selectColor)],
                //  color: Color(0xFFFF4666),
                  borderRadius: BorderRadius.circular(17)
              ),
              width: double.infinity,
              //height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(

                         // TasksModel.title?? 'kk',
                          cubit.taskData[index]['title'],
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Icon(Icons.access_alarm_outlined,),
                            SizedBox(width: 5,),
                            Text(cubit.taskData[index]['startTime'],style: TextStyle(fontSize: 15),),
                            Text(' - '),
                            Text(cubit.taskData[index]['endTime'],style: TextStyle(fontSize: 15),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(cubit.taskData[index]['note'],style: TextStyle(
                          fontSize: 25,
                        ),),
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 70,
                      width: 0.5,
                      color: Colors.grey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7,right: 10.0),
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          cubit.taskData[index]['isCompleted']==true? 'TODO' : 'COMPLETED',
                           // cubit.complete? 'COMPLETED':'TODO',
                          //'Tode',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}