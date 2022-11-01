import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_port/core/constants.dart';
import 'package:student_port/db/functions/db_functions.dart';
import 'package:student_port/db/model/data_model.dart';
import 'package:student_port/db/model/enum_studetn.dart';
import 'package:student_port/providers/student_provider.dart';
import 'package:student_port/studentportal.dart';
import 'package:student_port/widgets/listdetails.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({
    Key? key,
    this.name,
    this.age,
    this.email,
    this.phone,
    this.image,
    this.id,
    this.index,
    required this.type,
  }) : super(key: key);

  final String? name;
  final String? age;
  final String? email;
  final String? phone;
  final String? image;
  final String? id;
  final int? index;
  final Actiontype type;
  final studentName = TextEditingController();

  final _age = TextEditingController();

  final _phoneNumber = TextEditingController();

  final _email = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // editing screen switching

    if (type == Actiontype.editScreen) {
      studentName.text = name.toString();
      _age.text = age.toString();
      _email.text = email.toString();
      _phoneNumber.text = phone.toString();
    }
    //////////////////////////////////////////////

    final imagePicker = Provider.of<StudentProvider>(context, listen: false);
    //image in addscreen condition check.
    if (type == Actiontype.addScreen) {
      imagePicker.image == null;
    }
    /////////////////////////////////////////
    imagePicker.imageVisible = false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 228, 131, 245),
          title: Center(
            child: Text(
              'Add Student'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: const [
            SizedBox(
              width: 50,
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return StudentPortal();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      color: const Color.fromARGB(255, 228, 131, 245),
                      height: 160,
                      child: Center(
                        child: Stack(
                          children: [
                            Consumer(
                              builder: (context, StudentProvider value, child) {
                                return type == Actiontype.editScreen
                                    ? CircleAvatar(
                                        radius: 75,
                                        backgroundImage: FileImage(
                                          File(value.image?.path ?? image!),
                                        ),
                                      )
                                    : value.image == null
                                        ? const CircleAvatar(
                                            radius: 75,
                                            backgroundImage: AssetImage(kImage))
                                        : CircleAvatar(
                                            radius: 75,
                                            backgroundImage: FileImage(
                                                File(value.image!.path)),
                                          );
                              },
                            ),
                            Positioned(
                              bottom: 0,
                              right: -2,
                              child: RawMaterialButton(
                                onPressed: () async {
                                  imagePicker.getimage();
                                },
                                elevation: 10,
                                fillColor: Colors.white,
                                shape: const CircleBorder(),
                                child: const Icon(Icons.camera_alt_outlined),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<StudentProvider>(
                    builder: (context, value, child) {
                      return Visibility(
                        visible: value.imageVisible,
                        child: const Text(
                          ' Add Image',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  ListDetails(
                    keyboardType: TextInputType.name,
                    formValidator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                    controller: studentName,
                    text: const Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icons: const Icon(
                      Icons.person_pin,
                      color: Colors.black,
                    ),
                  ),
                  kHeight,
                  ListDetails(
                    formValidator: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length > 2) {
                        return 'Enter your Age in correct format';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: _age,
                    text: const Text(
                      'Age',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icons: const Icon(
                      Icons.app_registration,
                      color: Colors.black,
                    ),
                  ),
                  kHeight,
                  ListDetails(
                    formValidator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    controller: _email,
                    text: const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icons: const Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                  kHeight,
                  ListDetails(
                    formValidator: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length != 10) {
                        return 'Please enter valid phone number';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumber,
                    text: const Text(
                      'Phone',
                      maxLines: 10,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    icons: const Icon(
                      Icons.whatsapp,
                      color: Colors.black,
                    ),
                  ),
                  kHeight,
                  ElevatedButton(
                    onPressed: () {
                      if (type == Actiontype.addScreen) {
                        if (formKey.currentState!.validate() &&
                            imagePicker.image != null) {
                          studentSaveClicked(context);
                          imagePicker.imageVisible = false;
                        } else {
                          if (imagePicker.image != null) {
                            imagePicker.isVisible(imagePicker.image);
                          } else {
                            imagePicker.isVisible(imagePicker.image);
                          }
                        }
                      } else {
                        if (formKey.currentState!.validate()) {
                          studentSaveClicked(context);

                          imagePicker.imageVisible = false;
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 7, 55, 109),
                      elevation: 20,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> studentSaveClicked(BuildContext context) async {
    final imagePicker = Provider.of<StudentProvider>(context, listen: false);
    final studentFunction = Provider.of<StudentDb>(context, listen: false);

    final displayName = studentName.text.trim();
    final displayAge = _age.text.trim();
    final displayNumber = _phoneNumber.text.trim();
    final displayEmail = _email.text.trim();

    if (displayName.isEmpty ||
        displayAge.isEmpty ||
        displayNumber.isEmpty ||
        displayEmail.isEmpty) {
      return;
    }
    final student = StudentModel(
        photo: imagePicker.image?.path ?? image.toString(),
        name: displayName,
        age: displayAge,
        phonenumber: displayNumber,
        email: displayEmail,
        id: type == Actiontype.addScreen
            ? DateTime.now().microsecondsSinceEpoch.toString()
            : id.toString());
    type == Actiontype.addScreen
        ? studentFunction
            .addStudent(student)
            .then((value) => imagePicker.image = null)
        : studentFunction
            .updateStudent(index!.toInt(), student, context)
            .then((value) => imagePicker.image = null);

    if (type == Actiontype.editScreen) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => StudentPortal(),
          ),
          (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully edited records'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
    } else {
      Provider.of<StudentProvider>(context, listen: false).getAllData(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully added'),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
