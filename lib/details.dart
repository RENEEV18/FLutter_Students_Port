import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_port/core/constants.dart';
import 'package:student_port/db/model/enum_studetn.dart';
import 'package:student_port/student_details.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.name,
      required this.age,
      required this.email,
      required this.photo,
      required this.phone,
      required this.id,
      required this.index})
      : super(key: key);
  final String name;
  final String age;
  final String email;
  final String photo;
  final String phone;
  final String id;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student Details',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(
                  File(photo),
                ),
              ),
              kHeight,
              Text(
                'Name : $name',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              kHeight,
              Text(
                'Age :  $age',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              kHeight,
              Text(
                'Email : $email',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              kHeight,
              Text(
                'Phone : $phone',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              kHeight,
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return StudentDetails(
                        name: name,
                        age: age,
                        email: email,
                        phone: phone,
                        type: Actiontype.editScreen,
                        id: id.toString(),
                        index: index,
                        image: photo,
                      );
                    },
                  ));
                },
                icon: const Icon(
                  Icons.edit_note_rounded,
                ),
                label: const Text('Edit'),
              ),
              const Image(
                  image: NetworkImage(
                      'https://cdni.iconscout.com/illustration/premium/thumb/students-attending-online-classes-2890099-2403436.png')),
            ])),
          ),
        ));
  }
}
