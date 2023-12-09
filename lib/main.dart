import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/cubit/cubit.dart';
import 'package:to_do_app/model/TasksModel.dart';
import 'package:to_do_app/modules/splash_screen.dart';
import 'package:to_do_app/shared/bloc_obsercer.dart';
import 'package:to_do_app/shared/constance.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(taskBox);
  Hive.registerAdapter(TasksModelAdapter());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TasksCubit()..getTask(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(

        ),
        home: SplashScreen(),
      ),
    );
  }
}
