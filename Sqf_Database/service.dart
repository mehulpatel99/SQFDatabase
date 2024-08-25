import 'package:flutter/material.dart';
import 'package:my_sunday_sqf/Sqf_Database/myModel.dart';
import 'package:my_sunday_sqf/Sqf_Database/myRepo.dart';

class MyService{
  MyRepo? _repo;

  MyService(){
    _repo = MyRepo();
  }

  getData()async{
    return await _repo?.getData('sunday');
  }

  insertData(MyModel _model)async{
    print('Data Inserted');
    return await _repo?.insertData('sunday', _model.userMap());
  }
  updateData(MyModel _model)async{
    return await _repo?.updateData('sunday', _model.userMap());
  }
  deleteData(MyModel _model)async{
    return await _repo?.deleteData('sunday', _model.userMap());
  }
  login({email,pass})async{
    return await _repo?.authLogin(email: email,pass: pass);
  }

}