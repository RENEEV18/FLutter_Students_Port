import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String phonenumber;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String photo;

  StudentModel(
      {required this.photo,
      required this.name,
      required this.age,
      required this.phonenumber,
      required this.email,
      required this.id});
}
