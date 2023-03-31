import 'package:flutter/material.dart';
import 'package:flutter_week6_sharerd_preference/feature/auth/login_page.dart';
import 'package:flutter_week6_sharerd_preference/feature/auth/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sPref=await SharedPreferences.getInstance();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),


    );
    // TODO: implement build
    throw UnimplementedError();
  }

}