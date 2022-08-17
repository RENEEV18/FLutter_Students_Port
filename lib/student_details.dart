import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:student_port/db/functions/db_functions.dart';
import 'package:student_port/db/model/data_model.dart';

import 'package:student_port/studentportal.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  XFile? image;

  final studentName = TextEditingController();
  final age = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 18, 54),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Container(
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 178, 202, 221),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 280),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP7NjSjKYoQFApBGgMXfrAioIDBfleCIZWyA&usqp=CAU'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -2,
                          child: RawMaterialButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              final img = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                image = img;
                              });
                            },
                            elevation: 10,
                            fillColor: Colors.white,
                            shape: const CircleBorder(),
                            child: const Icon(Icons.camera_alt_outlined),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: studentName,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                hintText: 'Student Name',
                                prefixIcon: const Icon(Icons.person),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: TextFormField(
                            controller: age,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                hintText: 'Age',
                                prefixIcon:
                                    const Icon(Icons.calendar_view_day_rounded),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: TextFormField(
                            controller: phoneNumber,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                hintText: 'Phone Number',
                                prefixIcon: const Icon(Icons.phone),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                          ),
                          child: TextFormField(
                            controller: email,
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: const Icon(Icons.email_rounded),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            studentSaveClicked();
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return const StudentPortal();
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 7, 55, 109),
                            elevation: 20,
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> studentSaveClicked() async {
    final displayName = studentName.text.trim();
    final displayAge = age.text.trim();
    final displayNumber = phoneNumber.text.trim();
    final displayEmail = email.text.trim();

    if (displayName.isEmpty ||
        displayAge.isEmpty ||
        displayNumber.isEmpty ||
        displayEmail.isEmpty) {
      return;
    }
    final student = StudentModel(
        name: displayName,
        age: displayAge,
        phonenumber: displayNumber,
        email: displayEmail);
    addStudent(student);
  }
}
