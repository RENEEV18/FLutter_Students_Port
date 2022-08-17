import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_port/db/model/data_model.dart';
import 'package:student_port/splashscreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
 {
   Hive.registerAdapter(StudentModelAdapter());
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,
      primarySwatch: Colors.deepOrange),
      home: const SplashScreen(),
    );
  }
}
