import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_port/student_details.dart';

class StudentPortal extends StatelessWidget {
  const StudentPortal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 18, 54),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
            return const StudentDetails();
          }));
        },
        child: const Icon(Icons.person_add_alt_1_rounded),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 178, 186, 197),
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
                  icon: Icon(Icons.arrow_back_ios)),
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
        title: Text('Dashboard', style: GoogleFonts.acme()),
      ),
    );
  }

}
