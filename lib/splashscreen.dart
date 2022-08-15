import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_port/studentportal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    studentport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Image(
                image: NetworkImage(
                    'https://www.admissioncounselor.in/im/college/logo/sambhram-institute-of-technology-bangalore.jpg'),
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 30),
        ],
      ),
    );
  }

  Future<void> studentport() async {
    await Future.delayed(const Duration(seconds: 30));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const StudentPortal();
    }));
  }
}
