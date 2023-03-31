import 'package:flutter/material.dart';
import 'package:flutter_week6_sharerd_preference/feature/auth/login_page.dart';
import 'package:flutter_week6_sharerd_preference/feature/contact/ui/contact_page.dart';
import 'package:flutter_week6_sharerd_preference/main.dart';
import 'package:flutter_week6_sharerd_preference/utils/shared_preference_key.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}):super(key: key);

  @override
 State<SplashScreen> createState()=> _SplashScreenState();


}
class _SplashScreenState extends State<SplashScreen>{
  bool isLogin=false;
  @override
  void initState(){
    super.initState();
    isLogin=sPref.getBool(SharedPreferenceKey.isLogin)??false;
    checkRouting();

  }
  void checkRouting()async{
    Future.delayed(const Duration(seconds: 2),() {
      if (isLogin == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const ContactPage(),
        ),
        );
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
        );
      }
    }
      );


    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'images/splash_bg.jpg',
        height: MediaQuery
            .of(context)
            .size
            .height,
        fit: BoxFit.cover,
      ),
    );
    // TODO: implement build
    // throw UnimplementedError();


  }



}
 