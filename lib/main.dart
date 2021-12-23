import 'package:class_manadement/data/model/classroom_model.dart';
import 'package:class_manadement/presentation/screens/classroom_db_screen/classroom_db_screen.dart';
import 'package:class_manadement/presentation/screens/dashbord_screen/dashbord_screen.dart';
import 'package:class_manadement/presentation/screens/databse_screen/database_screen.dart';
import 'package:class_manadement/presentation/screens/student_db_screen/student_db_screen.dart';
import 'package:class_manadement/presentation/screens/subject_db_screen/subject_db_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  
        primarySwatch: Colors.blue,
      ),
     initialRoute: '/',
     routes: {
       '/': (context) => const DashbordScreen(),
       '/db': (context)=> const DataBaseScreen(),
       '/studentdb': (context)=>  StudentDbScreen(),
       '/subjectdb': (context)=> const SubjectDbScreen(),
       '/classroomdb': (context)=>const ClassroomDbScreen()
     },
    );
  }
}

