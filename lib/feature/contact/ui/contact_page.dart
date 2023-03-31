import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_week6_sharerd_preference/feature/contact/model/contact_model.dart';
import 'package:flutter_week6_sharerd_preference/feature/contact/ui/input_contact_form_page.dart';
import 'package:flutter_week6_sharerd_preference/main.dart';
import 'package:flutter_week6_sharerd_preference/utils/shared_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatefulWidget{
  const ContactPage({Key? key}):super(key: key);

  @override
  State<ContactPage> createState()=> _ContactPageState();

}
class _ContactPageState extends State<ContactPage>{
  ContactModel _contactData=ContactModel(data: []);
  @override
  void initState(){
    super.initState();
    initDataLocal();

  }
  void initDataLocal(){
    var datalocal = sPref.getString(SharedPreferenceKey.contactListPref);
    var contactDataLocal= ContactModel(data: []);

    if(datalocal!=null){
      contactDataLocal=ContactModel.fromJson(
          jsonDecode(datalocal),
    );
    }
    if (contactDataLocal.data.isNotEmpty){
      _contactData=contactDataLocal;
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('contack book')),
      body: ListView.builder(
        itemCount: _contactData.data.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Column(
            children: [
              ListTile(
                title: Text(_contactData.data[index].nama),
                subtitle: Text(_contactData.data[index].nomorTelepon),
              ),
              const Divider(
                thickness: 1.0,
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          Navigator.of(context)
              .push(MaterialPageRoute<DataContact>(
            builder: (_)=>InputContactFormPage()
          ))
              .then((navigationData)async{
                _contactData.data.add(
                  DataContact(
                    nama: navigationData?.nama??'',
                    nomorTelepon: navigationData?.nomorTelepon??''),
                  );
                await sPref.setString(
                //await sharedpref.setString(
                  SharedPreferenceKey.contactListPref,
                  jsonEncode(
                    _contactData.toJson(),
                    
                  ),
                );
                setState(() {            
                });
          }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
