import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

Future <void> addStudent(StudentModel value) async{
  

 final studentDB =  await Hive.openBox<StudentModel>('student_db');
 final id = await studentDB.add(value);
 value.id = id;
studentlistNotifier.value.add(value);
 studentlistNotifier.notifyListeners();
  
}

Future<void> getAllStudents() async{
  final studentDB =  await Hive.openBox<StudentModel>('student_db');
  studentlistNotifier.value.clear();
  studentlistNotifier.value.addAll(studentDB.values);
  studentlistNotifier.notifyListeners();
}

Future<void> deleteStudent(int index) async{

  final studentDB =  await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(index);
  getAllStudents();
  
}
