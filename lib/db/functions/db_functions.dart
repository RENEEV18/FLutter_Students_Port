import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';


import '../model/data_model.dart';

//ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

class StudentDb with ChangeNotifier{

 
   static List<StudentModel> studentList = [];

  Future<void> addStudent(StudentModel value, context) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.put(value.id,value);
    studentList.add(value);
    log('student added');
    getAllStudents(context);
  }

 static Future< List<StudentModel>> getAllStudents(BuildContext context) async {
  
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentList.clear();
    studentList.addAll(studentDB.values);
    log(studentList.toString());
    return studentList;
  }

static  Future<void> deleteStudent(context, String index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.delete(index);
    getAllStudents(context);
  }

   Future<void> updateStudent(context,index,data)async{
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.putAt(index, data);
     getAllStudents(context);
  }
}
