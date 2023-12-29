import 'package:flutter/material.dart';
import 'package:super_mario/home.dart';
import "package:flutter/services.dart";

void main()async  {
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: homeLayout(),
    );
  }
}
