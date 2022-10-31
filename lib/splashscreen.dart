import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:student_port/providers/student_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentProvider().timerSplash(context);
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
          LoadingAnimationWidget.waveDots(color: Colors.blueAccent, size: 30),
        ],
      ),
    );
  }
}
