import 'package:flutter/material.dart';
import 'package:my_sunday_sqf/Sqf_Database/myModel.dart';
import 'package:my_sunday_sqf/Sqf_Database/service.dart';

import 'get_SqfData.dart';

class UpdateSqfData extends StatefulWidget {
 final MyModel? model;
   UpdateSqfData({super.key, this.model});

  @override
  State<UpdateSqfData> createState() => _UpdateSqfDataState();
}

class _UpdateSqfDataState extends State<UpdateSqfData> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  getEditData(){
    nameController.text = widget.model!.name!;
    emailController.text = widget.model!.email!;
    passController.text = widget.model!.pass!;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEditData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Data'),),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passController,
          ),
          ElevatedButton(onPressed: (){
            var service = MyService();
            var model = MyModel();
            model.id = widget.model!.id;
            model.name = nameController.text.toString();
            model.email = emailController.text.toString();
            model.pass = passController.text.toString();
            service.updateData(model);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const GetSqfData()));
          }, child: const Text('Update'))
        ],),
      ),
    );
  }
}
