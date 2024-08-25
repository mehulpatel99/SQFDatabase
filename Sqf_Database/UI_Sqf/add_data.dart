import 'package:flutter/material.dart';
import 'package:my_sunday_sqf/Sqf_Database/myModel.dart';
import 'package:my_sunday_sqf/Sqf_Database/service.dart';

import 'get_SqfData.dart';

class DataAddSqf extends StatefulWidget {
  const DataAddSqf({super.key});

  @override
  State<DataAddSqf> createState() => _DataAddSqfState();
}

class _DataAddSqfState extends State<DataAddSqf> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: 'Enter Your Name'),
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(hintText: 'Enter Your email'),
        ),
        TextField(
          controller: passController,
          decoration: InputDecoration(hintText: 'Enter Your password'),
        ),
        ElevatedButton(onPressed: (){
         var model = MyModel();
         var service  = MyService();
         model.name = nameController.text.toString();
         model.email = emailController.text.toString();
         model.pass = passController.text.toString();
         service.insertData(model);
         Navigator.push(context, MaterialPageRoute(builder: (context) => GetSqfData(),));
        }, child: Text('SignUp'))
      ],),),
    );
  }
}
