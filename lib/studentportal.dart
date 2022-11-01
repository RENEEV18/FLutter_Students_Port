import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_port/core/constants.dart';
import 'package:student_port/db/model/enum_studetn.dart';
import 'package:student_port/list_student.dart';
import 'package:student_port/providers/student_provider.dart';
import 'package:student_port/student_details.dart';

class StudentPortal extends StatelessWidget {
  StudentPortal({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      studentProvider.getAllData(context);
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 241),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<StudentProvider>().image = null;
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return StudentDetails(
              type: Actiontype.addScreen,
            );
          }));
        },
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
      drawer: Drawer(
        backgroundColor:const  Color.fromARGB(200, 255, 255, 255),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://career.webindia123.com/career/institutes/aspupload/Uploads/all-states/10010/logo.jpg'),
              radius: 60,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Home',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                  leading: const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Admission',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                  leading: const Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.black,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Settings',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'About Us ',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                    ),
                  ),
                  leading: const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Consumer<StudentProvider>(
          builder: (context, value, child) {
            return CupertinoSearchTextField(
              itemColor: Colors.black,
              backgroundColor: Colors.white,
              controller: searchController,
              onChanged: (value) {
                studentProvider.search(value);
              },
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 228, 131, 245),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                color: const Color.fromARGB(255, 228, 131, 245),
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.network(
                        'https://imgs.search.brave.com/bmuEQ0ev7KuH9Mujur1bD-dlGTwfKpzb4r_ypmvg3I4/rs:fit:676:450:1/g:ce/aHR0cHM6Ly9jZG5p/Lmljb25zY291dC5j/b20vaWxsdXN0cmF0/aW9uL3ByZW1pdW0v/dGh1bWIvc3R1ZGVu/dHMtc3R1ZHlpbmct/b25saW5lLTI5NzQ5/NDMtMjQ3NzM2OS5w/bmc'),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Welcome ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 3, 0, 187)),
                          ),
                          Text(
                            'To E-Learning Hub',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(240, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            kHeight,
            Row(
              children: const [
                kWidth,
                Icon(
                  Icons.school,
                ),
                kWidth10,
                Text(
                  'E-Records',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            kHeight,
            const ListStudent(),
          ],
        ),
      )),
    );
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
