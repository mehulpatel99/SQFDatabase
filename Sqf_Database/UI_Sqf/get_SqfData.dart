import 'package:flutter/material.dart';
import 'package:my_sunday_sqf/Sqf_Database/service.dart';

import '../myModel.dart';
import 'add_data.dart';
import 'edit_data.dart';

class GetSqfData extends StatefulWidget {
  const GetSqfData({super.key});

  @override
  State<GetSqfData> createState() => _GetSqfDataState();
}

class _GetSqfDataState extends State<GetSqfData> {

  List<MyModel> list = [];
  var _service = MyService();

  getDataFun()async{
    var _data = await _service.getData();
    _data.forEach((item){
      var model = MyModel();
      model.id = item['id'];
      model.name = item['name'];
      model.email = item['email'];
      model.pass = item['pass'];
      list.add(model);
      setState(() {
      });
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqf Data'),
      ),
      body: ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateSqfData(model: list[index],),));
          },
          child: Card(
            child: Column(children: [
              Text('Id = ${list[index].id}'),
              Text('Name = ${list[index].name}'),
              Text('Email = ${list[index].email}'),
              Text('password = ${list[index].pass}'),
              ElevatedButton(onPressed: (){
                var service = MyService();
                service.deleteData(list[index]);
              }, child: const Text('Delete'))
            ],),
          ),
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DataAddSqf()));
      },child: const Icon(Icons.add),),
    );
  }
}
