import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/busineslogic/cubit.dart';
import 'package:newsapp/network/dio.dart';
import 'package:newsapp/view/characters.dart';
import 'package:newsapp/view/splashscreen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
        BlocProvider(create: (context)=>NewsCubit()..getnews())
        ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

