

import 'package:flutter/material.dart';
import 'package:flutter_week6_sharerd_preference/feature/contact/ui/contact_page.dart';
import 'package:flutter_week6_sharerd_preference/main.dart';
import 'package:flutter_week6_sharerd_preference/utils/shared_preference_key.dart';

class LoginPage extends StatefulWidget{
  const LoginPage ({Key? key}):super(key: key);
  @override
  State<LoginPage> createState()=> _loginPageState();

}
class _loginPageState extends State<LoginPage>{
  static
  const String emailData = "saya@gmail.com";
  static const String passwordData = "123456";
  String email='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Contact Book')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (emailValue){
                email=emailValue;
                },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),labelText: 'email'),
              ),
              const SizedBox(height: 12.0),
              TextField(
                obscureText: true,
                onChanged: (isiPassword){
                  password=isiPassword;
                },
                decoration: const InputDecoration(
                  prefix: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'password'),

                ),
      const SizedBox(height: 12.0),
      Row(
        children: [
          Expanded(child: ElevatedButton(
            onPressed: ()async {
              if(email.contains(emailData)&&
              password.contains(passwordData)){
                await sPref.setString(
                  SharedPreferenceKey.username,email);

                await sPref.setString(
                  SharedPreferenceKey.password,password);

                await sPref
                  .setBool(SharedPreferenceKey.isLogin,true)
                .then((value){
                  Navigator.of(context).push(MaterialPageRoute
                    (builder: (_)=> const ContactPage(),
                  ),
                  );
                }
                );
              }else{
                await sPref
                    .setBool(SharedPreferenceKey.isLogin,false)
                    .then((value){
                   showDialog(context: context,
                       builder: (context){
                     return const AlertDialog(
                       title: Text('Opppss.. zonk'),
                       content: Text('Email atau Password salah'),

                     );
                       },
                   );
                });
              }
            },
            child: const Text('LOGIN'),
          ))
        ],
      )
          ],
        ),
      ),
    );
  }
}