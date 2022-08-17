import 'package:flutter/material.dart';
import 'package:student_port/db/functions/db_functions.dart';

import 'db/model/data_model.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentlistNotifier,
      builder: (BuildContext context, List<StudentModel> studentlist,
          Widget? child) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = studentlist[index];
            return Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
              child: Card(
                elevation: 12,
                color:Color.fromARGB(255, 72, 156, 224),
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  
                ),
                child: ListTile(
                  title: Text(data.name),
                  leading: const CircleAvatar(
                   backgroundImage: NetworkImage('https://career.webindia123.com/career/institutes/aspupload/Uploads/all-states/10010/logo.jpg'),
                  ),
                  trailing: IconButton(onPressed: (){
                   if(index != null)
                   {
                     deleteStudent(index);
                   }
                  }, icon: const Icon(Icons.delete),color: const Color.fromARGB(255, 8, 8, 8),),
                 
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: studentlist.length,
        );
      },
    );
  }


  void onTapCard(){


  }
}
