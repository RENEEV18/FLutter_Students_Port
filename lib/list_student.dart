import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_port/db/functions/db_functions.dart';
import 'package:student_port/details.dart';
import 'package:student_port/providers/student_provider.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, value, child) {
        return value.dataFound.isEmpty
            ? const Center(
                child: Text('No Results Found'),
              )
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = value.dataFound[index];
                  return ListTile(
                    title: Text(data.name),
                    leading:  CircleAvatar(
                        // backgroundImage: FileImage(
                        //   File(data.photo),
                        // ),
                        ),
                    trailing: IconButton(
                      onPressed: () {
                        onPressedDelete(
                          context,
                          data.id,
                        );
                      },
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 8, 8, 8),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Details(
                              // id: data.id,
                              // index:index ,
                              name: data.name,
                              age: data.age,
                              email:data. email,
                             // photo:data. photo,
                              phone:data.phonenumber,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: value.dataFound.length,
              );
      },
    );
  }
}

void onPressedDelete(BuildContext context, String index) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Delete"),
        content: const Text("Want to delete ?"),
        actions: [
          TextButton(
            onPressed: () {
              Provider.of<StudentProvider>(context, listen: false).deleteData(
                index,
                context,
                
              );
              Provider.of<StudentProvider>(context, listen: false).getAllData(context);
              
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
