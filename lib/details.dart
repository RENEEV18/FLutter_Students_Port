import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 178, 202, 221),
      appBar: AppBar(
        title: Text('Student Details',style:
        TextStyle(
          fontSize: 20,
          color: Colors.black,
          
        ),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon:Icon(Icons.arrow_back_ios_new)),

      ),
    );
  }
}