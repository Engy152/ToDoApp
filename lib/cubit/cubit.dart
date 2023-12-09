

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/cubit/states.dart';
import 'package:to_do_app/model/TasksModel.dart';
import 'package:to_do_app/shared/constance.dart';

class TasksCubit extends Cubit<TaskStates> {
  TasksCubit() :super(AppInitialStates());
  static TasksCubit get(context) => BlocProvider.of(context);
  var TitleController = TextEditingController();
  var NoteController = TextEditingController();
  var DateController = TextEditingController();
  var StartTimeController = TextEditingController();
  var EndTimeController = TextEditingController();
  int selectColor = 0;
  //DateTime? initialSelectedDate = null;
  //bool isCompleted = false;
  DateTime? selectDate;

  void colorTask(index)
  {
    selectColor = index;
    emit(ColorTaskStates());
  }

  addNewTask(TasksModel task) async
   {
     emit(AddLoadingStates());
    try{
      var task_box = Hive.box<TasksModel>(taskBox);
      await task_box.add(task);
      emit(AddSuccessStates());
    } catch(e){
      emit(AddErrorStates(e.toString()));
    }
   }
  //////////////
  void taskComplete(index)
  {
    if( taskData[index]['isCompleted']==true)
    {
      print('nnnnnnnnnnn');
      taskData[index]['isCompleted']=false;
      print('eeeeeeeeeeeeeeeeeeee');
    }
    else
    {
      print('eeeeeeeeeeeeeeeeeeee');
      taskData[index]['isCompleted']=false;
    }
    emit(taskCompleteStates());
  }
 List<Map<String,dynamic>> taskData = [];
  final taskDef = Hive.box(taskBox);
  void addTask({
   required String title,
   required String note,
   required String startTime,
    required String endTime,
    required String date,
   required int color,
     required bool isCompleted ,



  }) async
  {
   await taskDef.add({
      'title': title,
      'note' : note,
      'startTime' : startTime,
      'endTime' : endTime,
      'date' : date,
      'color' : color,
      'isCompleted' : isCompleted,

    });
   getTask();
  }

  // void getTask()
  // {
  //   //ال e هيخزن فيها كل مره ال key اللي انا واقف عليها
  //   taskData= taskDef.keys.map((e) {
  //     // get map by key
  //     final currentTask = taskDef.get(e);
  //     DateTime taskDate = DateTime.parse(currentTask['date']);
  //
  //     return
  //       {
  //         'key': e,
  //         'title': currentTask['title'],
  //         'note': currentTask['note'],
  //         'date': currentTask['date'],
  //         'startTime': currentTask['startTime'],
  //         'endTime': currentTask['endTime'],
  //         'color': currentTask['color'],
  //         'isCompleted':currentTask['isCompleted'],
  //       };
  //   }).toList();
  //   emit(getTaskStates());
  //   print('task length is ${taskData.length}');
  // }



  void getTask()
  {
    selectDate=null;
    taskData= taskDef.keys.map((e) {
      // get map by key
      final currentTask = taskDef.get(e);
      //DateTime taskDate = DateTime.parse(currentTask['date']);
      return
        {
          'key': e,
          'title': currentTask['title'],
          'note': currentTask['note'],
          'date': currentTask['date'],
          'startTime': currentTask['startTime'],
          'endTime': currentTask['endTime'],
          'color': currentTask['color'],
          'isCompleted':currentTask['isCompleted'],
        };
    }).toList();
    emit(getTaskStates());
    print('task length is ${taskData.length}');
  }

  //

  // void getTask(String date) {
  //   List<Map<String, dynamic>> filteredTasks = [];
  //   taskDef.keys.forEach((e) {
  //     final currentTask = taskDef.get(e);
  //     //DateTime taskDate = DateTime.parse(currentTask['date']);
  //     List<String> dateParts = date.split('/');
  //     int month = int.parse(dateParts[0]);
  //     int day = int.parse(dateParts[1]);
  //     int year = int.parse(dateParts[2]);
  //     if (year == selectDate.year &&
  //         month == selectDate.month &&
  //         day == selectDate.day) {
  //       filteredTasks.add({
  //         'key': e,
  //         'title': currentTask['title'],
  //         'note': currentTask['note'],
  //         'date': currentTask['date'],
  //         'startTime': currentTask['startTime'],
  //         'endTime': currentTask['endTime'],
  //         'color': currentTask['color'],
  //         'isCompleted': currentTask['isCompleted'],
  //       });
  //     }
  //   });
  //   taskData = filteredTasks;
  //   emit(getTaskStates());
  //   print('task length is ${taskData.length}');
  // }

  void deleteTask({required int taskKey,required String date})async
  {
   await taskDef.delete(taskKey);
   getTask();
  }

  Color getColorForIndex(index) {
    switch (index) {
      case 0:
        return Color(0xFFFF4666);
      case 1:
        return Color(0xFF66CC41);
      case 2:
        return Color(0xFF41CCA7);
      case 3:
        return Color(0xFF4181CC);
      default:
        return Color(0xFFCC8441);
    }
  }


  List<Map<String, dynamic>> filteredTasks = [];
// void filterDate() {
//   filteredTasks = [];
//   filteredTasks = taskData.where((element) {
//     List<String> dateParts = element['data'].split("/");
//     int month = int.parse(dateParts[0]);
//     int day = int.parse(dateParts[1]);
//     int year = int.parse(dateParts[2]);
//     return
//       year == selectDate!.year && month == selectDate!.month &&
//           day == selectDate!.month;
//   }).toList();
// }
  void filterDate( DateTime t) {
    try{
      selectDate=t;
      filteredTasks = [];
      filteredTasks = taskData.where((element) {
        emit(LoadingStates());
        if (element['date'] != null) {
          List<String> dateParts = element['date'].split("/");
          if (dateParts.length == 3) {
            int month = int.tryParse(dateParts[0]) ?? 0;
            int day = int.tryParse(dateParts[1]) ?? 0;
            int year = int.tryParse(dateParts[2]) ?? 0;

            return year == selectDate!.year &&
                month == selectDate!.month &&
                day == selectDate!.day; // Corrected 'month' to 'day'
          }

        }
        return false;
      }).toList();
      emit(filterStates());
      print(filteredTasks.length);
    }catch(e)
    {
      print(e);
    }


  }

void chamdeDatePicker(DateTime w)
{
  selectDate = w;
  emit(selectedDateStates());
}

}
