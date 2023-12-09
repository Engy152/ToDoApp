
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/cubit.dart';
import 'package:to_do_app/cubit/states.dart';
import 'package:to_do_app/shared/constance.dart';
import 'package:to_do_app/shared/customButtom.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit,TaskStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var cubit = TasksCubit.get(context);
        return Container(
          color: Color(0xFF424242),
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                customButtom(
                  text: 'TASK COMPLETE',
                  function: ()
                  {
                   // cubit.taskData[index]['isCompleted'];
                    cubit.taskComplete(index);
                    Navigator.pop(context);
                  },
                  width: 300.0, color_buttom: colorButtom,),
                const SizedBox(height: 20,),
                customButtom(
                  text: 'DELETE TASK',
                  function: ()
                  {
                    cubit.deleteTask(taskKey:cubit.taskData[index]['key'], date: cubit.taskData[index]['date'] );
                    Navigator.pop(context);
                  },
                  width: 300.0,
                  color_buttom: Color(0xFFE57373),),
                const SizedBox(height: 20,),
                customButtom(
                  text: 'CANCEL',
                  function: () {
                    Navigator.pop (context);
                  },
                  width: 300.0, color_buttom: colorButtom,)
              ],
            ),
          ),
        );
      },

    );
  }
}
