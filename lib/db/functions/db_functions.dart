import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/data_model.dart';

//ValueNotifier<List<StudentModel>> studentlistNotifier = ValueNotifier([]);

class StudentDb with ChangeNotifier {
  static List<StudentModel> studentList = [];

  Future<void> createDatabase() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
      Hive.registerAdapter(
        StudentModelAdapter(),
      );
    }
    notifyListeners();
  }

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.put(value.id, value);
    studentList.add(value);
    log('student added');
    getAllStudents();
  }

  static Future<List<StudentModel>> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentList.clear();
    studentList.addAll(studentDB.values);
    log(studentList.toString());
    return studentList;
  }

  static Future<void> deleteStudent(context, String index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.delete(index);
    getAllStudents();
  }

  Future<void> updateStudent(int id, StudentModel value, context) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.putAt(id, value);
    getAllStudents();
  }
}
