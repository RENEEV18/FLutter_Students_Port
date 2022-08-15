import 'package:flutter/material.dart';


class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
       backgroundColor: const Color.fromARGB(255, 7, 18, 54),
       body: SafeArea(child: ListView(
         children: 
           [Center(
             child: Container(
               height: 600,
               width: 350,
               decoration: BoxDecoration(
                 color: const Color.fromARGB(255, 178, 202, 221),
                 borderRadius: BorderRadius.circular(20),
           
               ),
               child: Column(
                 children: [
                   const SizedBox(height: 30,),
                   Stack(
                    children: [
                     const CircleAvatar(
                       radius: 80,
                       backgroundImage: NetworkImage('https://w7.pngwing.com/pngs/518/320/png-transparent-computer-icons-mobile-app-development-android-my-account-icon-blue-text-logo.png'),
                     ),
                     Positioned(
                   bottom: 0,
                   right: -2,
                   child:  RawMaterialButton(onPressed: (){},
                     elevation: 10,
                     fillColor: Colors.white,
                     shape:  const CircleBorder(
           
                     ),
                     child: const Icon(Icons.camera_alt_outlined),),
                   )
                    ],
                   ),
           
                   const SizedBox(height: 30,),
           
                   Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(40.0),
                       child: TextField(
                        
                         cursorColor: Colors.black,
                         decoration: InputDecoration(
                          
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(40),
                             
                           ),
                         ),
                       ),
                     ),
                   ],
                     ),
                  
           
                  
                 ],
               ),
             ),
           ),
         ],
       ),),
    );
  }
}