import 'package:flutter/material.dart';
import 'package:flutter_week6_sharerd_preference/feature/contact/model/contact_model.dart';

class InputContactFormPage extends StatelessWidget{
  InputContactFormPage({Key? key}):super(key: key);
  String? _fullname='';
  String? _nomorTelepon='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Book')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (valueFullName){
                _fullname=valueFullName;

              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),labelText: 'Full Name'),
              ),
      const SizedBox(height: 12.0),
      TextField(
        onChanged: (valuenomorTelepon)
    {
      _nomorTelepon = valuenomorTelepon;
    },
    decoration: const InputDecoration(
    prefix: Icon(Icons.phone),
    border: OutlineInputBorder(),
    labelText: 'nomor telepon'),

    ),
    const SizedBox(height: 12.0),
    Row(
    children: [
      Expanded(
        child: ElevatedButton(
          onPressed: (){
    Navigator.pop(
    context,
    DataContact(
    nama:_fullname??'',
    nomorTelepon: _nomorTelepon??'',

    //
    ),
    );
    },
      child: const Text('Submit'),
            )
    )
    ],
    )


  ]
        )
        )
,
  );
    // TODO: implement build
    //throw UnimplementedError();
  }


}